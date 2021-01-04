package elk

import (
	"fmt"
	"github.com/astaxie/beego/logs"
	"github.com/hpcloud/tail"
	"strings"
	"sync"
)

type TailMgr struct {
	tailObjMap map[string]*TailObj
	lock sync.Mutex
}

type TailObj struct {
	tail *tail.Tail
	offset int64
	filename string
}

var tailMgr *TailMgr
var waitGroup sync.WaitGroup

func NewTailMgr() (*TailMgr) {
	tailMgr = &TailMgr{
		tailObjMap: make(map[string]*TailObj),
	}
	return tailMgr
}

func (t *TailMgr) AddLogFile(filename string) (err error) {
	t.lock.Lock()
	defer t.lock.Unlock()
	if _, ok := t.tailObjMap[filename]; ok {
		err = fmt.Errorf("duplicate filename: %s\n", filename)
		return
	}
	tail, err := tail.TailFile(filename, tail.Config{
		ReOpen:true,
		Follow:true,
		Location:&tail.SeekInfo{Offset:0,Whence:2},
		MustExist:false,
		Poll:true,
	})
	tailObj := &TailObj{
		filename: filename,
		offset: 0,
		tail: tail,
	}

	t.tailObjMap[filename] = tailObj
	return
}

func (t *TailMgr) Process() {
	for _, TailObj := range t.tailObjMap {
		waitGroup.Add(1)
		go TailObj.readLog()
	}
}

func (t *TailObj) readLog() {
	for line := range t.tail.Lines {
		if line.Err != nil {
			logs.Error("read line failed err: %v", line.Err)
			continue
		}
		str := strings.Trim(line.Text)
		if len(str) == 0 || str[0] == '\n' {
			continue
		}
		kafkaSender.addMessage(line.Text)
	}
	waitGroup.Done()
}

func RunServer() {
	tailMgr = NewTailMgr()
	for _, filename := range []string{} {
		if err := tailMgr.AddLogFile(filename); err != nil {
			logs.Error("add log file failed, err: %v", err)
			continue
		}
	}
	tailMgr.Process()
	waitGroup.Wait()
}
