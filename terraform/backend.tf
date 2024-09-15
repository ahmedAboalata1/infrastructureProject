terraform {
  backend "s3" {
    bucket         = "projectqalsw1"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "projectQal"
  }
}
