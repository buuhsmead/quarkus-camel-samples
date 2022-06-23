package camel.quarkus.kafka.openshift.external.client.mtls;

import javax.enterprise.context.ApplicationScoped;

import org.apache.camel.builder.RouteBuilder;


@ApplicationScoped
public class KafkaReader extends RouteBuilder {

  @Override
  public void configure() throws Exception {
        // kafka consumer
        from("kafka:{{kafka.topic.name}}")
                .routeId("FromKafkaReader")
                .log("Message received from Kafka : ${body}")
                .log("    on the topic [${headers[kafka.TOPIC]}]")
                .log("    on the partition [${headers[kafka.PARTITION]}]")
                .log("    with the offset [${headers[kafka.OFFSET]}]")
                .log("    with the key [${headers[kafka.KEY]}]")
                ;
  }

}
