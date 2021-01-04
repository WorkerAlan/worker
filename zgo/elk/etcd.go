package elk

import etcd_client "github.com/coreos/etcd/clientv3"

func main() {

	cli, err := etcd_client.New(etcd_client.Config{

	})
}


func