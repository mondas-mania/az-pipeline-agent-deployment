# Image build

This is code and resources related to building and pushing the Azure Pipelines Agent container image.
It is currently unknown if this should be deployed via pipeline going forward or manually, given the fact we will not already have an agent to run pipelines on to start with.

Code and files taken and adapted from Microsoft official documentation ([x](https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/docker?view=azure-devops#windows)).

## Commands to run locally

These commands can be run directly from this current directory. Azure Pipelines alternatives to these commands can be found at [Pipeline stages](#azure-pipeline-stages).

### Build the image

```sh
cd azp-agent-in-docker
docker build --tag "azp-agent:windows" --file "./azp-agent-windows.dockerfile" .
```

### Push the image to ACR

For this you will need to fill in the registry name used in the previous Terraform stage. This will be the value you used in `var.acr_registry_name`.

```sh
export REGISTRY_NAME=[insert registry name]
export REGISTRY_URL=${REGISTRY_NAME}.azurecr.io
export IMAGE_TAG=azp-agent:windows
docker tag $IMAGE_TAG ${REGISTRY_URL}/$IMAGE_TAG
docker push ${REGISTRY_URL}/$IMAGE_TAG
```

## Azure Pipeline stages

In order to carry this out you need to configure a Docker Registry Service Connection to your previously-built Azure Container Registry, which can be done with the following instructions ([x](https://learn.microsoft.com/en-us/azure/devops/pipelines/library/service-endpoints?view=azure-devops&tabs=yaml#create-a-service-connection)).

The following Docker@2 tasks are documented here ([x](https://learn.microsoft.com/en-us/azure/devops/pipelines/tasks/reference/docker-v2?view=azure-pipelines&tabs=yaml)) and the solution is adapted from ([x](https://stackoverflow.com/a/74326635)).

```yaml
- task: Docker@2
  displayName: BuildDockerContainer
  workingDirectory: terraform/1-image-build/azp-agent-in-docker
  inputs:
    command: build
    containerRegistry: [service connection]
    Dockerfile: azp-agent-windows.dockerfile
    repository: [registry name].azurecr.io
    tags: azp-agent:windows
    arguments: add any label that you want here and supported by Docker (--platform linux/amd64,linux/arm64)

- task: Docker@2
  displayName: PushDockerImageToRegisitry
  workingDirectory: terraform/1-image-build/azp-agent-in-docker
  inputs:
    command: push
    containerRegistry: [service connection]
    repository: [registry name].azurecr.io
    tags: azp-agent:windows
```