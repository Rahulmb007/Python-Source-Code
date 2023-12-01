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

resource "aws_autoscaling_policy" "airpr_extractor_light4j_external_asg_airpr_extractor_light4j_external___scale_in" {
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = "airpr-extractor-light4j-external_asg"
  cooldown               = 300
  name                   = "airpr-extractor-light4j-external - Scale In"
  policy_type            = "SimpleScaling"
  scaling_adjustment     = -1
}

resource "aws_autoscaling_policy" "airpr_extractor_light4j_external_asg_airpr_extractor_light4j_external___scale_out" {
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = "airpr-extractor-light4j-external_asg"
  cooldown               = 300
  name                   = "airpr-extractor-light4j-external - Scale Out"
  policy_type            = "SimpleScaling"
  scaling_adjustment     = 2
}

resource "aws_autoscaling_policy" "airpr_extractor_light4j_internal_asg_airpr_extractor_light4j_internal___scale_in" {
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = "airpr-extractor-light4j-internal_asg"
  cooldown               = 300
  name                   = "airpr-extractor-light4j-internal - Scale In"
  policy_type            = "SimpleScaling"
  scaling_adjustment     = -10
}

resource "aws_autoscaling_policy" "airpr_extractor_light4j_internal_asg_airpr_extractor_light4j_internal___scale_out" {
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = "airpr-extractor-light4j-internal_asg"
  cooldown               = 300
  name                   = "airpr-extractor-light4j-internal - Scale Out"
  policy_type            = "SimpleScaling"
  scaling_adjustment     = 15
}

resource "aws_autoscaling_policy" "airpr_extractor_light4j_internal_asg_airpr_extractor_light4j_internal_asg_predictive_policy" {
  autoscaling_group_name = "airpr-extractor-light4j-internal_asg"
  name                   = "airpr-extractor-light4j-internal_asg-predictive-policy"
  policy_type            = "PredictiveScaling"
  predictive_scaling_configuration {
    max_capacity_breach_behavior = "HonorMaxCapacity"
    metric_specification {
      predefined_metric_pair_specification {
        predefined_metric_type = "ASGCPUUtilization"
        resource_label         = ""
      }

      target_value = 80
    }

    mode                   = "ForecastAndScale"
    scheduling_buffer_time = "300"
  }

}

resource "aws_autoscaling_policy" "airpr_extractor_light4j_internal_asg_target_tracking_policy" {
  autoscaling_group_name = "airpr-extractor-light4j-internal_asg"
  name                   = "Target Tracking Policy"
  policy_type            = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 80
  }

}

resource "aws_autoscaling_policy" "awseb_e_jhgmmvyhm6_stack_awsebautoscalinggroup_hh0rwvk7feap_awseb_e_jhgmmvyhm6_stack_awsebautoscalingscaledownpolicy_dratpd6zl88p" {
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = "awseb-e-jhgmmvyhm6-stack-AWSEBAutoScalingGroup-HH0RWVK7FEAP"
  name                   = "awseb-e-jhgmmvyhm6-stack-AWSEBAutoScalingScaleDownPolicy-DRATPD6ZL88P"
  policy_type            = "SimpleScaling"
  scaling_adjustment     = -1
}

resource "aws_autoscaling_policy" "awseb_e_jhgmmvyhm6_stack_awsebautoscalinggroup_hh0rwvk7feap_awseb_e_jhgmmvyhm6_stack_awsebautoscalingscaleuppolicy_1eiv3863sss67" {
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = "awseb-e-jhgmmvyhm6-stack-AWSEBAutoScalingGroup-HH0RWVK7FEAP"
  name                   = "awseb-e-jhgmmvyhm6-stack-AWSEBAutoScalingScaleUpPolicy-1EIV3863SSS67"
  policy_type            = "SimpleScaling"
}

resource "aws_autoscaling_policy" "awseb_e_snmkhfqac3_stack_awsebautoscalinggroup_w4dohsxd8x9b_awseb_e_snmkhfqac3_stack_awsebautoscalingscaledownpolicy_eev1e33akibs" {
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = "awseb-e-snmkhfqac3-stack-AWSEBAutoScalingGroup-W4DOHSXD8X9B"
  name                   = "awseb-e-snmkhfqac3-stack-AWSEBAutoScalingScaleDownPolicy-Eev1e33akiBs"
  policy_type            = "SimpleScaling"
  scaling_adjustment     = -1
}

resource "aws_autoscaling_policy" "awseb_e_snmkhfqac3_stack_awsebautoscalinggroup_w4dohsxd8x9b_awseb_e_snmkhfqac3_stack_awsebautoscalingscaleuppolicy_na4ag666fbvp" {
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = "awseb-e-snmkhfqac3-stack-AWSEBAutoScalingGroup-W4DOHSXD8X9B"
  name                   = "awseb-e-snmkhfqac3-stack-AWSEBAutoScalingScaleUpPolicy-nA4AG666fbVp"
  policy_type            = "SimpleScaling"
  scaling_adjustment     = 2
}

resource "aws_autoscaling_policy" "awseb_e_t4hw5gcuek_stack_awsebautoscalinggroup_10whjzpx7ntm5_awseb_e_t4hw5gcuek_stack_awsebautoscalingscaledownpolicy_1s3u9zwau6uag" {
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = "awseb-e-t4hw5gcuek-stack-AWSEBAutoScalingGroup-10WHJZPX7NTM5"
  name                   = "awseb-e-t4hw5gcuek-stack-AWSEBAutoScalingScaleDownPolicy-1S3U9ZWAU6UAG"
  policy_type            = "SimpleScaling"
  scaling_adjustment     = -1
}

resource "aws_autoscaling_policy" "awseb_e_t4hw5gcuek_stack_awsebautoscalinggroup_10whjzpx7ntm5_awseb_e_t4hw5gcuek_stack_awsebautoscalingscaleuppolicy_1lsfqknlj3ker" {
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = "awseb-e-t4hw5gcuek-stack-AWSEBAutoScalingGroup-10WHJZPX7NTM5"
  name                   = "awseb-e-t4hw5gcuek-stack-AWSEBAutoScalingScaleUpPolicy-1LSFQKNLJ3KER"
  policy_type            = "SimpleScaling"
  scaling_adjustment     = 2
}

resource "aws_autoscaling_policy" "awseb_e_t9775cemkk_stack_awsebautoscalinggroup_1ip0h100dclh9_awseb_e_t9775cemkk_stack_awsebautoscalingscaledownpolicy_8evo3796xjqm" {
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = "awseb-e-t9775cemkk-stack-AWSEBAutoScalingGroup-1IP0H100DCLH9"
  name                   = "awseb-e-t9775cemkk-stack-AWSEBAutoScalingScaleDownPolicy-8EVO3796XJQM"
  policy_type            = "SimpleScaling"
  scaling_adjustment     = -1
}

resource "aws_autoscaling_policy" "awseb_e_t9775cemkk_stack_awsebautoscalinggroup_1ip0h100dclh9_awseb_e_t9775cemkk_stack_awsebautoscalingscaleuppolicy_69qdblrb7chj" {
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = "awseb-e-t9775cemkk-stack-AWSEBAutoScalingGroup-1IP0H100DCLH9"
  name                   = "awseb-e-t9775cemkk-stack-AWSEBAutoScalingScaleUpPolicy-69QDBLRB7CHJ"
  policy_type            = "SimpleScaling"
  scaling_adjustment     = 1
}

resource "aws_autoscaling_policy" "bert_inference_v1_gpu_asg_2_elb_5xx_scale_out" {
  adjustment_type           = "ChangeInCapacity"
  autoscaling_group_name    = "bert_inference_v1-gpu_asg_2"
  estimated_instance_warmup = 180
  metric_aggregation_type   = "Average"
  name                      = "elb_5xx_scale_out"
  policy_type               = "StepScaling"
  step_adjustment {
    metric_interval_lower_bound = "0"
    scaling_adjustment          = 2
  }

}

resource "aws_autoscaling_policy" "bert_inference_v1_gpu_asg_2_scale_in_bert_inference_v1_gpu" {
  adjustment_type         = "ChangeInCapacity"
  autoscaling_group_name  = "bert_inference_v1-gpu_asg_2"
  metric_aggregation_type = "Average"
  name                    = "scale_in_bert_inference_v1-gpu"
  policy_type             = "StepScaling"
  step_adjustment {
    metric_interval_upper_bound = "0"
    scaling_adjustment          = -1
  }

}

resource "aws_autoscaling_policy" "bert_inference_v1_gpu_asg_2_scale_out_bert_inference_v1_gpu" {
  adjustment_type           = "ChangeInCapacity"
  autoscaling_group_name    = "bert_inference_v1-gpu_asg_2"
  estimated_instance_warmup = 240
  metric_aggregation_type   = "Average"
  name                      = "scale_out_bert_inference_v1-gpu"
  policy_type               = "StepScaling"
  step_adjustment {
    metric_interval_lower_bound = "0"
    scaling_adjustment          = 2
  }

}

resource "aws_autoscaling_policy" "percolates_5x_capacity_optimized_asg_percolates_5x___capacity_optimized___scale_in" {
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = "percolates_5x_capacity_optimized_asg"
  cooldown               = 600
  name                   = "Percolates 5x - capacity_optimized - Scale In"
  policy_type            = "SimpleScaling"
  scaling_adjustment     = -6
}

resource "aws_autoscaling_policy" "percolates_5x_capacity_optimized_asg_percolates_5x___capacity_optimized___scale_out" {
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = "percolates_5x_capacity_optimized_asg"
  cooldown               = 300
  name                   = "Percolates 5x - capacity_optimized - Scale Out"
  policy_type            = "SimpleScaling"
  scaling_adjustment     = 6
}

resource "aws_autoscaling_policy" "percolates_5x_lowest_price_asg_percolates_5x___lowestprice___scale_in" {
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = "percolates_5x_lowest_price_asg"
  cooldown               = 3000
  name                   = "Percolates 5x - lowestprice - Scale In"
  policy_type            = "SimpleScaling"
  scaling_adjustment     = -2
}

resource "aws_autoscaling_policy" "percolates_5x_lowest_price_asg_percolates_5x___lowestprice___scale_out" {
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = "percolates_5x_lowest_price_asg"
  cooldown               = 3000
  name                   = "Percolates 5x - lowestprice - Scale Out"
  policy_type            = "SimpleScaling"
  scaling_adjustment     = 6
}

resource "aws_autoscaling_policy" "prod_crawler_master_asg_prod_crawler_master___scale_in" {
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = "prod-crawler-master_asg"
  cooldown               = 300
  name                   = "prod-crawler-master - Scale In"
  policy_type            = "SimpleScaling"
  scaling_adjustment     = -2
}

resource "aws_autoscaling_policy" "prod_crawler_master_asg_prod_crawler_master___scale_out" {
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = "prod-crawler-master_asg"
  cooldown               = 300
  name                   = "prod-crawler-master - Scale Out"
  policy_type            = "SimpleScaling"
  scaling_adjustment     = 3
}

resource "aws_autoscaling_policy" "prod_crawler_worker_staging_asg_prod_crawler_worker_staging___scale_in" {
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = "prod-crawler-worker-staging_asg"
  cooldown               = 300
  name                   = "prod-crawler-worker-staging - Scale In"
  policy_type            = "SimpleScaling"
  scaling_adjustment     = -2
}

resource "aws_autoscaling_policy" "prod_crawler_worker_staging_asg_prod_crawler_worker_staging___scale_out" {
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = "prod-crawler-worker-staging_asg"
  cooldown               = 300
  name                   = "prod-crawler-worker-staging - Scale Out"
  policy_type            = "SimpleScaling"
  scaling_adjustment     = 3
}

