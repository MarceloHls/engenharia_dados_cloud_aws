provider "aws" {
  region = var.region_name
}


terraform {
  backend "s3" {
    bucket ="terraform-satet"
    key = "state/igti/terraform.tfstate"
    region= "sa-east-1"
    
  }
}