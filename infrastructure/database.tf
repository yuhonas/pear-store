locals {
  application = "spotter"
  environment = "staging"
}

provider "aws" {
  default_tags {
    tags = {
      Application = local.application
      Environment = local.environment
      ProvisionedBy = "terraform"
    }
  }

  region = "us-east-1"
}

module "module" {
  source  = "hashicorp/module/random"
  version = "1.0.0"
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_elastic_beanstalk_application" "app" {
  name                = "${local.application}-${local.environment}"
}

resource "aws_elastic_beanstalk_environment" "env" {
  name                = "${local.application}-${local.environment}"
  application         = aws_elastic_beanstalk_application.app.name
  solution_stack_name = "64bit Amazon Linux 2 v3.4.2 running Python 3.8"

  setting {
      namespace = "aws:autoscaling:launchconfiguration"
      name = "IamInstanceProfile"
      value = "aws-elasticbeanstalk-ec2-role"
  }

  setting {
      namespace = "aws:rds:dbinstance"
      name      = "DBAllocatedStorage"
      value     = "5"
  }

  setting {
    namespace = "aws:rds:dbinstance"
    name      = "DBDeletionPolicy"
    value     = "Delete"
  }

  setting {
    namespace = "aws:rds:dbinstance"
    name      = "HasCoupledDatabase"
    value     = "true"
  }

  setting {
    namespace = "aws:rds:dbinstance"
    name      = "DBEngine"
    value     = "postgres"
  }

  setting {
    namespace = "aws:rds:dbinstance"
    name      = "DBEngineVersion"
    value     = "14"
  }

  setting {
    namespace = "aws:rds:dbinstance"
    name      = "DBInstanceClass"
    value     = "db.t3.micro"
  }

  setting {
    namespace = "aws:rds:dbinstance"
    name      = "DBPassword"
    value     = random_password.password.result
  }

  setting {
    namespace = "aws:rds:dbinstance"
    name      = "DBUser"
    value     =  local.application
  }
}

output "beanstalk_application_name" {
  value = aws_elastic_beanstalk_application.app.name
}

output "database_password" {
  value = random_password.password.result
  sensitive = true
}
