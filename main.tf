data "aws_caller_identity" "current" {}

module "lambda_add" {
  source                   = "./modules/lambda"
  name                     = var.add
}
