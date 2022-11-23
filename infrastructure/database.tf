provider "aws" {
  default_tags {
    tags = {
      Application = "spotter"
      Environment = "staging"
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

resource "aws_apprunner_connection" "example" {
  connection_name = "example"
  provider_type   = "GITHUB"
}

resource "aws_apprunner_service" "example" {
  service_name = "example"

  source_configuration {
    authentication_configuration {
      connection_arn = aws_apprunner_connection.example.arn
    }
    code_repository {
      code_configuration {
#        code_configuration_values {
#          build_command = "python setup.py develop"
#          port          = "8000"
#          runtime       = "PYTHON_3"
#          start_command = "python app.py"
#        }
        configuration_source = "API"
      }
      repository_url = "https://github.com/aws-containers/hello-app-runner"
      source_code_version {
        type  = "BRANCH"
        value = "main"
      }
    }
  }

#  network_configuration {
#    egress_configuration {
#      egress_type       = "VPC"
#      vpc_connector_arn = aws_apprunner_vpc_connector.connector.arn
#    }
  #}
}
