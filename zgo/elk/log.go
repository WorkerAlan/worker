package elk

import (
	"encoding/json"
	"fmt"
	"github.com/astaxie/beego/logs"
)

func main() {
	config := make(map[string]interface{})
	config["filename"] = "/log/my.log"
	config["level"] = logs.LevelTrace
	configStr, err := json.Marshal(config)
	if err != nil {
		fmt.Println("marshal failed, err: ", err)
		return
	}
	logs.SetLogger(logs.AdapterFile, string(configStr))
	logs.Debug("this is a debug, my name is: %s", "stu01")
}
