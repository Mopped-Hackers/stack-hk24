# Azure Container Apps Template - Work In Progress


## Setup Environment 

```bash
terraform init
```

```bash
terraform apply
```



## Update container with new image

```bash 
bash update.sh <Container-App-Name> <Image>
```

Full command:

```bash
az containerapp update --name <Container-App-Name> --resource-group <Resource-Group-Name> --image <Image-Url>:<Tag>
```

## Github Actions for Container Update Image

1. Uncomment deploy.tf + Update values for <VARIABLES>
2. Create Github Actions from ./github-actions/github-action-template.yml + Update values for <VARIABLES>
3. Create repository secrets with values from output.json (terraform output -json >> output.json) -> CLIENT_ID, TENANT_ID, SUBSCRIPTION_ID



## Docs:
https://learn.microsoft.com/en-us/cli/azure/containerapp?view=azure-cli-latest

https://learn.microsoft.com/en-us/azure/container-apps/containers#sidecar-containers

https://medium.com/@vivazmo/azure-container-apps-container-with-terraform-azure-key-vault-for-secrets-part-2-f888d9d682de


# TODO:

- write everything as module with loop 

https://spacelift.io/blog/terraform-conditionals

