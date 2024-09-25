# BP_DevOPS_Workshop
BP_DevOPS_Workshop




# Dev environment

0. Setup

git clone

1. In development: Init the terraform with another backend!. Plan the with devtest.tfvars


terraform init -backend-config="backend=local"

terraform plan -var-file="dev.tfvars"


2. In the CI/CD pipeline 




# Test and Prod environment (CI/CD)