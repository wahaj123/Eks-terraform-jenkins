terraform {
  backend "s3" {
    bucket         = "wahaj-githubaction"
    key            = "terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "wahaj-lock"
  }
}