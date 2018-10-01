@Library('ascent') _

dockerPipeline {
    dockerBuilds = [
        "ascent/rabbitmq": ".",
    ]

    /*********  Deployment Configuration ***********/
    stackName = "messaging"
    serviceName = "ascent-amqp"

    //Default Deployment Configuration Values
    //composeFiles = ["docker-compose.yml"]
}
