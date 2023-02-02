# Setup Terraform

Execute in the 'terraform' after google cloud is installed and initialized with the project and the environment variables are set appropriately

```bash
# Refresh service-account's auth-token for this session
gcloud auth application-default login

# Initialize state file (.tfstate)
terraform init

# Check changes to new infra plan
terraform plan -var="project=$TF_VAR_project"

# Create new infra
terraform apply -var="project=$TF_VAR_project"

# Delete infra after your work, to avoid costs on any running services
terraform destroy
```