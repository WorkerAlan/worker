package elk

import (
	"github.com/Shopify/sarama"
	"github.com/astaxie/beego/logs"
)

var (
	client sarama.SyncProducer
	kafkaSender KafkaSender
)

type KafkaSender struct {
	client sarama.SyncProducer
	lineChan chan string
}

func NewKafakaSender(kafkaAddr string) (kafka *KafkaSender, err error) {
	kafka = &KafkaSender {
		lineChan: make(chan string, 10000),
	}
	config := sarama.NewConfig()
	config.Producer.RequiredAcks = sarama.WaitForAll
	config.Producer.Partitioner = sarama.NewRandomPartitioner
	config.Producer.Return.Successes = true

	client, err := sarama.NewSyncProducer([]string{kafkaAddr}, config)
	if err != nil {
		logs.Error("init kafka client failed, err: %v\n", err)
		return
	}

	kafka.client = client
	for i := 0; i < 10; i++ {
		go kafka.sendToKafka()
	}
	return
}

func (k *KafkaSender)sendToKafka() {
	for v := range k.lineChan {
		msg := &sarama.ProducerMessage{}
		msg.Topic = "alan"
		msg.Value = sarama.StringEncoder(v)
		_, _, err := k.client.SendMessage(msg)
		if err != nil {
			logs.Error("send message to kafka failed, err: ", err)
		}
	}
}

func (k *KafkaSender)addMessage(line string) error {
	k.lineChan <- line
	return
}