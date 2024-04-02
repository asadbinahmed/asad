terraform init -backend-config="dev.backend.config"
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"
terraform destroy -var-file="dev.tfvars"

terraform init -backend-config="prod.backend.config"
terraform plan -var-file="prod.tfvars"
terraform apply -var-file="prod.tfvars"
terraform destroy -var-file="prod.tfvars"