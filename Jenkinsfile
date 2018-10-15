@Library('ascent@dev-undeploy') _

dockerPipeline {
    dockerBuilds = [
        "ascent/rabbitmq": ".",
    ]

    /*********  Deployment Configuration ***********/
    stackName = "messaging"
    serviceName = "ascent-amqp"

    vaultTokens = [
        "VAULT_TOKEN": "ascent-platform"
    ]

    //Default Deployment Configuration Values
    //composeFiles = ["docker-compose.yml"]
}
