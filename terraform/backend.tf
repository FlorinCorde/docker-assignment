terraform {
  backend s3 {
    bucket = "team-y-bucket"
    key = "test/terraform.tfstate"
    region = "us-east-1"
  }
}