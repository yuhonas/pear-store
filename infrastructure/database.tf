locals {
  application = "spotter"
}

provider "aws" {
  default_tags {
    tags = {
      Application = local.application
      Environment = "staging"
      ProvisionedBy = "terraform"
    }
  }

  region = "us-east-1"
}

# module "module" {
#   source  = "hashicorp/module/random"
#   version = "1.0.0"
# }
#
# resource "random_password" "password" {
#   length           = 16
#   special          = true
#   override_special = "!#$%&*()-_=+[]{}<>:?"
# }
#
# resource "aws_db_instance" "default" {
#   allocated_storage    = 10
#   db_name              = "mydb"
#   engine               = "mysql"
#   engine_version       = "5.7"
#   instance_class       = "db.t3.micro"
#   username             = "foo"
#
#   # NOTE: The password will be stored in plaintext in the terraform state file, a solution using key management
#   # would be a more secure solution if that is important
#   password             = random_password.password.result
#
#   parameter_group_name = "default.mysql5.7"
#   skip_final_snapshot  = true
# }
#
#
# output "database_identifier" {
#   value = aws_db_instance.default.id
# }
#
# output "database_password" {
#   value = aws_db_instance.default.password
#   sensitive = true
# }

resource "aws_elastic_beanstalk_application" "app" {
  name        = local.application
  # description = "tf-test-desc"
}

resource "aws_elastic_beanstalk_environment" "env" {
  name                = local.application
  application         = aws_elastic_beanstalk_application.app.name
  solution_stack_name = "64bit Amazon Linux 2 v3.4.2 running Python 3.8"

  setting {
      namespace = "aws:autoscaling:launchconfiguration"
      name = "IamInstanceProfile"
      value = "aws-elasticbeanstalk-ec2-role"
  }
}


output "beanstalk_application_name" {
  value = aws_elastic_beanstalk_application.app.name
}
