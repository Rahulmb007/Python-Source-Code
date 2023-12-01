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

resource "aws_autoscaling_schedule" "awseb_e_jhgmmvyhm6_stack_awsebautoscalinggroup_hh0rwvk7feap_awseb_satur_1v8nig0284gm1" {
  autoscaling_group_name = "awseb-e-jhgmmvyhm6-stack-AWSEBAutoScalingGroup-HH0RWVK7FEAP"
  desired_capacity       = 1
  max_size               = 1
  recurrence             = "0 10 * * 6"
  scheduled_action_name  = "awseb-Satur-1V8NIG0284GM1"
  start_time             = "2023-12-02T10:00:00Z"
}

