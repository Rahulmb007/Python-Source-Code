provider "aws" {
}


terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }

  }

  required_version = ">= 1.0"
}

resource "aws_launch_configuration" "awseb_e_jhgmmvyhm6_stack_awsebautoscalinglaunchconfiguration_1dmnirb62f0z4" {
  associate_public_ip_address = true
  ebs_block_device {
    delete_on_termination = true
    device_name           = "/dev/xvdcz"
    volume_size           = 12
    volume_type           = "gp2"
  }

  enable_monitoring    = true
  iam_instance_profile = "aws-elasticbeanstalk-ec2-role"
  image_id             = "ami-ee5737f9"
  instance_type        = "c4.2xlarge"
  key_name             = "airpr"
  name                 = "awseb-e-jhgmmvyhm6-stack-AWSEBAutoScalingLaunchConfiguration-1DMNIRB62F0Z4"
  security_groups      = ["sg-35c43f4f", "sg-0b62a75aaabffda10"]
  user_data            = "2d0f1cce8e8a8dd165d709536220525d0dcaee47"
}

resource "aws_launch_configuration" "ec2containerservice_default_7dbb6d1a_5219_4e32_b47d_96f286a588ac_ecsinstancelc_1i5s0z41ctxz0" {
  associate_public_ip_address = true
  enable_monitoring           = true
  iam_instance_profile        = "airpr-elasticsearch-ec2-role"
  image_id                    = "ami-8da458e6"
  instance_type               = "t2.micro"
  key_name                    = "airpr"
  name                        = "EC2ContainerService-default-7dbb6d1a-5219-4e32-b47d-96f286a588ac-EcsInstanceLc-1I5S0Z41CTXZ0"
  security_groups             = ["sg-1ebe4c79"]
  user_data                   = "63b0daaf0b692654435e1569d1e9b1cb71511243"
}

resource "aws_launch_configuration" "ec2containerservice_visitor_estimation_ecsinstancelc_114o91sv9ctk2" {
  associate_public_ip_address = true
  ebs_block_device {
    delete_on_termination = false
    device_name           = "/dev/xvdcz"
    volume_size           = 22
    volume_type           = "gp2"
  }

  enable_monitoring    = true
  iam_instance_profile = "arn:aws:iam::484375727565:instance-profile/EMR_EC2_DefaultRole"
  image_id             = "ami-0a6a36557ea3b9859"
  instance_type        = "m5.large"
  key_name             = "grant"
  name                 = "EC2ContainerService-visitor-estimation-EcsInstanceLc-114O91SV9CTK2"
  security_groups      = ["sg-0fbe6947e8cd35798"]
  user_data            = "6e2ce8cd189df691369b59fb8ec448defdf652f9"
}

resource "aws_launch_configuration" "ecs_launch_config" {
  associate_public_ip_address = true
  enable_monitoring           = true
  iam_instance_profile        = "ecs_profile"
  image_id                    = "ami-112e366e"
  instance_type               = "t2.medium"
  key_name                    = "onclusive-2021.08.31"
  name                        = "ecs_launch_config"
  security_groups             = ["sg-fa2193b2"]
  user_data                   = "aee2c65664742f4513c9dfd78e1235dbd7e7e77a"
}

resource "aws_launch_configuration" "placeholder_launch_config" {
  image_id      = "ami-b73b63a0"
  instance_type = "t2.micro"
  key_name      = "airpr"
  name          = "placeholder-launch-config"
  root_block_device {
    delete_on_termination = true
    volume_size           = 8
    volume_type           = "gp2"
  }

  security_groups = ["sg-7f04a269"]
}

