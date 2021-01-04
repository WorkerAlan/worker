package elk

import (
	"fmt"
	"github.com/hpcloud/tail"
	"time"
)

func main() {
	filename := "/log/my.log"
	tails, err := tail.TailFile(filename, tail.Config{
		ReOpen: true,
		Follow: true,
		Location: &tail.SeekInfo{Offset: 0, Whence: 2},
		MustExist: false,
		Poll: true,
	})

	if err != nil {
		fmt.Print("tail file err: ", err)
		return
	}

	for {
		if msg, ok := <- tails.Lines; ok {
			fmt.Println("msg: ", msg.Text)
			continue
		}
		fmt.Println("tail file close repon, filename: ", tails.Filename)
		time.Sleep(100 * time.Millisecond)
	}
}
