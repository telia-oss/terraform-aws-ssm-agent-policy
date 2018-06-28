provider "aws" {
  region = "eu-west-1"
}

data "aws_vpc" "main" {
  default = true
}

data "aws_subnet_ids" "main" {
  vpc_id = "${data.aws_vpc.main.id}"
}

module "asg" {
  source  = "telia-oss/asg/aws"
  version = "0.2.0"

  name_prefix       = "example"
  user_data         = "#!bin/bash\necho hello world"
  vpc_id            = "${data.aws_vpc.main.id}"
  subnet_ids        = ["${data.aws_subnet_ids.main.ids}"]
  await_signal      = "false"
  pause_time        = "PT3M"
  health_check_type = "EC2"
  instance_ami      = "ami-921423eb"
  instance_type     = "t2.micro"

  tags {
    environment = "prod"
    terraform   = "True"
  }
}

module "ssm_agent_policy" {
  source = "../../"

  name_prefix = "example"
  role        = "${module.asg.role_name}"
}
