data "aws_caller_identity" "current" {}

module "lambda_add" {
  source                   = "./modules/lambda"
  name                     = var.add
}

module "lambda_delete" {
  source                   = "./modules/lambda"
  name                     = var.delete
}

module "lambda_update" {
  source                   = "./modules/lambda"
  name                     = var.update
}

module "lambda_get" {
  source                   = "./modules/lambda"
  name                     = var.get
}

