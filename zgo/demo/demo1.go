package demo1

import (
	"bufio"
	"crypto/sha1"
	"encoding/base64"
	"fmt"
	"io"
	"io/ioutil"
	"math/rand"
	"net/http"
	"os"
	"os/exec"
	"os/signal"
	"path/filepath"
	"reflect"
	"strings"
	"sync"
	"sync/atomic"
	"syscall"
	testing2 "testing"
	"time"
)

func demo2() {
	mes := make(chan string)
	go func() {
		msg <- ""
	}()
	_ = <- msg
	fmt.Print(msg)
}

func ping(pings chan<- string, msg string) {
	pings <- msg
}

func pong(pings <-chan string, pongs chan <- string) {
	pongs <- <- pings
}

func main2() {
	select {
	case <-time.After(1*time.Second):
		fmt.Println("demo")
	}
}

func main3() {
	jobs := make(chan int, 5)
	done := make(chan bool)
	go func() {
		for {
			j, more := <- jobs
			if more {
				fmt.Println("receive job", j)
			} else {
				fmt.Println("recive all jobs")
				done <- true
				return
			}
		}
	}()

	timer1 := time.NewTimer(2 * time.Second)
	<- timer1.C

	go func() {
		<- timer1.C
	}()

	if timer1.Stop() {
		fmt.Println("timer1 stop")
	}

	for j := 1; j <= 3; j++ {
		jobs <- j
	}
	close(jobs)
	close(done)
	<-done
	for e := range done {
		fmt.Println(e)
	}

	ticker := time.NewTicker(500 * time.Millisecond)
	done := make(chan bool)
	go func() {
		for {
			select {
			case <- done:
				return
			case t := <- ticker.C:
				fmt.Println(t)
			}
		}
	}()

	time.Sleep(100 * time.Millisecond)
	ticker.Stop()
	done <- true
}

func main3() {
	const numJobs = 5
	jobs := make(chan int, numJobs)
	results := make(chan int, numJobs)
	for w := 1; w <= 3; w++ {
		go worker(w, jobs, results)
	}

	for j := 1; j < numJobs; j++ {
		jobs <- j
	}
	close(jobs)
	for a := 1; a <= numJobs; a++ {
		<-results
	}
}

func worker(id int, jobs <-chan int, results chan<- int) {
	for j := range jobs {
		results <- j * 2
	}
}

func main4() {
	var wg sync.WaitGroup
	for i := 0; i <= 5; i++ {
		wg.Add(1)
		go worker2(i, &wg)
	}
}

func worker2(i int, wg *sync.WaitGroup) {
	defer wg.Done()
}

func main4() {
	requests := make(chan int, 5)
	for i := 1; i < 5; i++ {
		requests <- i
	}
	close(requests)
	limiter := time.Tick(200*time.Millisecond)
	for req := range requests {
		<-limiter
		print(req, time.Now())
	}

	burstyLimiter := make(chan time.Time, 3)

	for i := 0; i < 3; i++  {
		burstyLimiter <- time.Now()
	}

	go func() {
		for t := range time.Tick(200*time.Millisecond) {
			burstyLimiter <- t
		}
	}()

	burstRequests := make(chan int, 5)
	for i := 1; i <= 5; i++ {
		burstRequests <- i
	}

	close(burstRequests)
	for req := range burstRequests {
		<- burstRequests
		fmt.Println("req", req)
	}
}

func main5() {
	var mutex = &sync.Mutex{}

	var readOps uint64
	var writeOps uint64
	key := rand.Intn(5)
	mutex.Lock()
	mutex.Unlock()
	atomic.AddUint64(&readOps, 1)
}

func main6() {
	h := sha1.New()
	h.Write([]byte("string"))
	bs := h.Sum(nil)
	fmt.Println(bs)

	base64.StdEncoding.EncodeToString([]byte("ddd"))
	base64.StdEncoding.DecodeString()
	base64.URLEncoding.EncodeToString()

	dat, err := ioutil.ReadFile("/tmp/dat")
	b1, err := os.Open("/tmp/dat")
	b1.Read()
	b1.Seek()
	io.ReadAtLeast()
	scanner := bufio.NewScanner(os.Stdin)
	for scanner.Scan() {
		url := strings.ToUpper(scanner.Text())
		fmt.Println(url)
	}

	if err := scanner.Err(); err != nil {
		fmt.Fprint(os.Stderr, "error:", err)
		os.Exit(1)
	}

	filepath.Join("dir1", "222")
	_ = os.Mkdir("subdir", 0755)
	os.RemoveAll("subdir")

	f, err := ioutil.TempFile("", "sample")
	defer os.RemoveAll(f)
	f.Write([]byte("333"))
}

func TestInminTab(t *testing2.T) {
	t.Run("SSS", func(t2 *testing2.T) {
		t.Error(t)
	})
	req := &http.Request{}
	ctx := req.Context()
	select {
	case <- time.After(10*time.Second):
		fmt.Println("a")
		case <-ctx.Done():
			//err := ctx.Err()
			//internaleError := http.StatusInternalServerError
			//http.Error()
	}
}

func main7() {
	dateCmd := exec.Command("date")
	dateOut, err := dateCmd.Output()
	dateCmd.StdinPipe()
	dateCmd.StdoutPipe()

	sigs := make(chan os.Signal, 1)
	done := make(chan bool, 1)

	signal.Notify(sigs, syscall.SIGINT, syscall.SIGTERM)
	go func() {
		sig := <-sigs
		fmt.Println(sig)
		done <- true
	}()
	<-done
}

func main8() {
	reflect.Type(1).Field(0)
	reflect.ValueOf(1)

	reflect.ValueOf(1)
}

func h