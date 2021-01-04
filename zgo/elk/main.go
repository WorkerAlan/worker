package elk

import (
	"context"
	"fmt"
	"io/ioutil"
	"net/http"
	"time"
)

type Result struct {
	r *http.Response
	err error
}

func process() {
	ctx, cancel := context.WithTimeout(context.Background(), 2 * time.Second)
	defer cancel()
	tr := &http.Transport{}
	client := &http.Client{tr}
	c := make(chan Result, 1)
	req, err := http.NewRequest("GET", "http://www.google.com", nil)
	if err != nil {
		fmt.Println("http request failed, err: ", err)
		return
	}
	go func() {
		resp, err := client.Do(req)
		pack := Result{resp, err}
		c <- pack
	}()

	select {
	case <- ctx.Done():
		tr.CancelRequest(req)
		fmt.Println("timeout")
		case res := <-c:
		defer res.r.Body.Close()
		out, _ := ioutil.ReadAll(res.r.Body)
		fmt.Println("server response: %s", out)
	}
	return
}