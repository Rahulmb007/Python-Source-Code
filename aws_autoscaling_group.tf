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

resource "aws_autoscaling_group" "airpr_extractor_light4j_external_asg" {
  capacity_rebalance        = true
  default_cooldown          = 180
  desired_capacity          = 3
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 10
  metrics_granularity       = "1Minute"
  min_size                  = 3
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "price-capacity-optimized"
      spot_max_price                = "0.045"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-00466fe196115e728"
        launch_template_name = "airpr-extractor-light4j-external-lt"
        version              = "$Latest"
      }

      override {
        instance_type     = "c3.large"
        weighted_capacity = "2"
      }

      override {
        instance_type     = "m3.medium"
        weighted_capacity = "1"
      }

      override {
        instance_type     = "m3.large"
        weighted_capacity = "2"
      }

      override {
        instance_type     = "r3.large"
        weighted_capacity = "2"
      }

    }

  }

  name                    = "airpr-extractor-light4j-external_asg"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  tag {
    key                 = "Billing"
    propagate_at_launch = false
    value               = "Crawler"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = false
    value               = "Extractor"
  }

  termination_policies = ["OldestInstance"]
  vpc_zone_identifier  = ["subnet-02e7d2e4d070f0c8b", "subnet-0821c6ca1716f4032", "subnet-05de8086ab38bd923", "subnet-030cf26731fd50e16"]
}

resource "aws_autoscaling_group" "airpr_extractor_light4j_internal_asg" {
  availability_zones        = ["us-east-1e", "us-east-1d", "us-east-1a", "us-east-1c"]
  capacity_rebalance        = true
  default_cooldown          = 180
  desired_capacity          = 117
  enabled_metrics           = ["GroupStandbyInstances", "WarmPoolWarmedCapacity", "GroupAndWarmPoolTotalCapacity", "GroupTotalInstances", "GroupTotalCapacity", "GroupInServiceCapacity", "WarmPoolTerminatingCapacity", "GroupStandbyCapacity", "GroupPendingInstances", "WarmPoolMinSize", "GroupTerminatingInstances", "WarmPoolPendingCapacity", "GroupDesiredCapacity", "GroupAndWarmPoolDesiredCapacity", "GroupInServiceInstances", "GroupTerminatingCapacity", "GroupMinSize", "GroupMaxSize", "WarmPoolTotalCapacity", "GroupPendingCapacity", "WarmPoolDesiredCapacity"]
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 300
  metrics_granularity       = "1Minute"
  min_size                  = 100
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "price-capacity-optimized"
      spot_max_price                = "0.045"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-03b5dcf61c42ea777"
        launch_template_name = "airpr-extractor-light4j-internal-lt"
        version              = "$Latest"
      }

      override {
        instance_type     = "m3.medium"
        weighted_capacity = "1"
      }

      override {
        instance_type     = "c3.large"
        weighted_capacity = "2"
      }

      override {
        instance_type     = "m3.large"
        weighted_capacity = "2"
      }

      override {
        instance_type     = "r3.large"
        weighted_capacity = "2"
      }

    }

  }

  name                    = "airpr-extractor-light4j-internal_asg"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  tag {
    key                 = "Billing"
    propagate_at_launch = false
    value               = "Crawler"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = false
    value               = "Extractor"
  }

  termination_policies = ["OldestInstance"]
}

resource "aws_autoscaling_group" "analyst_dev_worker_group_performance_m20200429042233374300000006" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 4
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.0376"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-05d1be2c2a27c9d24"
        launch_template_name = "analyst-dev-worker-group-performance-m20200429042231684400000002"
        version              = "$Latest"
      }

      override {
        instance_type = "t3a.medium"
      }

    }

  }

  name                    = "analyst-dev-worker-group-performance-m20200429042233374300000006"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "k8s.io/cluster-autoscaler/analyst-dev"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "Analyst-k8s"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "Analyst"
  }

  tag {
    key                 = "kubernetes.io/cluster/analyst-dev"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "analyst-dev-worker-group-performance-m-eks_asg"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0b6ef8616d2b30de5", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "analyst_dev_worker_group_standard_2x20200429042233366600000005" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 4
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.0188"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-09bd663626bff439d"
        launch_template_name = "analyst-dev-worker-group-standard-2x20200429042231684100000001"
        version              = "$Latest"
      }

      override {
        instance_type = "t3a.small"
      }

    }

  }

  name                    = "analyst-dev-worker-group-standard-2x20200429042233366600000005"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "k8s.io/cluster-autoscaler/analyst-dev"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "Analyst-k8s"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "Analyst"
  }

  tag {
    key                 = "kubernetes.io/cluster/analyst-dev"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "analyst-dev-worker-group-standard-2x-eks_asg"
  }

}

resource "aws_autoscaling_group" "awseb_e_jhgmmvyhm6_stack_awsebautoscalinggroup_hh0rwvk7feap" {
  availability_zones      = ["us-east-1e"]
  default_cooldown        = 360
  health_check_type       = "EC2"
  launch_configuration    = "awseb-e-jhgmmvyhm6-stack-AWSEBAutoScalingLaunchConfiguration-1DMNIRB62F0Z4"
  max_size                = 1
  metrics_granularity     = "1Minute"
  min_size                = 0
  name                    = "awseb-e-jhgmmvyhm6-stack-AWSEBAutoScalingGroup-HH0RWVK7FEAP"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  tag {
    key                 = "elasticbeanstalk:environment-name"
    propagate_at_launch = true
    value               = "training"
  }

  tag {
    key                 = "elasticbeanstalk:environment-id"
    propagate_at_launch = true
    value               = "e-jhgmmvyhm6"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "training"
  }

}

resource "aws_autoscaling_group" "awseb_e_kjvjvesxxu_stack_awsebautoscalinggroup_otuppectdsak" {
  default_cooldown    = 360
  desired_capacity    = 1
  health_check_type   = "EC2"
  max_size            = 1
  metrics_granularity = "1Minute"
  min_size            = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "capacity-optimized"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0ed92dfbe9be1312f"
        launch_template_name = "AWSEBEC2LaunchTemplate_xuWgRZ7xeOsd"
        version              = "2"
      }

      override {
        instance_type = "t3.micro"
      }

      override {
        instance_type = "t3a.micro"
      }

    }

  }

  name                    = "awseb-e-kjvjvesxxu-stack-AWSEBAutoScalingGroup-OTUPPECTDSAK"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "airprcrawlermap-prod"
  }

  tag {
    key                 = "elasticbeanstalk:environment-id"
    propagate_at_launch = true
    value               = "e-kjvjvesxxu"
  }

  tag {
    key                 = "elasticbeanstalk:environment-name"
    propagate_at_launch = true
    value               = "airprcrawlermap-prod"
  }

  vpc_zone_identifier = ["subnet-09396850", "subnet-3b032913", "subnet-bd90baca"]
}

resource "aws_autoscaling_group" "awseb_e_snmkhfqac3_stack_awsebautoscalinggroup_w4dohsxd8x9b" {
  default_cooldown    = 10
  desired_capacity    = 2
  health_check_type   = "EC2"
  load_balancers      = ["awseb-e-s-AWSEBLoa-GDG3AMMAIAA"]
  max_size            = 10
  metrics_granularity = "1Minute"
  min_size            = 2
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "capacity-optimized"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-040e88b0dcb3cd155"
        launch_template_name = "AWSEBEC2LaunchTemplate_oqgYSF2lWK4K"
        version              = "1"
      }

      override {
        instance_type = "t2.2xlarge"
      }

      override {
        instance_type = "t3a.2xlarge"
      }

      override {
        instance_type = "t3.2xlarge"
      }

    }

  }

  name                    = "awseb-e-snmkhfqac3-stack-AWSEBAutoScalingGroup-W4DOHSXD8X9B"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "Analyst-VisitorEstimation"
  }

  tag {
    key                 = "elasticbeanstalk:environment-id"
    propagate_at_launch = true
    value               = "e-snmkhfqac3"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "Analyst"
  }

  tag {
    key                 = "elasticbeanstalk:environment-name"
    propagate_at_launch = true
    value               = "visitorEstimation-prod-4"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "visitorEstimation-prod-4"
  }

  vpc_zone_identifier = ["subnet-ab5f32f0", "subnet-78d2a655", "subnet-40072209"]
}

resource "aws_autoscaling_group" "awseb_e_t4hw5gcuek_stack_awsebautoscalinggroup_10whjzpx7ntm5" {
  default_cooldown    = 10
  desired_capacity    = 2
  health_check_type   = "EC2"
  load_balancers      = ["awseb-e-t-AWSEBLoa-1NBQQIYDFQ9FU"]
  max_size            = 10
  metrics_granularity = "1Minute"
  min_size            = 2
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "capacity-optimized"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0113da512ee100d97"
        launch_template_name = "AWSEBEC2LaunchTemplate_5l05QccuvTEr"
        version              = "5"
      }

      override {
        instance_type = "t2.2xlarge"
      }

      override {
        instance_type = "t3a.2xlarge"
      }

      override {
        instance_type = "t3.2xlarge"
      }

    }

  }

  name                    = "awseb-e-t4hw5gcuek-stack-AWSEBAutoScalingGroup-10WHJZPX7NTM5"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "visitorEstimation-prod-2"
  }

  tag {
    key                 = "elasticbeanstalk:environment-name"
    propagate_at_launch = true
    value               = "visitorEstimation-prod-2"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "Analyst-VisitorEstimation"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "Analyst"
  }

  tag {
    key                 = "elasticbeanstalk:environment-id"
    propagate_at_launch = true
    value               = "e-t4hw5gcuek"
  }

  vpc_zone_identifier = ["subnet-ab5f32f0", "subnet-78d2a655", "subnet-40072209"]
}

resource "aws_autoscaling_group" "awseb_e_t9775cemkk_stack_awsebautoscalinggroup_1ip0h100dclh9" {
  availability_zones  = ["us-east-1e"]
  default_cooldown    = 300
  desired_capacity    = 1
  health_check_type   = "EC2"
  load_balancers      = ["awseb-e-t-AWSEBLoa-17B9N3COGPWCB"]
  max_size            = 8
  metrics_granularity = "1Minute"
  min_size            = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy            = "prioritized"
      on_demand_percentage_above_base_capacity = 20
      spot_allocation_strategy                 = "capacity-optimized"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-03c91ccc181657a14"
        launch_template_name = "AWSEBEC2LaunchTemplate_rh4BAw4AMJ78"
        version              = "29"
      }

      override {
        instance_type = "t2.large"
      }

      override {
        instance_type = "t3a.large"
      }

      override {
        instance_type = "t3.large"
      }

    }

  }

  name                    = "awseb-e-t9775cemkk-stack-AWSEBAutoScalingGroup-1IP0H100DCLH9"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  tag {
    key                 = "elasticbeanstalk:environment-id"
    propagate_at_launch = true
    value               = "e-t9775cemkk"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "production-1"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "Analyst-Sentiment"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "Analyst"
  }

  tag {
    key                 = "elasticbeanstalk:environment-name"
    propagate_at_launch = true
    value               = "production-1"
  }

}

resource "aws_autoscaling_group" "bert_inference_v1_gpu_asg_2" {
  capacity_rebalance        = true
  default_cooldown          = 300
  desired_capacity          = 1
  enabled_metrics           = ["GroupStandbyInstances", "GroupTotalInstances", "GroupTotalCapacity", "GroupInServiceCapacity", "GroupStandbyCapacity", "GroupPendingInstances", "GroupTerminatingInstances", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTerminatingCapacity", "GroupMinSize", "GroupMaxSize", "GroupPendingCapacity"]
  health_check_grace_period = 600
  health_check_type         = "EC2"
  max_size                  = 1
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy            = "prioritized"
      on_demand_base_capacity                  = 1
      on_demand_percentage_above_base_capacity = 30
      spot_allocation_strategy                 = "capacity-optimized-prioritized"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0f19fe1954d7f0de4"
        launch_template_name = "bert_inference_v1-gpu_lt_2"
        version              = "$Latest"
      }

      override {
        instance_type = "g4dn.xlarge"
      }

    }

  }

  name                    = "bert_inference_v1-gpu_asg_2"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "AmazonECSManaged"
    propagate_at_launch = true
    value               = ""
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "bert_inference_v1-gpu_instance"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "bert_nlp"
  }

  tag {
    key                 = "ECS Cluster"
    propagate_at_launch = true
    value               = "bert_inference_v1-gpu"
  }

  vpc_zone_identifier = ["subnet-514c3d34", "subnet-e45d30bf", "subnet-af1f38a3", "subnet-893a1fc0", "subnet-29d0a404"]
}

resource "aws_autoscaling_group" "ec2containerservice_visitor_estimation_ecsinstanceasg_kq3ntfo5wv3p" {
  default_cooldown        = 300
  health_check_type       = "EC2"
  launch_configuration    = "EC2ContainerService-visitor-estimation-EcsInstanceLc-114O91SV9CTK2"
  max_size                = 0
  metrics_granularity     = "1Minute"
  min_size                = 0
  name                    = "EC2ContainerService-visitor-estimation-EcsInstanceAsg-KQ3NTFO5WV3P"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "ECS Instance - EC2ContainerService-visitor-estimation"
  }

  tag {
    key                 = "Description"
    propagate_at_launch = true
    value               = "This instance is the part of the Auto Scaling group which was created through ECS Console"
  }

  vpc_zone_identifier = ["subnet-002c5f9df02f0a905", "subnet-0d81a4d70148dbc1c"]
}

resource "aws_autoscaling_group" "ecs_asg" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  launch_configuration      = "ecs_launch_config"
  max_size                  = 1
  metrics_granularity       = "1Minute"
  min_size                  = 1
  name                      = "ecs_asg"
  service_linked_role_arn   = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "ES Site Plugin"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "Crawler"
  }

  vpc_zone_identifier = ["subnet-2c21465b", "subnet-f0f3bbca", "subnet-1a2bae43", "subnet-daa409f1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_blink_v_1_12023020215413521750000002b" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 1
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.40"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-00eddca0399cb2a1b"
        launch_template_name = "eks-data-dev-2-worker-group-blink-v-1-120230202152419662100000017"
        version              = "2"
      }

      override {
        instance_type = "g3.4xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-blink-v-1-12023020215413521750000002b"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-blink-v-1-1-eks_asg"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_coref_resolution_v_1_420230202154135274200000034" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-000d2bc74864175eb"
        launch_template_name = "eks-data-dev-2-worker-group-coref-resolution-v-1-420230202152419611100000015"
        version              = "2"
      }

      override {
        instance_type = "c5.4xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-coref-resolution-v-1-420230202154135274200000034"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-coref-resolution-v-1-4-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_dga_v_1_320230202154152773200000057" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 1
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-02909b39b5743c3da"
        launch_template_name = "eks-data-dev-2-worker-group-dga-v-1-32023020215242424310000004d"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-dga-v-1-320230202154152773200000057"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-dga-v-1-3-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_entity_fish_v_1_220230411144159368200000002" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.08"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0b07756f37e11ebdf"
        launch_template_name = "eks-data-dev-2-worker-group-entity-fish-v-1-220230411142725780000000031"
        version              = "5"
      }

      override {
        instance_type = "m5.large"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-entity-fish-v-1-220230411144159368200000002"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-entity-fish-v-1-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_entityfish_docker_v_1_120230411142753521700000058" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.08"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-00bbbf57681b70e8a"
        launch_template_name = "eks-data-dev-2-worker-group-entityfish-docker-v-1-120230411142724783300000024"
        version              = "3"
      }

      override {
        instance_type = "r5.large"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-entityfish-docker-v-1-120230411142753521700000058"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-entityfish-docker-v-1-1-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_gpt3_v_1_120230202154158430000000066" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-03fae5bb1533e4637"
        launch_template_name = "eks-data-dev-2-worker-group-gpt3-v-1-120230202154131545200000015"
        version              = "3"
      }

      override {
        instance_type = "c5.xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-gpt3-v-1-120230202154158430000000066"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-gpt3-v-1-1-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_gpu1_v_1_12023020215420155610000006e" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 1
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-08835a7b8c1218de2"
        launch_template_name = "eks-data-dev-2-worker-group-gpu1-v-1-12023020215403435420000000d"
        version              = "2"
      }

      override {
        instance_type = "g4dn.xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-gpu1-v-1-12023020215420155610000006e"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-gpu1-v-1-1-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf1_v_1_120230202154139456900000036" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 1
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-017a4602a327dfd0a"
        launch_template_name = "eks-data-dev-2-worker-group-inf1-v-1-120230202154129229400000005"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf1-v-1-120230202154139456900000036"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf1-v-1-1-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf2_v_1_120230202154139107400000035" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 1
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0613289f07b34f005"
        launch_template_name = "eks-data-dev-2-worker-group-inf2-v-1-120230202154034351900000005"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf2-v-1-120230202154139107400000035"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf2-v-1-1-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf3_v_1_32023020215413523640000002e" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 1
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0e75fe30314a330e4"
        launch_template_name = "eks-data-dev-2-worker-group-inf3-v-1-320230202152421408700000029"
        version              = "4"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf3-v-1-32023020215413523640000002e"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf3-v-1-3-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf4_v_1_120230202154149969100000050" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0b1f3bba5ad1367a1"
        launch_template_name = "eks-data-dev-2-worker-group-inf4-v-1-120230202152420057600000025"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf4-v-1-120230202154149969100000050"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf4-v-1-1-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf5_v_1_2920230202154151788600000054" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 1
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-09ee60f0b69a7bcbe"
        launch_template_name = "eks-data-dev-2-worker-group-inf5-v-1-2920230202154034352000000007"
        version              = "2"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf5-v-1-2920230202154151788600000054"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf5-v-1-29-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf7_v_1_120230206221013510600000003" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0ad3adff5db4bcedc"
        launch_template_name = "eks-data-dev-2-worker-group-inf7-v-1-120230206221012400500000001"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf7-v-1-120230206221013510600000003"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf7-v-1-1-eks_asg"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_00000000_v_2_220230202154143629300000040" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-018e5369602d619e8"
        launch_template_name = "eks-data-dev-2-worker-group-inf-00000000-v-2-22023020215241693060000000d"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-00000000-v-2-220230202154143629300000040"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-00000000-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_01000000_v_2_22023061312485457610000001d" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-00ff9d7b2b8b4c804"
        launch_template_name = "eks-data-dev-2-worker-group-inf-01000000-v-2-220230202152419975900000021"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-01000000-v-2-22023061312485457610000001d"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-01000000-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_02000000_v_2_220230613124931266100000043" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0007aa916f9aafb82"
        launch_template_name = "eks-data-dev-2-worker-group-inf-02000000-v-2-220230202154035495800000013"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name_prefix             = "eks-data-dev-2-worker-group-inf-02000000-v-2-2"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-02000000-v-2-2-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_03000000_v_2_22023061312484647610000000b" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0adbaac5b962d2f4b"
        launch_template_name = "eks-data-dev-2-worker-group-inf-03000000-v-2-22023020215242273070000003d"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-03000000-v-2-22023061312484647610000000b"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-03000000-v-2-2-eks_asg"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_04000000_v_2_220230613124849828400000016" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-04cbc75a625e5243d"
        launch_template_name = "eks-data-dev-2-worker-group-inf-04000000-v-2-220230202152423210700000045"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-04000000-v-2-220230613124849828400000016"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-04000000-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_05000000_v_2_22023061312490290790000002b" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0280c8cc6cae2d6e3"
        launch_template_name = "eks-data-dev-2-worker-group-inf-05000000-v-2-220230202152423334100000047"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-05000000-v-2-22023061312490290790000002b"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-05000000-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_06000000_v_2_22023061312484666320000000d" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0667cab0833a75bc6"
        launch_template_name = "eks-data-dev-2-worker-group-inf-06000000-v-2-220230202154129230600000009"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-06000000-v-2-22023061312484666320000000d"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-06000000-v-2-2-eks_asg"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_07000000_v_2_220230613124911721100000032" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-00c443ec80058847d"
        launch_template_name = "eks-data-dev-2-worker-group-inf-07000000-v-2-220230202154129226900000001"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-07000000-v-2-220230613124911721100000032"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-07000000-v-2-2-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_09000000_v_2_220230613124847079000000013" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-017432418806b935f"
        launch_template_name = "eks-data-dev-2-worker-group-inf-09000000-v-2-22023020215412923370000000f"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name_prefix             = "eks-data-dev-2-worker-group-inf-09000000-v-2-2"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-09000000-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_10000000_v_2_220230613124859415400000028" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-07979a734bab01cbc"
        launch_template_name = "eks-data-dev-2-worker-group-inf-10000000-v-2-220230202154037001900000015"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-10000000-v-2-220230613124859415400000028"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-10000000-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_11000000_v_2_320230613124914428100000035" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-03385531bd565fd5e"
        launch_template_name = "eks-data-dev-2-worker-group-inf-11000000-v-2-32023020215242147680000002d"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-11000000-v-2-320230613124914428100000035"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-11000000-v-2-3-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_12000000_v_2_32023061312485481280000001e" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-018816cce4ea31865"
        launch_template_name = "eks-data-dev-2-worker-group-inf-12000000-v-2-320230202152419793800000019"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-12000000-v-2-32023061312485481280000001e"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-12000000-v-2-3-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_13000000_v_2_320230613124901334100000029" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0c2d9bdae09b1a7ed"
        launch_template_name = "eks-data-dev-2-worker-group-inf-13000000-v-2-320230202152422329300000035"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name_prefix             = "eks-data-dev-2-worker-group-inf-13000000-v-2-3"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-13000000-v-2-3-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_14000000_v_2_220230613124855917900000020" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0d303cb4304ca07ba"
        launch_template_name = "eks-data-dev-2-worker-group-inf-14000000-v-2-220230202154129230400000007"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-14000000-v-2-220230613124855917900000020"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-14000000-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_15000000_v_2_220230613124913638600000034" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0c875a387b8506a59"
        launch_template_name = "eks-data-dev-2-worker-group-inf-15000000-v-2-220230202152416924700000003"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name_prefix             = "eks-data-dev-2-worker-group-inf-15000000-v-2-2"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-15000000-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_16000000_v_1_120230613124859250500000026" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0fde16941671ca597"
        launch_template_name = "eks-data-dev-2-worker-group-inf-16000000-v-1-120230202152423087600000043"
        version              = "2"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-16000000-v-1-120230613124859250500000026"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-16000000-v-1-1-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_17000000_v_2_220230613124849071000000015" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-05a40ad40fe65a704"
        launch_template_name = "eks-data-dev-2-worker-group-inf-17000000-v-2-220230202152416926800000007"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-17000000-v-2-220230613124849071000000015"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-17000000-v-2-2-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000002_v_2_220230613124933982100000047" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0912bea5b0232e1c7"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000002-v-2-220230202154034349200000001"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000002-v-2-220230613124933982100000047"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000002-v-2-2-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000038_v_2_22023061312492330930000003d" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-096ad5766b51a2dd2"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000038-v-2-220230202152424048200000049"
        version              = "2"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000038-v-2-22023061312492330930000003d"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000038-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000045_v_2_22023061312485401490000001c" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0042ad01bc99c11c1"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000045-v-2-220230202152416926700000005"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000045-v-2-22023061312485401490000001c"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000045-v-2-2-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000053_v_2_22023061312492195420000003b" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-08451b9ea99e7b72f"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000053-v-2-220230202152420057600000023"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000053-v-2-22023061312492195420000003b"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000053-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000056_v_2_220230613124934644400000048" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-021bfa6db42e80cd9"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000056-v-2-220230202154034355100000011"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000056-v-2-220230613124934644400000048"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000056-v-2-2-eks_asg"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000065_v_2_220230613124857674500000024" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0e98fdf0227955eea"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000065-v-2-220230202152421757500000033"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000065-v-2-220230613124857674500000024"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000065-v-2-2-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000082_v_2_22023061312484682200000000f" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-090a3811f5a848ae2"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000082-v-2-22023020215241984330000001b"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000082-v-2-22023061312484682200000000f"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000082-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000106_v_2_220230613124918692100000038" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-003cd7367b1043848"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000106-v-2-220230202152416932400000011"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000106-v-2-220230613124918692100000038"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000106-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000121_v_2_22023061312484678180000000e" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-05f50271d028b1478"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000121-v-2-22023020215242266780000003b"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000121-v-2-22023061312484678180000000e"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000121-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000129_v_2_220230613124913167800000033" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0eb90107fade3b49b"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000129-v-2-22023020215242308500000003f"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000129-v-2-220230613124913167800000033"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000129-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000139_v_2_220230613124931154000000042" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-04e03eaf658e32ee4"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000139-v-2-220230202154131548200000019"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000139-v-2-220230613124931154000000042"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000139-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000148_v_2_22023061312492187740000003a" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0f4693dcbd7f72f3f"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000148-v-2-22023020215403713080000001b"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000148-v-2-22023061312492187740000003a"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000148-v-2-2-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000170_v_2_220230613124931587800000045" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-04cbd0f96c40af149"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000170-v-2-22023020215403735350000001f"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name_prefix             = "eks-data-dev-2-worker-group-inf-20000170-v-2-2"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000170-v-2-2-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000209_v_2_22023061312490253860000002a" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-018a1f1eefa36fb12"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000209-v-2-22023020215242145010000002b"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000209-v-2-22023061312490253860000002a"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000209-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000385_v_2_220230613124911362400000031" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-08e37115752a42b14"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000385-v-2-220230202154034352900000009"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000385-v-2-220230613124911362400000031"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000385-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000424_v_2_220230613124857098700000022" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0f72ab6073517fe29"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000424-v-2-220230202152417836200000013"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name_prefix             = "eks-data-dev-2-worker-group-inf-20000424-v-2-2"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000424-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000430_v_2_220230613124916115900000037" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0116b7c9e013e2492"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000430-v-2-22023020215412923240000000b"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000430-v-2-220230613124916115900000037"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000430-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000441_v_2_220230613124851292100000019" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0deb8bc3221b32ec7"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000441-v-2-22023020215413156160000001b"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000441-v-2-220230613124851292100000019"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000441-v-2-2-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000446_v_2_220230613124847103100000014" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0634841652572e763"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000446-v-2-22023020215412923290000000d"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000446-v-2-220230613124847103100000014"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000446-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000464_v_2_22023061312485578850000001f" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0d14a659f3ef866d3"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000464-v-2-220230202154037595500000025"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000464-v-2-22023061312485578850000001f"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000464-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000493_v_2_220230613124921081400000039" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0b9a1b1f91fb251e7"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000493-v-2-220230202154129246000000013"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000493-v-2-220230613124921081400000039"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000493-v-2-2-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000538_v_2_220230613124859108400000025" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0f56dfd081e9c6b83"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000538-v-2-22023020215403435440000000f"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000538-v-2-220230613124859108400000025"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000538-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000565_v_2_220230613124930975000000041" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-06cf9a6be8c449fc2"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000565-v-2-220230202152416924400000001"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000565-v-2-220230613124930975000000041"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000565-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000574_v_2_220230613124847041700000011" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0e0bfb9de0a6ee09d"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000574-v-2-22023020215241693070000000f"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000574-v-2-220230613124847041700000011"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000574-v-2-2-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000587_v_2_220230613124932610000000046" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0bfdc3f88f63bd1a4"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000587-v-2-22023020215413156240000001d"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000587-v-2-220230613124932610000000046"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000587-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000593_v_2_22023061312485331920000001a" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0bf6b10f799929b69"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000593-v-2-220230202154037519600000023"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name_prefix             = "eks-data-dev-2-worker-group-inf-20000593-v-2-2"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000593-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000621_v_2_220230613124849976100000017" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-01228e45c38194d96"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000621-v-2-220230202152421667000000031"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000621-v-2-220230613124849976100000017"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000621-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000638_v_2_220230613124930490500000040" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-03108fabf44b2c819"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000638-v-2-22023020215242148520000002f"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000638-v-2-220230613124930490500000040"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000638-v-2-2-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000649_v_2_22023061312485339950000001b" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0bfc7e0952dd4042f"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000649-v-2-220230202152420396300000027"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000649-v-2-22023061312485339950000001b"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000649-v-2-2-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000657_v_2_22023061312493017010000003f" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-07aa0f2732da87a18"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000657-v-2-220230202154131584500000023"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000657-v-2-22023061312493017010000003f"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000657-v-2-2-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000697_v_2_22023061312491041440000002f" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0314e35335f530d13"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000697-v-2-220230202154131591100000025"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name_prefix             = "eks-data-dev-2-worker-group-inf-20000697-v-2-2"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000697-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000705_v_2_220230613124857321600000023" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0b96962f8aab131b2"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000705-v-2-220230202154131546900000017"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000705-v-2-220230613124857321600000023"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000705-v-2-2-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000717_v_2_220230613124855976400000021" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-01c0aa2b0d2abfdb8"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000717-v-2-220230202154131576800000021"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000717-v-2-220230613124855976400000021"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000717-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000735_v_2_22023061312490856440000002d" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-09359d93c508e7f03"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000735-v-2-22023020215241990540000001f"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000735-v-2-22023061312490856440000002d"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000735-v-2-2-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000742_v_2_220230613124849999500000018" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0cfbd6202ea90c109"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000742-v-2-220230202154129227000000003"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000742-v-2-220230613124849999500000018"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000742-v-2-2-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000756_v_2_220230613124911274500000030" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0c24b367c7bc0b1aa"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000756-v-2-220230202154034351400000003"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name_prefix             = "eks-data-dev-2-worker-group-inf-20000756-v-2-2"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000756-v-2-2-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000775_v_2_22023061312492997890000003e" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-023d2dfa8afd84f97"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000775-v-2-22023020215241692930000000b"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000775-v-2-22023061312492997890000003e"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000775-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000780_v_2_22023061312490342530000002c" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-06bd5e6f419584aef"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000780-v-2-220230202152422575800000039"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name_prefix             = "eks-data-dev-2-worker-group-inf-20000780-v-2-2"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000780-v-2-2-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000788_v_2_220230613124916022700000036" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0c7fc66763d723ccd"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000788-v-2-220230202152416927100000009"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name_prefix             = "eks-data-dev-2-worker-group-inf-20000788-v-2-2"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000788-v-2-2-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000799_v_2_220230613124847058900000012" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-04c00486b0676657e"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000799-v-2-22023020215413156260000001f"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000799-v-2-220230613124847058900000012"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000799-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000802_v_2_22023061312490986260000002e" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0d920bc0458e21b2a"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000802-v-2-220230202154037483600000021"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name_prefix             = "eks-data-dev-2-worker-group-inf-20000802-v-2-2"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000802-v-2-2-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000808_v_2_220230613124846957800000010" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-063eca3d1f992d05d"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000808-v-2-22023020215403728960000001d"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000808-v-2-220230613124846957800000010"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000808-v-2-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_20000822_v_2_220230613124934866400000049" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-07c9d7fc4f2b057e6"
        launch_template_name = "eks-data-dev-2-worker-group-inf-20000822-v-2-220230202154133031000000029"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-20000822-v-2-220230613124934866400000049"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-20000822-v-2-2-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_iptc_multimodel_v_22023020215414799710000004a" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0b4867471e21c2a1f"
        launch_template_name = "eks-data-dev-2-worker-group-inf-iptc-multimodel-v-220230202154129245400000011"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-iptc-multimodel-v-22023020215414799710000004a"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-iptc-multimodel-v-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_inf_textsum_v_1_12023020215414973810000004f" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.5"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-06aa7c596dd1d82df"
        launch_template_name = "eks-data-dev-2-worker-group-inf-textsum-v-1-120230202152422466900000037"
        version              = "2"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-inf-textsum-v-1-12023020215414973810000004f"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-inf-textsum-v-1-1-eks_asg"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_iptc_client_v_1_12023020215413965630000003a" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 100
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0664429736b0b91ce"
        launch_template_name = "eks-data-dev-2-worker-group-iptc-client-v-1-12023020215241990240000001d"
        version              = "2"
      }

      override {
        instance_type = "c5.2xlarge"
      }

      override {
        instance_type = "m5.xlarge"
      }

      override {
        instance_type = "m5.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-iptc-client-v-1-12023020215413965630000003a"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-iptc-client-v-1-1-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_keybert_v_1_120230202154157301900000063" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0a805f8bb30dfed3e"
        launch_template_name = "eks-data-dev-2-worker-group-keybert-v-1-120230202154037025900000019"
        version              = "2"
      }

      override {
        instance_type = "c5.xlarge"
      }

    }

  }

  name_prefix             = "eks-data-dev-2-worker-group-keybert-v-1-1"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-keybert-v-1-1-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_lite_v_1_120230202154135254700000031" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.0752"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-074c5c598edd6f354"
        launch_template_name = "eks-data-dev-2-worker-group-lite-v-1-120230202154037009900000017"
        version              = "2"
      }

      override {
        instance_type = "t3a.large"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-lite-v-1-120230202154135254700000031"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-lite-v-1-1-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_lsh_v_1_220231120230926838100000003" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0b5e1bd575252ad4d"
        launch_template_name = "eks-data-dev-2-worker-group-lsh-v-1-220231120230925715200000001"
        version              = "1"
      }

      override {
        instance_type = "c5.2xlarge"
      }

      override {
        instance_type = "m5.xlarge"
      }

      override {
        instance_type = "m5.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-lsh-v-1-220231120230926838100000003"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-lsh-v-1-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_nsfw_classifier_v020230411142748974100000057" {
  availability_zones        = ["us-east-1f", "us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-09c7b6aca839a60f8"
        launch_template_name = "eks-data-dev-2-worker-group-nsfw-classifier-v020230411142722562700000001"
        version              = "2"
      }

      override {
        instance_type = "inf1.xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-nsfw-classifier-v020230411142748974100000057"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-nsfw-classifier-v0-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_pretrained_summarization_bart_ca_v_1_120230624161351303100000008" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.6"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-00bc7976e8c37d474"
        launch_template_name = "eks-data-dev-2-worker-group-pretrained-summarization-bart-ca-v-1-120230624161346298600000005"
        version              = "1"
      }

      override {
        instance_type = "inf2.xlarge"
      }

      override {
        instance_type = "inf2.8xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-pretrained-summarization-bart-ca-v-1-120230624161351303100000008"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-pretrained-summarization-bart-ca-v-1-1-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_pretrained_summarization_bart_es_v_1_220230706124100201400000001" {
  availability_zones        = ["us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.6"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-051faae8000a4e985"
        launch_template_name = "eks-data-dev-2-worker-group-pretrained-summarization-bart-es-v-1-220230626200023271500000001"
        version              = "1"
      }

      override {
        instance_type = "inf2.xlarge"
      }

      override {
        instance_type = "inf2.8xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-pretrained-summarization-bart-es-v-1-220230706124100201400000001"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-pretrained-summarization-bart-es-v-1-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_pretrained_summarization_bart_it_fanpage_v_1_220230626192956501400000001" {
  availability_zones        = ["us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.6"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0b819522b2515d0e0"
        launch_template_name = "eks-data-dev-2-worker-group-pretrained-summarization-bart-it-fanpage-v-1-220230626191846060900000003"
        version              = "1"
      }

      override {
        instance_type = "inf2.xlarge"
      }

      override {
        instance_type = "inf2.8xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-pretrained-summarization-bart-it-fanpage-v-1-220230626192956501400000001"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-pretrained-summarization-bart-it-fanpage-v-1-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_pretrained_summarization_bart_latest_v_1_320230710182539028000000003" {
  availability_zones        = ["us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.6"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0da6de0bbd4de4a73"
        launch_template_name = "eks-data-dev-2-worker-group-pretrained-summarization-bart-latest-v-1-320230710182537463900000001"
        version              = "1"
      }

      override {
        instance_type = "inf2.xlarge"
      }

      override {
        instance_type = "inf2.8xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-pretrained-summarization-bart-latest-v-1-320230710182539028000000003"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-pretrained-summarization-bart-latest-v-1-3-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_pretrained_summarization_brio_v_1_220230710185629890500000003" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.6"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0ffb697235f38266f"
        launch_template_name = "eks-data-dev-2-worker-group-pretrained-summarization-brio-v-1-220230710185628715500000001"
        version              = "1"
      }

      override {
        instance_type = "inf2.xlarge"
      }

      override {
        instance_type = "inf2.8xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-pretrained-summarization-brio-v-1-220230710185629890500000003"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-pretrained-summarization-brio-v-1-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-0b6ef8616d2b30de5"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_pretrained_summarization_client_v_1_120230509124040980600000005" {
  availability_zones        = ["us-east-1a"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.45"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0fb02268d6b1495f5"
        launch_template_name = "eks-data-dev-2-worker-group-pretrained-summarization-client-v-1-120230509124039725100000001"
        version              = "1"
      }

      override {
        instance_type = "c5.xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-pretrained-summarization-client-v-1-120230509124040980600000005"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-pretrained-summarization-client-v-1-1-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_pretrained_summarization_deltalm_v_1_720230613143407616500000004" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.7"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-028e53ac75321a0fa"
        launch_template_name = "eks-data-dev-2-worker-group-pretrained-summarization-deltalm-v-1-720230613124841877000000003"
        version              = "1"
      }

      override {
        instance_type = "g4dn.2xlarge"
      }

      override {
        instance_type = "g4dn.4xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-pretrained-summarization-deltalm-v-1-720230613143407616500000004"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-pretrained-summarization-deltalm-v-1-7-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_pretrained_summarization_mbart_v_1_220230710184112529000000003" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.6"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0c8b84359195853dc"
        launch_template_name = "eks-data-dev-2-worker-group-pretrained-summarization-mbart-v-1-220230710184111296100000001"
        version              = "1"
      }

      override {
        instance_type = "inf2.xlarge"
      }

      override {
        instance_type = "inf2.8xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-pretrained-summarization-mbart-v-1-220230710184112529000000003"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-pretrained-summarization-mbart-v-1-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-0b6ef8616d2b30de5"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_pretrained_summarization_nasca_v_1_120230626192401877100000002" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.6"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-03ecd5b57c1e54552"
        launch_template_name = "eks-data-dev-2-worker-group-pretrained-summarization-nasca-v-1-120230626191846050200000001"
        version              = "1"
      }

      override {
        instance_type = "inf2.xlarge"
      }

      override {
        instance_type = "inf2.8xlarge"
      }

    }

  }

  name_prefix             = "eks-data-dev-2-worker-group-pretrained-summarization-nasca-v-1-1"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-pretrained-summarization-nasca-v-1-1-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_prom_v_1_120230202154204445400000073" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 1
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0afe609e3ec3d2f9f"
        launch_template_name = "eks-data-dev-2-worker-group-prom-v-1-120230202154132020700000027"
        version              = "2"
      }

      override {
        instance_type = "c5.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-prom-v-1-120230202154204445400000073"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-prom-v-1-1-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_2_worker_group_serv_v_1_12023020215415416840000005b" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-048b2e5dbb857d1e6"
        launch_template_name = "eks-data-dev-2-worker-group-serv-v-1-120230202152423086800000041"
        version              = "2"
      }

      override {
        instance_type = "c5.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-2-worker-group-serv-v-1-12023020215415416840000005b"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev-2"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev-2"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-2-worker-group-serv-v-1-1-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev-2"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_dev_worker_group_gpu1_v_1_2520210402181320601200000007" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0feeaa5189d77b95c"
        launch_template_name = "eks-data-dev-worker-group-gpu1-v-1-2520210402181319159700000001"
        version              = "$Latest"
      }

      override {
        instance_type = "g4dn.xlarge"
      }

    }

  }

  name_prefix             = "eks-data-dev-worker-group-gpu1-v-1-25"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-worker-group-gpu1-v-1-25-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-00405c02874c638ff", "subnet-0b6ef8616d2b30de5", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_dev_worker_group_inf1_v_1_252021012221360621490000000a" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1a", "us-east-1b"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-006a193d2b279a7e1"
        launch_template_name = "eks-data-dev-worker-group-inf1-v-1-2520210122213604613900000001"
        version              = "$Latest"
      }

      override {
        instance_type = "inf1.xlarge"
      }

    }

  }

  name                    = "eks-data-dev-worker-group-inf1-v-1-252021012221360621490000000a"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-worker-group-inf1-v-1-25-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_dev_worker_group_inf2_v_1_2520210122213606203600000009" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-03e69b89bf9cb2fad"
        launch_template_name = "eks-data-dev-worker-group-inf2-v-1-2520210122213604618200000005"
        version              = "$Latest"
      }

      override {
        instance_type = "inf1.xlarge"
      }

    }

  }

  name                    = "eks-data-dev-worker-group-inf2-v-1-2520210122213606203600000009"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-worker-group-inf2-v-1-25-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-00405c02874c638ff", "subnet-0b6ef8616d2b30de5", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_dev_worker_group_lite_v_1_212021012221360622560000000c" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.0752"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0a1746d918f5303be"
        launch_template_name = "eks-data-dev-worker-group-lite-v-1-2120210122213604619800000007"
        version              = "$Latest"
      }

      override {
        instance_type = "t3a.large"
      }

    }

  }

  name                    = "eks-data-dev-worker-group-lite-v-1-212021012221360622560000000c"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-worker-group-lite-v-1-21-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-00405c02874c638ff", "subnet-0b6ef8616d2b30de5", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_dev_worker_group_serv_v_1_222021012221360621790000000b" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1a", "us-east-1b"]
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0641a0990dddafb1e"
        launch_template_name = "eks-data-dev-worker-group-serv-v-1-2220210122213604615500000003"
        version              = "$Latest"
      }

      override {
        instance_type = "c5.2xlarge"
      }

    }

  }

  name                    = "eks-data-dev-worker-group-serv-v-1-222021012221360621790000000b"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-dev"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-dev-worker-group-serv-v-1-22-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-dev"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-dev"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_blink_v_1_120230210040239159700000001" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.40"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-09c870d77101c4e77"
        launch_template_name = "eks-data-prod-3-worker-group-blink-v-1-120230210035440852500000005"
        version              = "1"
      }

      override {
        instance_type = "g3.4xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-blink-v-1-120230210040239159700000001"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-blink-v-1-1-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_coref_resolution_v_1_4202302100355423267000000b7" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-091901538a388de7e"
        launch_template_name = "eks-data-prod-3-worker-group-coref-resolution-v-1-420230210035443576500000053"
        version              = "1"
      }

      override {
        instance_type = "c5.4xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-coref-resolution-v-1-4202302100355423267000000b7"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-coref-resolution-v-1-4-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_dga_v_1_420230628230904369600000001" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 1
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0db18113e544e88ac"
        launch_template_name = "eks-data-prod-3-worker-group-dga-v-1-420230628225623061300000005"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-dga-v-1-420230628230904369600000001"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-dga-v-1-4-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_entity_fish_v_1_320230628221815288400000001" {
  default_cooldown          = 300
  desired_capacity          = 5
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 5
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.10"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0cfa08a47d82ee5b1"
        launch_template_name = "eks-data-prod-3-worker-group-entity-fish-v-1-320230628215148959700000001"
        version              = "1"
      }

      override {
        instance_type = "m5.large"
      }

      override {
        instance_type = "m5.xlarge"
      }

      override {
        instance_type = "m4.large"
      }

      override {
        instance_type = "m4.xlarge"
      }

    }

  }

  name_prefix             = "eks-data-prod-3-worker-group-entity-fish-v-1-3"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-entity-fish-v-1-3-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_entityfish_docker_v_1_220230628215150662800000018" {
  default_cooldown          = 300
  desired_capacity          = 11
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.10"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0a377973bb08915a4"
        launch_template_name = "eks-data-prod-3-worker-group-entityfish-docker-v-1-220230628215148961400000003"
        version              = "1"
      }

      override {
        instance_type = "r5.large"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-entityfish-docker-v-1-220230628215150662800000018"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-entityfish-docker-v-1-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_gpt3_v_1_1202302100357179079000000db" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-09547ab22f9c1a0e5"
        launch_template_name = "eks-data-prod-3-worker-group-gpt3-v-1-120230210035440849600000001"
        version              = "1"
      }

      override {
        instance_type = "c5.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-gpt3-v-1-1202302100357179079000000db"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-gpt3-v-1-1-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_gpu1_v_1_220230628225006476500000009" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 1
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.19"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0e22eb36d82f36f39"
        launch_template_name = "eks-data-prod-3-worker-group-gpu1-v-1-220230628225005186200000001"
        version              = "1"
      }

      override {
        instance_type = "g4dn.xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-gpu1-v-1-220230628225006476500000009"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-gpu1-v-1-2-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf1_v_1_520230731224719590300000001" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 2
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-08cc15118192e1b84"
        launch_template_name = "eks-data-prod-3-worker-group-inf1-v-1-520230731224304932900000001"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf1-v-1-520230731224719590300000001"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf1-v-1-5-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf2_v_1_420230630213008068000000001" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-076e5948420442023"
        launch_template_name = "eks-data-prod-3-worker-group-inf2-v-1-420230629000243967800000007"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf2-v-1-420230630213008068000000001"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf2-v-1-4-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf3_v_1_820230731163136049500000001" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 12
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 5
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy            = "prioritized"
      on_demand_base_capacity                  = 8
      on_demand_percentage_above_base_capacity = 100
      spot_allocation_strategy                 = "lowest-price"
      spot_instance_pools                      = 4
      spot_max_price                           = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-058447de2361716b1"
        launch_template_name = "eks-data-prod-3-worker-group-inf3-v-1-820230731162843394900000001"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf3-v-1-820230731163136049500000001"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf3-v-1-8-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf4_v_1_520230630213008106400000004" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 15
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 20
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy            = "prioritized"
      on_demand_base_capacity                  = 20
      on_demand_percentage_above_base_capacity = 100
      spot_allocation_strategy                 = "capacity-optimized"
      spot_max_price                           = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-06ec2bda2cea5b5dd"
        launch_template_name = "eks-data-prod-3-worker-group-inf4-v-1-520230629000243967700000005"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf4-v-1-520230630213008106400000004"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf4-v-1-5-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf5_v_1_3120230731225424746700000001" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-07d7c24b2b3faa2c5"
        launch_template_name = "eks-data-prod-3-worker-group-inf5-v-1-3120230731225348353300000001"
        version              = "1"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf5-v-1-3120230731225424746700000001"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf5-v-1-31-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf7_v_1_120230208213259640800000051" {
  availability_zones        = ["us-east-1f", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0abdf5f75bd2b0ba3"
        launch_template_name = "eks-data-prod-3-worker-group-inf7-v-1-120230208213253695800000001"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf7-v-1-120230208213259640800000051"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf7-v-1-1-eks_asg"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf7_v_1_320230921210817082300000001" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0c23278e363610c69"
        launch_template_name = "eks-data-prod-3-worker-group-inf7-v-1-320230921183217134600000019"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

    }

  }

  name_prefix             = "eks-data-prod-3-worker-group-inf7-v-1-3"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf7-v-1-3-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_00000000_v_2_320230731223640805200000004" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 5
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 5
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy            = "prioritized"
      on_demand_base_capacity                  = 7
      on_demand_percentage_above_base_capacity = 100
      spot_allocation_strategy                 = "lowest-price"
      spot_instance_pools                      = 4
      spot_max_price                           = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0a7860e6831797d31"
        launch_template_name = "eks-data-prod-3-worker-group-inf-00000000-v-2-320230731223639554300000001"
        version              = "1"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

      override {
        instance_type = "inf1.6xlarge"
      }

      override {
        instance_type = "inf1.xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-00000000-v-2-320230731223640805200000004"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-00000000-v-2-3-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_01000000_v_2_420230731223640803100000003" {
  default_cooldown          = 300
  desired_capacity          = 3
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 3
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy            = "prioritized"
      on_demand_base_capacity                  = 1
      on_demand_percentage_above_base_capacity = 100
      spot_allocation_strategy                 = "lowest-price"
      spot_instance_pools                      = 4
      spot_max_price                           = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-02dc48693841ca9e2"
        launch_template_name = "eks-data-prod-3-worker-group-inf-01000000-v-2-420230731223254547000000003"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

      override {
        instance_type = "inf1.6xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-01000000-v-2-420230731223640803100000003"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-01000000-v-2-4-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_02000000_v_2_320230630232047860000000002" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0e5760ed41693844d"
        launch_template_name = "eks-data-prod-3-worker-group-inf-02000000-v-2-320230630225552093000000009"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-02000000-v-2-320230630232047860000000002"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-02000000-v-2-3-eks_asg"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_03000000_v_2_320230630225553666700000017" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0689e2cf0c7ce5e30"
        launch_template_name = "eks-data-prod-3-worker-group-inf-03000000-v-2-320230630225552090100000003"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-03000000-v-2-320230630225553666700000017"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-03000000-v-2-3-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_04000000_v_2_320230630230109257700000003" {
  default_cooldown          = 300
  desired_capacity          = 3
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 2
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-076911b4da9cebc6e"
        launch_template_name = "eks-data-prod-3-worker-group-inf-04000000-v-2-320230630225552090100000001"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-04000000-v-2-320230630230109257700000003"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-04000000-v-2-3-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_05000000_v_2_42023092118552627310000000a" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0a631dbf14e9adbc5"
        launch_template_name = "eks-data-prod-3-worker-group-inf-05000000-v-2-420230921183216715900000013"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-05000000-v-2-42023092118552627310000000a"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-05000000-v-2-4-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_06000000_v_2_42023092121081729540000000a" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-008a3ce8ccfee8a7b"
        launch_template_name = "eks-data-prod-3-worker-group-inf-06000000-v-2-42023092118321713490000001d"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-06000000-v-2-42023092121081729540000000a"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-06000000-v-2-4-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_07000000_v_2_320230630230109248200000001" {
  capacity_rebalance        = true
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "capacity-optimized"
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-032842c51ae91059b"
        launch_template_name = "eks-data-prod-3-worker-group-inf-07000000-v-2-32023063022555209490000000d"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-07000000-v-2-320230630230109248200000001"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-07000000-v-2-3-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_09000000_v_2_420230921185524506300000003" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-03954b1a4ad8a46ae"
        launch_template_name = "eks-data-prod-3-worker-group-inf-09000000-v-2-420230921183217458700000027"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-09000000-v-2-420230921185524506300000003"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-09000000-v-2-4-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_10000000_v_2_320230701032002471600000001" {
  default_cooldown          = 300
  desired_capacity          = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-030c8b394b04139cb"
        launch_template_name = "eks-data-prod-3-worker-group-inf-10000000-v-2-320230701023727541200000015"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-10000000-v-2-320230701032002471600000001"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-10000000-v-2-3-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_11000000_v_2_420230701030445279800000006" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-01e76058239f331fb"
        launch_template_name = "eks-data-prod-3-worker-group-inf-11000000-v-2-420230701023726598500000005"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-11000000-v-2-420230701030445279800000006"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-11000000-v-2-4-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_12000000_v_2_520230921222116185100000003" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-06bd50576b0fb7c6b"
        launch_template_name = "eks-data-prod-3-worker-group-inf-12000000-v-2-520230921222115138600000001"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-12000000-v-2-520230921222116185100000003"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-12000000-v-2-5-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_13000000_v_2_420230701030915114800000002" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0278079a9cbb30c07"
        launch_template_name = "eks-data-prod-3-worker-group-inf-13000000-v-2-420230701023726597000000001"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-13000000-v-2-420230701030915114800000002"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-13000000-v-2-4-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_14000000_v_2_520230921222547018500000003" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0211fdadfa283fbe6"
        launch_template_name = "eks-data-prod-3-worker-group-inf-14000000-v-2-520230921222545932000000001"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-14000000-v-2-520230921222547018500000003"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-14000000-v-2-5-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_15000000_v_2_320230701025522115200000006" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0f75304341e808e59"
        launch_template_name = "eks-data-prod-3-worker-group-inf-15000000-v-2-32023070102372757030000001d"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-15000000-v-2-320230701025522115200000006"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-15000000-v-2-3-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_16000000_v_1_320230630233224047200000001" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-047e2bb47a5750b82"
        launch_template_name = "eks-data-prod-3-worker-group-inf-16000000-v-1-320230630233030044900000001"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-16000000-v-1-320230630233224047200000001"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-16000000-v-1-3-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_17000000_v_2_32023070102372900670000002a" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0b501ea7b903c2ee3"
        launch_template_name = "eks-data-prod-3-worker-group-inf-17000000-v-2-32023070102372662110000000f"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name_prefix             = "eks-data-prod-3-worker-group-inf-17000000-v-2-3"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-17000000-v-2-3-eks_asg"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000002_v_2_320230701030915114700000001" {
  default_cooldown          = 300
  desired_capacity          = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-08514466adf8ae090"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000002-v-2-320230701023727551200000017"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000002-v-2-320230701030915114700000001"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000002-v-2-3-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000038_v_2_420230701033110820900000001" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0a9633940c1fabc31"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000038-v-2-420230701031735070200000001"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000038-v-2-420230701033110820900000001"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000038-v-2-4-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000045_v_2_320230701023728981600000026" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-07dcf4eac40799326"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000045-v-2-320230701023727581300000021"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000045-v-2-320230701023728981600000026"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000045-v-2-3-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000053_v_2_42023092118553636710000000e" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0f20279b30c1aa6c5"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000053-v-2-420230921183216223400000009"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000053-v-2-42023092118553636710000000e"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000053-v-2-4-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000056_v_2_320230701023743197600000033" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0525a530b462d0cdd"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000056-v-2-320230701023727555800000019"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000056-v-2-320230701023743197600000033"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000056-v-2-3-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000065_v_2_42023092118553748080000000f" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0bed8a2c577bd7a35"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000065-v-2-420230921183216221800000003"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000065-v-2-42023092118553748080000000f"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000065-v-2-4-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000082_v_2_320230701023728882600000023" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0e125911869e28a71"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000082-v-2-32023070102372662040000000b"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000082-v-2-320230701023728882600000023"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000082-v-2-3-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000106_v_2_320230701025521959200000002" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0d1fbde9b9149fdb5"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000106-v-2-32023070102372662080000000d"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name_prefix             = "eks-data-prod-3-worker-group-inf-20000106-v-2-3"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000106-v-2-3-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000121_v_2_420230921210817082900000002" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-026873b30c3eb073a"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000121-v-2-42023092118321766570000002b"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000121-v-2-420230921210817082900000002"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000121-v-2-4-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000129_v_2_320230701033820955400000015" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0a2615d731cdaa857"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000129-v-2-32023070103381915570000000f"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name_prefix             = "eks-data-prod-3-worker-group-inf-20000129-v-2-3"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000129-v-2-3-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000139_v_2_420230921210817122700000008" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0350fae372357ef34"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000139-v-2-420230921183216224800000011"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000139-v-2-420230921210817122700000008"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000139-v-2-4-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000148_v_2_420230921210817100500000004" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.25"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0c38539b718116bb4"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000148-v-2-42023092118321714390000001f"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000148-v-2-420230921210817100500000004"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000148-v-2-4-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000170_v_2_420230921204703182200000005" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0d1fbb92eee709358"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000170-v-2-420230921183217660500000029"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name_prefix             = "eks-data-prod-3-worker-group-inf-20000170-v-2-4"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000170-v-2-4-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000209_v_2_32023070103382100740000001b" {
  default_cooldown          = 300
  desired_capacity          = 3
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-044b7284fe743050b"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000209-v-2-32023070103381915270000000b"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000209-v-2-32023070103382100740000001b"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000209-v-2-3-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000385_v_2_42023092120470796920000000b" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-09ef1297c35517662"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000385-v-2-420230921183216221300000001"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000385-v-2-42023092120470796920000000b"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000385-v-2-4-eks_asg"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000424_v_2_420230921210817109700000005" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0f7f2c5a1f566fe4d"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000424-v-2-420230921183217187500000025"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000424-v-2-420230921210817109700000005"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000424-v-2-4-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000430_v_2_420230921185526154200000007" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-096ed2223126909b7"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000430-v-2-420230921183216223200000005"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000430-v-2-420230921185526154200000007"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000430-v-2-4-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000441_v_2_420230921210817124800000009" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-01f124833bd49a425"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000441-v-2-42023092118321770970000002d"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000441-v-2-420230921210817124800000009"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000441-v-2-4-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000446_v_2_32023070103524639810000001c" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-06458b54511932496"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000446-v-2-320230701035244176100000005"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000446-v-2-32023070103524639810000001c"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000446-v-2-3-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000464_v_2_32023070103524642890000001f" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0e3c42058979a2010"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000464-v-2-320230701035245025600000015"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000464-v-2-32023070103524642890000001f"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000464-v-2-3-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000493_v_2_420230921210817089900000003" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-082ce00cdc25dad83"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000493-v-2-42023092118321622360000000b"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000493-v-2-420230921210817089900000003"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000493-v-2-4-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000538_v_2_32023070103524640140000001d" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0641340b6eccb4090"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000538-v-2-320230701035244178000000009"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000538-v-2-32023070103524640140000001d"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000538-v-2-3-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000565_v_2_320230701035246383700000019" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-05bede0073ab53eca"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000565-v-2-32023070103524417870000000f"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000565-v-2-320230701035246383700000019"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000565-v-2-3-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000574_v_2_42023092121081943210000000b" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0e7e8885753c2235c"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000574-v-2-420230921183217125000000015"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name_prefix             = "eks-data-prod-3-worker-group-inf-20000574-v-2-4"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000574-v-2-4-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000587_v_2_420230921185524463000000001" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-05d9e523ec2952730"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000587-v-2-420230921183217148100000021"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000587-v-2-420230921185524463000000001"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000587-v-2-4-eks_asg"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000593_v_2_32023070103524638790000001b" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-01c5146b9f7ffd910"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000593-v-2-320230701035244165600000001"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name_prefix             = "eks-data-prod-3-worker-group-inf-20000593-v-2-3"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000593-v-2-3-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000621_v_2_420230921185554796400000016" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0151e77ec8eecd5df"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000621-v-2-42023092118321622430000000d"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000621-v-2-420230921185554796400000016"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000621-v-2-4-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000638_v_2_420230921185542584300000010" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-069681043c39c3c8e"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000638-v-2-420230921183216223400000007"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000638-v-2-420230921185542584300000010"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000638-v-2-4-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000649_v_2_420230921185524505200000002" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-068328d49db59649e"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000649-v-2-420230921183217148100000023"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000649-v-2-420230921185524505200000002"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000649-v-2-4-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000657_v_2_320230701040724633300000003" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-06f355fcf7f12f056"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000657-v-2-320230701040035897300000009"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000657-v-2-320230701040724633300000003"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000657-v-2-3-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000697_v_2_420230921210817111100000006" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0d83811a3dd40ed73"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000697-v-2-42023092118321713480000001b"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000697-v-2-420230921210817111100000006"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000697-v-2-4-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000705_v_2_320230701045041506800000002" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-02cef71a1f610c9ec"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000705-v-2-32023070104003590650000000d"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000705-v-2-320230701045041506800000002"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000705-v-2-3-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000717_v_2_320230701040048132100000029" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-088f6a03fb62a58ad"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000717-v-2-320230701040035879300000001"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000717-v-2-320230701040048132100000029"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000717-v-2-3-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000735_v_2_420230701045041496200000001" {
  availability_zones        = ["us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0f5b54a2868f1f580"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000735-v-2-420230701044029965200000001"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000735-v-2-420230701045041496200000001"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000735-v-2-4-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000742_v_2_42023070104403143430000000a" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0273b5b0755e8eb2c"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000742-v-2-420230701044029965400000003"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000742-v-2-42023070104403143430000000a"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000742-v-2-4-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000756_v_2_420230701044031423900000007" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0826a9edfb14f3e2e"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000756-v-2-420230701044029965600000005"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000756-v-2-420230701044031423900000007"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000756-v-2-4-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000775_v_2_42023070104403143690000000c" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0c6af80ee90c19256"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000775-v-2-420230701043644956000000001"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000775-v-2-42023070104403143690000000c"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000775-v-2-4-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000780_v_2_420230701042714071700000001" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0e4ad6c2042ea3b59"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000780-v-2-420230701042315647600000009"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000780-v-2-420230701042714071700000001"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000780-v-2-4-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000788_v_2_420230701042949863500000002" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0bd5318d84d182543"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000788-v-2-420230701042315638300000003"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000788-v-2-420230701042949863500000002"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000788-v-2-4-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000799_v_2_42023070104403145150000000d" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-063587b2ce1ad02e1"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000799-v-2-420230701042315641300000005"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000799-v-2-42023070104403145150000000d"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000799-v-2-4-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000802_v_2_420230701042949870200000004" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-06ddd6bd647fc5ebb"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000802-v-2-42023070104231564990000000b"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000802-v-2-420230701042949870200000004"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000802-v-2-4-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000808_v_2_42023070104403143460000000b" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-00744cab43cd01bb8"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000808-v-2-420230701042315644500000007"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000808-v-2-42023070104403143460000000b"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000808-v-2-4-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_20000822_v_2_420230701042949832200000001" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-02887605e1da791b9"
        launch_template_name = "eks-data-prod-3-worker-group-inf-20000822-v-2-420230701042315635900000001"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-20000822-v-2-420230701042949832200000001"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-20000822-v-2-4-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_iptc_multimodel_v_32023070102373441060000002d" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0404bbf3eea33555b"
        launch_template_name = "eks-data-prod-3-worker-group-inf-iptc-multimodel-v-320230701023726598500000007"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-iptc-multimodel-v-32023070102373441060000002d"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-iptc-multimodel-v-3-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_inf_textsum_v_1_1202302100355150395000000af" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0341b64ddbe762009"
        launch_template_name = "eks-data-prod-3-worker-group-inf-textsum-v-1-120230210035440854700000007"
        version              = "1"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-inf-textsum-v-1-1202302100355150395000000af"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-inf-textsum-v-1-1-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_iptc_client_v_1_32023062900024532260000000b" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 5
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 100
  metrics_granularity       = "1Minute"
  min_size                  = 5
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 2
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.28"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0654910fb05c039c1"
        launch_template_name = "eks-data-prod-3-worker-group-iptc-client-v-1-320230629000243968700000009"
        version              = "1"
      }

      override {
        instance_type = "c5d.2xlarge"
      }

      override {
        instance_type = "c5n.2xlarge"
      }

      override {
        instance_type = "c4.2xlarge"
      }

      override {
        instance_type = "c3.2xlarge"
      }

      override {
        instance_type = "m5.2xlarge"
      }

      override {
        instance_type = "m5d.2xlarge"
      }

      override {
        instance_type = "m5a.2xlarge"
      }

      override {
        instance_type = "m5ad.2xlarge"
      }

      override {
        instance_type = "m5n.2xlarge"
      }

      override {
        instance_type = "m5dn.2xlarge"
      }

      override {
        instance_type = "m4.2xlarge"
      }

      override {
        instance_type = "m3.2xlarge"
      }

      override {
        instance_type = "r5.2xlarge"
      }

      override {
        instance_type = "r5d.2xlarge"
      }

      override {
        instance_type = "r5a.2xlarge"
      }

      override {
        instance_type = "r5ad.2xlarge"
      }

      override {
        instance_type = "r5n.2xlarge"
      }

      override {
        instance_type = "r5dn.2xlarge"
      }

      override {
        instance_type = "r4.2xlarge"
      }

      override {
        instance_type = "r3.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-iptc-client-v-1-32023062900024532260000000b"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-iptc-client-v-1-3-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_keybert_v_1_1202302100356083556000000bf" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-093be6b04259830a7"
        launch_template_name = "eks-data-prod-3-worker-group-keybert-v-1-120230210035444656200000079"
        version              = "1"
      }

      override {
        instance_type = "c5.xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-keybert-v-1-1202302100356083556000000bf"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-keybert-v-1-1-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_lite_v_1_1202302100354468085000000a4" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.0752"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0b1cfed0571e671c5"
        launch_template_name = "eks-data-prod-3-worker-group-lite-v-1-12023021003544178670000001f"
        version              = "1"
      }

      override {
        instance_type = "t3a.large"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-lite-v-1-1202302100354468085000000a4"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-lite-v-1-1-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-009464f3dc58611e1", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_lsh_v_1_22023062822562440910000000c" {
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0545d9d8861e3d713"
        launch_template_name = "eks-data-prod-3-worker-group-lsh-v-1-220230628225623061700000007"
        version              = "1"
      }

      override {
        instance_type = "c5.2xlarge"
      }

      override {
        instance_type = "m5.xlarge"
      }

      override {
        instance_type = "m5.2xlarge"
      }

    }

  }

  name_prefix             = "eks-data-prod-3-worker-group-lsh-v-1-2"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-lsh-v-1-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_nsfw_classifier_v1_120230921210817122500000007" {
  default_cooldown          = 300
  desired_capacity          = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 2
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0172407aeb8b2e57a"
        launch_template_name = "eks-data-prod-3-worker-group-nsfw-classifier-v1-120230921183217132500000017"
        version              = "1"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-nsfw-classifier-v1-120230921210817122500000007"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-nsfw-classifier-v1-1-eks_asg"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_pretrained_summarization_bart_ca_v_1_220230629154357191000000005" {
  availability_zones        = ["us-east-1a"]
  default_cooldown          = 300
  desired_capacity          = 5
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.9"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-07306fc78f108420d"
        launch_template_name = "eks-data-prod-3-worker-group-pretrained-summarization-bart-ca-v-1-220230628222354675900000001"
        version              = "1"
      }

      override {
        instance_type = "inf2.xlarge"
      }

      override {
        instance_type = "inf2.8xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-pretrained-summarization-bart-ca-v-1-220230629154357191000000005"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-pretrained-summarization-bart-ca-v-1-2-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_pretrained_summarization_bart_es_v_1_32023062915440719140000000c" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.9"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0ebe4739c06cc46e7"
        launch_template_name = "eks-data-prod-3-worker-group-pretrained-summarization-bart-es-v-1-32023062822235467970000000b"
        version              = "1"
      }

      override {
        instance_type = "inf2.xlarge"
      }

      override {
        instance_type = "inf2.8xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-pretrained-summarization-bart-es-v-1-32023062915440719140000000c"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-pretrained-summarization-bart-es-v-1-3-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-0b6ef8616d2b30de5", "subnet-016e178581ba088d5", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_pretrained_summarization_bart_it_fanpage_v_1_32023062915441016200000000d" {
  availability_zones        = ["us-east-1a"]
  default_cooldown          = 300
  desired_capacity          = 8
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.9"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-02ade810fc63a831d"
        launch_template_name = "eks-data-prod-3-worker-group-pretrained-summarization-bart-it-fanpage-v-1-32023062822235468180000000f"
        version              = "1"
      }

      override {
        instance_type = "inf2.xlarge"
      }

      override {
        instance_type = "inf2.8xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-pretrained-summarization-bart-it-fanpage-v-1-32023062915441016200000000d"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-pretrained-summarization-bart-it-fanpage-v-1-3-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_pretrained_summarization_bart_latest_v_1_420230731222126333200000001" {
  availability_zones        = ["us-east-1a"]
  default_cooldown          = 300
  desired_capacity          = 7
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.9"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0ae4f55a70c3fe6d4"
        launch_template_name = "eks-data-prod-3-worker-group-pretrained-summarization-bart-latest-v-1-420230731221854131800000001"
        version              = "1"
      }

      override {
        instance_type = "inf2.xlarge"
      }

      override {
        instance_type = "inf2.8xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-pretrained-summarization-bart-latest-v-1-420230731222126333200000001"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-pretrained-summarization-bart-latest-v-1-4-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_pretrained_summarization_brio_v_1_220230629154357186500000004" {
  default_cooldown          = 300
  desired_capacity          = 12
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.9"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-041cccdbf89478058"
        launch_template_name = "eks-data-prod-3-worker-group-pretrained-summarization-brio-v-1-220230628222354917400000011"
        version              = "1"
      }

      override {
        instance_type = "inf2.xlarge"
      }

      override {
        instance_type = "inf2.8xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-pretrained-summarization-brio-v-1-220230629154357186500000004"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-pretrained-summarization-brio-v-1-2-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-0b6ef8616d2b30de5", "subnet-016e178581ba088d5", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_pretrained_summarization_client_v_1_120230629154357130200000002" {
  default_cooldown          = 300
  desired_capacity          = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.45"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0b7c191c952aa95e0"
        launch_template_name = "eks-data-prod-3-worker-group-pretrained-summarization-client-v-1-120230628222354678200000007"
        version              = "1"
      }

      override {
        instance_type = "c5.xlarge"
      }

    }

  }

  name_prefix             = "eks-data-prod-3-worker-group-pretrained-summarization-client-v-1-1"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-pretrained-summarization-client-v-1-1-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_pretrained_summarization_deltalm_v_1_720230629154357202700000006" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 10
      spot_max_price                = "1.0"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-06089463a10af4cdb"
        launch_template_name = "eks-data-prod-3-worker-group-pretrained-summarization-deltalm-v-1-720230628222354678100000005"
        version              = "1"
      }

      override {
        instance_type = "g4dn.2xlarge"
      }

      override {
        instance_type = "g4dn.4xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-pretrained-summarization-deltalm-v-1-720230629154357202700000006"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-pretrained-summarization-deltalm-v-1-7-eks_asg"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_pretrained_summarization_mbart_v_1_320230803171456834000000003" {
  availability_zones        = ["us-east-1a"]
  default_cooldown          = 300
  desired_capacity          = 12
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.9"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-05477e0c3e4c08113"
        launch_template_name = "eks-data-prod-3-worker-group-pretrained-summarization-mbart-v-1-320230803171455653800000001"
        version              = "1"
      }

      override {
        instance_type = "inf2.xlarge"
      }

      override {
        instance_type = "inf2.8xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-pretrained-summarization-mbart-v-1-320230803171456834000000003"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-pretrained-summarization-mbart-v-1-3-eks_asg"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_pretrained_summarization_nasca_v_1_22023062915440090060000000b" {
  availability_zones        = ["us-east-1a"]
  default_cooldown          = 300
  desired_capacity          = 5
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.9"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0d481dc93f97fd0a8"
        launch_template_name = "eks-data-prod-3-worker-group-pretrained-summarization-nasca-v-1-220230628222354678100000003"
        version              = "1"
      }

      override {
        instance_type = "inf2.xlarge"
      }

      override {
        instance_type = "inf2.8xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-pretrained-summarization-nasca-v-1-22023062915440090060000000b"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-pretrained-summarization-nasca-v-1-2-eks_asg"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_prom_v_1_1202302100355151802000000b0" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1d", "us-east-1a", "us-east-1b"]
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 1
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0ead2c206a5f14adf"
        launch_template_name = "eks-data-prod-3-worker-group-prom-v-1-120230210035441784900000019"
        version              = "1"
      }

      override {
        instance_type = "c5.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-prom-v-1-1202302100355151802000000b0"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-prom-v-1-1-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "eks_data_prod_3_worker_group_serv_v_1_220230628223942297100000003" {
  default_cooldown          = 300
  desired_capacity          = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 15
  metrics_granularity       = "1Minute"
  min_size                  = 2
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0b4c518074b7abfaa"
        launch_template_name = "eks-data-prod-3-worker-group-serv-v-1-220230628223941222200000001"
        version              = "1"
      }

      override {
        instance_type = "c5.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-3-worker-group-serv-v-1-220230628223942297100000003"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod-3"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-3-worker-group-serv-v-1-2-eks_asg"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod-3"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod-3"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-0200b48248f4da7ac", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_worker_group_gpu1_v_1_2520210512214531218600000002" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 1
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0a351351fd357e685"
        launch_template_name = "eks-data-prod-worker-group-gpu1-v-1-2520210512205020208100000001"
        version              = "$Latest"
      }

      override {
        instance_type = "g4dn.xlarge"
      }

    }

  }

  name                    = "eks-data-prod-worker-group-gpu1-v-1-2520210512214531218600000002"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-worker-group-gpu1-v-1-25-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-00405c02874c638ff", "subnet-0b6ef8616d2b30de5", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_worker_group_inf1_v_1_2520201028194558367600000005" {
  capacity_rebalance        = true
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 5
      spot_allocation_strategy      = "capacity-optimized"
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0699b1eac2e24e425"
        launch_template_name = "eks-data-prod-worker-group-inf1-v-1-2520201028194556868800000001"
        version              = "$Latest"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name_prefix             = "eks-data-prod-worker-group-inf1-v-1-25"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-worker-group-inf1-v-1-25-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-00405c02874c638ff", "subnet-0b6ef8616d2b30de5", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_worker_group_inf2_v_1_2520201028194558369400000006" {
  capacity_rebalance        = true
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "capacity-optimized"
      spot_max_price                = "0.4"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0e198a78aa2115fda"
        launch_template_name = "eks-data-prod-worker-group-inf2-v-1-2520201028194556869600000002"
        version              = "$Latest"
      }

      override {
        instance_type = "inf1.xlarge"
      }

      override {
        instance_type = "inf1.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-worker-group-inf2-v-1-2520201028194558369400000006"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-worker-group-inf2-v-1-25-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-00405c02874c638ff", "subnet-0b6ef8616d2b30de5", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_worker_group_lite_v_1_2120201027220819585800000009" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.0752"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0c1f3c8ee028bb320"
        launch_template_name = "eks-data-prod-worker-group-lite-v-1-2120201027220817958300000002"
        version              = "$Latest"
      }

      override {
        instance_type = "t3a.large"
      }

    }

  }

  name                    = "eks-data-prod-worker-group-lite-v-1-2120201027220819585800000009"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-worker-group-lite-v-1-21-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-00405c02874c638ff", "subnet-0b6ef8616d2b30de5", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "eks_data_prod_worker_group_serv_v_1_2220201027224940002600000005" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 1
      spot_max_price                = "0.35"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0542b6e5129aec7a7"
        launch_template_name = "eks-data-prod-worker-group-serv-v-1-2220201027224938456500000001"
        version              = "$Latest"
      }

      override {
        instance_type = "c5.2xlarge"
      }

    }

  }

  name                    = "eks-data-prod-worker-group-serv-v-1-2220201027224940002600000005"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-data-prod"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Billing-Detail"
    propagate_at_launch = true
    value               = "eks-data-prod"
  }

  tag {
    key                 = "Billing"
    propagate_at_launch = true
    value               = "data"
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-data-prod"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "eks-data-prod-worker-group-serv-v-1-22-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-00405c02874c638ff", "subnet-0b6ef8616d2b30de5", "subnet-009464f3dc58611e1"]
}

resource "aws_autoscaling_group" "onclusive_production_prometheus_worker_group20221004140214621000000004" {
  availability_zones        = ["us-east-1d"]
  default_cooldown          = 300
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  launch_template {
    id      = "lt-0faf9edd8a486e71a"
    version = "$Latest"
  }

  max_size                = 3
  metrics_granularity     = "1Minute"
  min_size                = 1
  name                    = "onclusive-production-prometheus-worker-group20221004140214621000000004"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/onclusive-production"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/onclusive-production"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "onclusive-production-prometheus-worker-group-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

}

resource "aws_autoscaling_group" "onclusive_production_worker_group_120221004003356355700000019" {
  default_cooldown          = 300
  desired_capacity          = 4
  health_check_grace_period = 300
  health_check_type         = "EC2"
  launch_template {
    id      = "lt-007f6d069432e5078"
    version = "$Latest"
  }

  max_size                = 10
  metrics_granularity     = "1Minute"
  min_size                = 2
  name                    = "onclusive-production-worker-group-120221004003356355700000019"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/onclusive-production"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "onclusive-production-worker-group-1-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/onclusive-production"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-0eb36974dbf0d5064", "subnet-09e6a9311f19dbe1f", "subnet-03a340900a4a60585"]
}

resource "aws_autoscaling_group" "onclusive_production_worker_group_22022100400335635900000001a" {
  default_cooldown          = 300
  desired_capacity          = 9
  health_check_grace_period = 300
  health_check_type         = "EC2"
  launch_template {
    id      = "lt-0d02acfd00d6c377c"
    version = "$Latest"
  }

  max_size                = 15
  metrics_granularity     = "1Minute"
  min_size                = 3
  name_prefix             = "onclusive-production-worker-group-2"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes     = ["AZRebalance"]
  tag {
    key                 = "kubernetes.io/cluster/onclusive-production"
    propagate_at_launch = true
    value               = "owned"
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "onclusive-production-worker-group-2-eks_asg"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/onclusive-production"
    propagate_at_launch = false
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = false
    value               = "true"
  }

  vpc_zone_identifier = ["subnet-0825557bc6a7cddbf", "subnet-04ca43146b297f9f2", "subnet-07c200e1281af9dd9"]
}

resource "aws_autoscaling_group" "percolates_5x_asg" {
  capacity_rebalance        = true
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  launch_template {
    id      = "lt-0e61b5fc3cfd6a4ff"
    version = "$Latest"
  }

  max_size                = 5
  metrics_granularity     = "1Minute"
  min_size                = 0
  name                    = "percolates_5x_asg"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  tag {
    key                 = "Name"
    propagate_at_launch = false
    value               = "crawler-percolate old_asg"
  }

  vpc_zone_identifier = ["subnet-7a1e3976", "subnet-12ae6859", "subnet-a27e45f8", "subnet-ce408ff1", "subnet-0e5c5a22"]
}

resource "aws_autoscaling_group" "percolates_5x_capacity_optimized_asg" {
  capacity_rebalance        = true
  default_cooldown          = 180
  desired_capacity          = 300
  enabled_metrics           = ["GroupStandbyInstances", "WarmPoolWarmedCapacity", "GroupAndWarmPoolTotalCapacity", "GroupTotalInstances", "GroupTotalCapacity", "GroupInServiceCapacity", "WarmPoolTerminatingCapacity", "GroupStandbyCapacity", "GroupPendingInstances", "WarmPoolMinSize", "GroupTerminatingInstances", "WarmPoolPendingCapacity", "GroupDesiredCapacity", "GroupAndWarmPoolDesiredCapacity", "GroupInServiceInstances", "GroupTerminatingCapacity", "GroupMinSize", "GroupMaxSize", "WarmPoolTotalCapacity", "GroupPendingCapacity", "WarmPoolDesiredCapacity"]
  health_check_grace_period = 600
  health_check_type         = "EC2"
  max_size                  = 350
  metrics_granularity       = "1Minute"
  min_size                  = 300
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "lowest-price"
      on_demand_base_capacity       = 2
      spot_allocation_strategy      = "price-capacity-optimized"
      spot_max_price                = "0.096"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-032490cfdf5c14fc0"
        launch_template_name = "percolates_5x_capacity_optimized"
        version              = "$Latest"
      }

    }

  }

  name                    = "percolates_5x_capacity_optimized_asg"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  tag {
    key                 = "Name"
    propagate_at_launch = false
    value               = "crawler-percolates capacity_optimized"
  }

  target_group_arns    = ["arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/crawler-percolates-5x/86fef6459504b7b1"]
  termination_policies = ["ClosestToNextInstanceHour"]
  vpc_zone_identifier  = ["subnet-08fa77658b25a3e2d", "subnet-0df45c79ea3ba19c0", "subnet-082977e88e56ea92f", "subnet-0fc2b6b6b75dcbd6f", "subnet-0101a49affa40af86"]
}

resource "aws_autoscaling_group" "percolates_5x_lowest_price_asg" {
  default_cooldown          = 180
  desired_capacity          = 1
  enabled_metrics           = ["GroupStandbyInstances", "WarmPoolWarmedCapacity", "GroupAndWarmPoolTotalCapacity", "GroupTotalInstances", "GroupTotalCapacity", "GroupInServiceCapacity", "WarmPoolTerminatingCapacity", "GroupStandbyCapacity", "GroupPendingInstances", "WarmPoolMinSize", "GroupTerminatingInstances", "WarmPoolPendingCapacity", "GroupDesiredCapacity", "GroupAndWarmPoolDesiredCapacity", "GroupInServiceInstances", "GroupTerminatingCapacity", "GroupMinSize", "GroupMaxSize", "WarmPoolTotalCapacity", "GroupPendingCapacity", "WarmPoolDesiredCapacity"]
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 1
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 4
      spot_max_price                = "0.096"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-02d1e1f399ab51b22"
        launch_template_name = "percolates_5x_lowest_price"
        version              = "$Latest"
      }

      override {
        instance_type = "r5.xlarge"
      }

      override {
        instance_type = "r5d.xlarge"
      }

      override {
        instance_type = "r5a.xlarge"
      }

      override {
        instance_type = "r5ad.xlarge"
      }

      override {
        instance_type = "r5n.xlarge"
      }

      override {
        instance_type = "r5dn.xlarge"
      }

      override {
        instance_type = "r6a.xlarge"
      }

      override {
        instance_type = "r6i.xlarge"
      }

      override {
        instance_type = "r6id.xlarge"
      }

      override {
        instance_type = "r6in.xlarge"
      }

      override {
        instance_type = "r6idn.xlarge"
      }

    }

  }

  name                    = "percolates_5x_lowest_price_asg"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  tag {
    key                 = "Name"
    propagate_at_launch = false
    value               = "crawler-percolates lowest_price"
  }

  termination_policies = ["ClosestToNextInstanceHour"]
  vpc_zone_identifier  = ["subnet-0df45c79ea3ba19c0", "subnet-082977e88e56ea92f", "subnet-0fc2b6b6b75dcbd6f", "subnet-0101a49affa40af86"]
}

resource "aws_autoscaling_group" "percolates_fe_5x_asg" {
  capacity_rebalance        = true
  default_cooldown          = 300
  desired_capacity          = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 4
  metrics_granularity       = "1Minute"
  min_size                  = 2
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      on_demand_base_capacity       = 2
      spot_allocation_strategy      = "price-capacity-optimized"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-03a11b0bbd5a76561"
        launch_template_name = "percolates_fe_5x_lt"
        version              = "$Latest"
      }

      override {
        instance_type = "m5a.2xlarge"
      }

      override {
        instance_type = "m5ad.2xlarge"
      }

      override {
        instance_type = "m5.2xlarge"
      }

      override {
        instance_type = "m5d.2xlarge"
      }

      override {
        instance_type = "m5n.2xlarge"
      }

      override {
        instance_type = "m5dn.2xlarge"
      }

      override {
        instance_type = "m4.2xlarge"
      }

      override {
        instance_type = "m3.2xlarge"
      }

      override {
        instance_type = "r5a.2xlarge"
      }

      override {
        instance_type = "r5ad.2xlarge"
      }

      override {
        instance_type = "r5.2xlarge"
      }

      override {
        instance_type = "r5d.2xlarge"
      }

      override {
        instance_type = "r5n.2xlarge"
      }

      override {
        instance_type = "r5dn.2xlarge"
      }

      override {
        instance_type = "r4.2xlarge"
      }

      override {
        instance_type = "r3.2xlarge"
      }

      override {
        instance_type = "c5.2xlarge"
      }

      override {
        instance_type = "c5d.2xlarge"
      }

      override {
        instance_type = "c5n.2xlarge"
      }

      override {
        instance_type = "c4.2xlarge"
      }

      override {
        instance_type = "c3.2xlarge"
      }

    }

  }

  name                    = "percolates_fe_5x_asg"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  tag {
    key                 = "Name"
    propagate_at_launch = false
    value               = "crawler-percolates-fe"
  }

  vpc_zone_identifier = ["subnet-7a1e3976", "subnet-12ae6859", "subnet-a27e45f8", "subnet-ce408ff1", "subnet-0e5c5a22"]
}

resource "aws_autoscaling_group" "prod_crawler_master_asg" {
  default_cooldown          = 180
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 5
      spot_max_price                = "0.05"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0e03069fa3efd9ecc"
        launch_template_name = "prod-crawler-master-lt"
        version              = "$Latest"
      }

      override {
        instance_type     = "m3.medium"
        weighted_capacity = "1"
      }

      override {
        instance_type     = "c7g.medium"
        weighted_capacity = "1"
      }

      override {
        instance_type     = "c6g.medium"
        weighted_capacity = "1"
      }

      override {
        instance_type     = "m6g.medium"
        weighted_capacity = "1"
      }

      override {
        instance_type     = "r6g.medium"
        weighted_capacity = "1"
      }

      override {
        instance_type     = "m6gd.medium"
        weighted_capacity = "1"
      }

      override {
        instance_type     = "c6gd.medium"
        weighted_capacity = "1"
      }

      override {
        instance_type     = "r6gd.medium"
        weighted_capacity = "1"
      }

      override {
        instance_type     = "c6gn.medium"
        weighted_capacity = "1"
      }

    }

  }

  name                    = "prod-crawler-master_asg"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  target_group_arns       = ["arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/prod-crawler-master-01/fd756f84ef94cb54"]
  termination_policies    = ["OldestInstance"]
  vpc_zone_identifier     = ["subnet-d6d1a5fb", "subnet-d45f328f", "subnet-5a19a566", "subnet-c62f09ca"]
}

resource "aws_autoscaling_group" "prod_crawler_worker_staging_asg" {
  availability_zones        = ["us-east-1f", "us-east-1e", "us-east-1a", "us-east-1c"]
  default_cooldown          = 180
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  max_size                  = 1
  metrics_granularity       = "1Minute"
  min_size                  = 1
  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy = "prioritized"
      spot_allocation_strategy      = "lowest-price"
      spot_instance_pools           = 2
      spot_max_price                = "0.04"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0ab9a4de8e4d745a7"
        launch_template_name = "prod-crawler-worker-staging-lt"
        version              = "$Latest"
      }

      override {
        instance_type     = "m3.medium"
        weighted_capacity = "1"
      }

    }

  }

  name                    = "prod-crawler-worker-staging_asg"
  service_linked_role_arn = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  termination_policies    = ["OldestInstance"]
}

resource "aws_autoscaling_group" "security_patcher_crawler_asg" {
  default_cooldown          = 300
  health_check_grace_period = 300
  health_check_type         = "EC2"
  launch_configuration      = "crawler-security-patch-v5"
  max_size                  = 0
  metrics_granularity       = "1Minute"
  min_size                  = 0
  name                      = "security-patcher-crawler-asg"
  service_linked_role_arn   = "arn:aws:iam::484375727565:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "security-patch-instance"
  }

  vpc_zone_identifier = ["subnet-0518a439"]
}

