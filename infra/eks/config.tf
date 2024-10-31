terraform {
  backend "s3" {
    bucket         = "jmgarciadelmoral-tfstates"
    key            = "sherpany/polls/eks-cluster/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
