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

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_ac126a33_argocd_dev3argocd_a687_4cf2c3f1d9c523fc_eee13858d6218614" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/380f9698-36fe-435e-9c70-7398073467e3"
  default_action {
    fixed_response {
      content_type = "text/plain"
      status_code  = "404"
    }

    order = 1
    type  = "fixed-response"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/ac126a33-argocd-dev3argocd-a687/4cf2c3f1d9c523fc"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_ac126a33_default_dev3ingre_dd09_84c4412c7a5c5bb9_521a23dce5dd4236" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/380f9698-36fe-435e-9c70-7398073467e3"
  default_action {
    fixed_response {
      content_type = "text/plain"
      status_code  = "404"
    }

    order = 1
    type  = "fixed-response"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/ac126a33-default-dev3ingre-dd09/84c4412c7a5c5bb9"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_ac126a33_istiosystem_dev3i_f8f0_9e5fcac98f550afb_72b5695149f7dcca" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/380f9698-36fe-435e-9c70-7398073467e3"
  default_action {
    fixed_response {
      content_type = "text/plain"
      status_code  = "404"
    }

    order = 1
    type  = "fixed-response"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/ac126a33-istiosystem-dev3i-f8f0/9e5fcac98f550afb"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_airpr_extractor_light4j_external_0b44b4a16dcc459a_4408e36c0dae54e9" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/bb7b8fa4-a8a5-420e-b0a7-ce094564feb0"
  default_action {
    order            = 1
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/airpr-extractor-light4j-external/b78f3a1b2f7bb452"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/airpr-extractor-light4j-external/0b44b4a16dcc459a"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_airpr_extractor_light4j_f1dff3cee26ff8cd_e6648430c02d7222" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/bb7b8fa4-a8a5-420e-b0a7-ce094564feb0"
  default_action {
    order            = 1
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/airpr-extractor-light4j/7990b4ac46940dfb"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/airpr-extractor-light4j/f1dff3cee26ff8cd"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_airpr_extractor_light4j_internal_9cc8bb0e474d54b2_0215d104f81422cd" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/bb7b8fa4-a8a5-420e-b0a7-ce094564feb0"
  default_action {
    forward {
      stickiness {
        duration = 3600
      }

      target_group {
        arn    = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/airpr-extractor-light4j-sl/22cdf61ea41150f6"
        weight = 65
      }

      target_group {
        arn    = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/airpr-extractor-light4j-int-r/28d8026f12bc09ec"
        weight = 35
      }

    }

    order = 1
    type  = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/airpr-extractor-light4j-internal/9cc8bb0e474d54b2"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_airpr_visitor_estimation_0e46e8ae62a2052d_1375447ffd0f3c6e" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/bb7b8fa4-a8a5-420e-b0a7-ce094564feb0"
  default_action {
    order            = 1
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/airpr-visitor-estimation-in/ab1fc3ba21164b50"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/airpr-visitor-estimation/0e46e8ae62a2052d"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_analyst_es_5x_7575abbee24bce0d_757cafdc033253a5" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/bb7b8fa4-a8a5-420e-b0a7-ce094564feb0"
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/analyst-es-5x/86ddec83520445eb"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/analyst-es-5x/7575abbee24bce0d"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_analytics_es_5x_7af6b8bcd507e73b_310418dff82e425c" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/bb7b8fa4-a8a5-420e-b0a7-ce094564feb0"
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/analytics-es-5x/30d8eda4d7d7eeda"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/analytics-es-5x/7af6b8bcd507e73b"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_analytics_es_6x_1627caec887b817e_f9f71d3eaf70a2cc" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/bb7b8fa4-a8a5-420e-b0a7-ce094564feb0"
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/analytics-es-6x/19bf24db8bb506fc"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/analytics-es-6x/1627caec887b817e"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_awseb_e_t_awsebloa_1nbqqiydfq9fu_0c933861792d4cc3_ece5803994ee517d" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/bb7b8fa4-a8a5-420e-b0a7-ce094564feb0"
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/awseb-e-t-AWSEBLoa-1NBQQIYDFQ9FU/6168e72d139f6660"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/awseb-e-t-AWSEBLoa-1NBQQIYDFQ9FU/0c933861792d4cc3"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_bert_inference_internal_becafa9570058757_64a9e1594ed59cb6" {
  default_action {
    order            = 1
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/bert-inference-tg-v1-gpu/fea9ebc47289dd07"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/bert-inference-internal/becafa9570058757"
  port              = 80
  protocol          = "HTTP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_bert_inference_internal_becafa9570058757_cd95877fac9f341f" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/380f9698-36fe-435e-9c70-7398073467e3"
  default_action {
    order            = 1
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/bert-inference-tg-v1-gpu/fea9ebc47289dd07"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/bert-inference-internal/becafa9570058757"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_crawler_es_6x_4d921cbee6fc5ad5_1faaab65dcfa53da" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/bb7b8fa4-a8a5-420e-b0a7-ce094564feb0"
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/crawler-es-6x/e199539b3fef0122"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/crawler-es-6x/4d921cbee6fc5ad5"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_crawler_es_client_6b792cfb976f9e9b_96ba9d6e19f8ba0e" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/bb7b8fa4-a8a5-420e-b0a7-ce094564feb0"
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/crawler-es-client/3701de8785773646"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/crawler-es-client/6b792cfb976f9e9b"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_crawler_es_util_6fd6b370b0d0c38a_88612c87040c8d01" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/bb7b8fa4-a8a5-420e-b0a7-ce094564feb0"
  default_action {
    order            = 1
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/cerebro/44003fc029dc2925"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/crawler-es-util/6fd6b370b0d0c38a"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_crawler_percolates_5x_cc3a31f4746d1582_5e31a6829f83f907" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/bb7b8fa4-a8a5-420e-b0a7-ce094564feb0"
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/crawler-percolates-5x/86fef6459504b7b1"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/crawler-percolates-5x/cc3a31f4746d1582"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_crawler_percolates_fe_5x_60130645376ab7be_a2fc203084cac50f" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/bb7b8fa4-a8a5-420e-b0a7-ce094564feb0"
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/crawler-percolates-fe-5x/e286814ecab26c00"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/crawler-percolates-fe-5x/60130645376ab7be"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_crawler_prod_es_6x_712e6df24692bb95_b84b282013bf4170" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/bb7b8fa4-a8a5-420e-b0a7-ce094564feb0"
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/crawler-prod-es-6x/6e3338061ac5c780"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/crawler-prod-es-6x/712e6df24692bb95"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_f03c0651_default_prod1ingr_7563_ff0bb38c663e7d18_61ab7e05b77e503d" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/380f9698-36fe-435e-9c70-7398073467e3"
  default_action {
    fixed_response {
      content_type = "text/plain"
      status_code  = "404"
    }

    order = 1
    type  = "fixed-response"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/f03c0651-default-prod1ingr-7563/ff0bb38c663e7d18"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_k8s_default_dev2ingr_7be0a1ceb0_89894bc1f0fe2c35_66b817c54c3a4e2a" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "443"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "443"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/380f9698-36fe-435e-9c70-7398073467e3"
  default_action {
    fixed_response {
      content_type = "text/plain"
      status_code  = "404"
    }

    order = 1
    type  = "fixed-response"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/k8s-default-dev2ingr-7be0a1ceb0/89894bc1f0fe2c35"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_k8s_default_prod3ing_75a5f4c190_650a139e70c846e1_86eb78266f2cdf77" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "443"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "443"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/380f9698-36fe-435e-9c70-7398073467e3"
  default_action {
    fixed_response {
      content_type = "text/plain"
      status_code  = "404"
    }

    order = 1
    type  = "fixed-response"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/k8s-default-prod3ing-75a5f4c190/650a139e70c846e1"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_k8s_istiosys_istioing_527dc2303c_ac7b79eb7e63bd31_41cd38193de911e4" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-ml-ops"
    "ingress.k8s.aws/resource" = "443"
    "ingress.k8s.aws/stack"    = "istio-system/istio-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-ml-ops"
    "ingress.k8s.aws/resource" = "443"
    "ingress.k8s.aws/stack"    = "istio-system/istio-ingress"
  }

  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/b69aa87d-3867-42ea-8b2b-53b523d05315"
  default_action {
    fixed_response {
      content_type = "text/plain"
      status_code  = "404"
    }

    order = 1
    type  = "fixed-response"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/k8s-istiosys-istioing-527dc2303c/ac7b79eb7e63bd31"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_luminati_proxy_manager_elb_d390b92366998397_4d7c696e60f92a0f" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/bb7b8fa4-a8a5-420e-b0a7-ce094564feb0"
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/luminati-proxy-manager-elb-app/81b178592c641668"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/luminati-proxy-manager-elb/d390b92366998397"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_luminati_proxy_manager_elb_d390b92366998397_603244543d9df0a2" {
  default_action {
    order = 1
    redirect {
      host        = "#{host}"
      path        = "/#{path}"
      port        = "24001"
      protocol    = "HTTPS"
      query       = "#{query}"
      status_code = "HTTP_301"
    }

    type = "redirect"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/luminati-proxy-manager-elb/d390b92366998397"
  port              = 24001
  protocol          = "HTTP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_luminati_proxy_manager_elb_d390b92366998397_982cf1fc0e79f9fc" {
  default_action {
    order = 1
    redirect {
      host        = "#{host}"
      path        = "/#{path}"
      port        = "24002"
      protocol    = "HTTPS"
      query       = "#{query}"
      status_code = "HTTP_302"
    }

    type = "redirect"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/luminati-proxy-manager-elb/d390b92366998397"
  port              = 24002
  protocol          = "HTTP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_luminati_proxy_manager_elb_d390b92366998397_ed17d73e348c43df" {
  default_action {
    order = 1
    redirect {
      host        = "#{host}"
      path        = "/#{path}"
      port        = "443"
      protocol    = "HTTPS"
      query       = "#{query}"
      status_code = "HTTP_301"
    }

    type = "redirect"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/luminati-proxy-manager-elb/d390b92366998397"
  port              = 80
  protocol          = "HTTP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_monitoring_es_5x_5a52e7ef4851c4c9_746009886b14d8c2" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/bb7b8fa4-a8a5-420e-b0a7-ce094564feb0"
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/monitoring-es-5x/11fd9b64dc4b90a9"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/monitoring-es-5x/5a52e7ef4851c4c9"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_nlp_services_2_aca9adc3123f9c84_1deba07967c3b2b8" {
  default_action {
    order            = 1
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/nlp-services-2-production/5c8b974aad1d7291"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/nlp-services-2/aca9adc3123f9c84"
  port              = 80
  protocol          = "HTTP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_nlp_services_2_aca9adc3123f9c84_760dfc3a043825ad" {
  default_action {
    order            = 1
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/nlp-services-2-staging/0e3d83fd9196a709"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/nlp-services-2/aca9adc3123f9c84"
  port              = 5000
  protocol          = "HTTP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_pixel_alb_af955ca7e396cd5c_6c442ad738de108b" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/bb7b8fa4-a8a5-420e-b0a7-ce094564feb0"
  default_action {
    order            = 1
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/pixel-east-1/5b05c9aa345129bd"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/pixel-alb/af955ca7e396cd5c"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_pixel_alb_af955ca7e396cd5c_ab12ef5b45a4b216" {
  default_action {
    order            = 1
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/pixel-east-1/5b05c9aa345129bd"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/pixel-alb/af955ca7e396cd5c"
  port              = 80
  protocol          = "HTTP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_prod_crawler_master_a826f6d7b758bcb1_1f02442582574344" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/245d3365-4680-4639-bc98-376dc88abfc7"
  default_action {
    order            = 1
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/prod-crawler-master/f327df089948cb3a"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/prod-crawler-master/a826f6d7b758bcb1"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_splash_internal_84c86d80f6b76cf3_ee0c0246f0f413ae" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/245d3365-4680-4639-bc98-376dc88abfc7"
  default_action {
    order            = 1
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/splash-internal-splash/3b2c1d97e784d88a"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/splash-internal/84c86d80f6b76cf3"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_staging_es_5x_48401b361793827e_24422a96f9ffb833" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/bb7b8fa4-a8a5-420e-b0a7-ce094564feb0"
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/staging-es-5x/76a5423de128fa00"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/staging-es-5x/48401b361793827e"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_staging_es_5x_48401b361793827e_688e65a95b4b1cf8" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/245d3365-4680-4639-bc98-376dc88abfc7"
  default_action {
    order            = 1
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/staging-es-5x/76a5423de128fa00"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/staging-es-5x/48401b361793827e"
  port              = 9200
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_twitter_search_dev_47a97607e59a1bd4_e9020974431bb1b8" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/bb7b8fa4-a8a5-420e-b0a7-ce094564feb0"
  default_action {
    order            = 1
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/twitter-search-dev-tg/adaff190b8ccc1ce"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/twitter-search-dev/47a97607e59a1bd4"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_app_twitter_search_f8e973a8125006d8_449c176d6377805c" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/bb7b8fa4-a8a5-420e-b0a7-ce094564feb0"
  default_action {
    order            = 1
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/twitter-search-tg/b4bfc8eea1da6080"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/app/twitter-search/f8e973a8125006d8"
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_net_ad9177437a8aa4954aabe013705ffd8d_d4c8ae7671f7ba6f_64ee6f06742480ef" {
  certificate_arn = "arn:aws:acm:us-east-1:484375727565:certificate/380f9698-36fe-435e-9c70-7398073467e3"
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/k8s-prod-ingressg-1311dce736/ed0e0f45875a8ec2"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/net/ad9177437a8aa4954aabe013705ffd8d/d4c8ae7671f7ba6f"
  port              = 443
  protocol          = "TLS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_net_eks_data_prod_external_9a1b7bb4459ec04a_79f9ba6b5e4ab3ad" {
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/eks-data-prod-external/ae77efafde975ad1"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/net/eks-data-prod-external/9a1b7bb4459ec04a"
  port              = 80
  protocol          = "TCP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_net_eks_data_prod_external_9a1b7bb4459ec04a_a3861dd0f18d2577" {
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/eks-data-prod-external-ssl/5057b81a56be1b8c"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/net/eks-data-prod-external/9a1b7bb4459ec04a"
  port              = 443
  protocol          = "TCP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_net_k8s_ingressn_nginxing_e912559390_f6fe4796770dd9a0_6d6184246448de48" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "onclusive-production"
    "service.k8s.aws/resource" = "443"
    "service.k8s.aws/stack"    = "ingress-nginx/nginx-ingress-ingress-nginx-controller"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "onclusive-production"
    "service.k8s.aws/resource" = "443"
    "service.k8s.aws/stack"    = "ingress-nginx/nginx-ingress-ingress-nginx-controller"
  }

  default_action {
    order            = 1
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/k8s-ingressn-nginxing-d437bd584c/106d40c5a1306f62"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/net/k8s-ingressn-nginxing-e912559390/f6fe4796770dd9a0"
  port              = 443
  protocol          = "TCP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_net_k8s_ingressn_nginxing_e912559390_f6fe4796770dd9a0_8dcce19a485b325d" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "onclusive-production"
    "service.k8s.aws/resource" = "80"
    "service.k8s.aws/stack"    = "ingress-nginx/nginx-ingress-ingress-nginx-controller"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "onclusive-production"
    "service.k8s.aws/resource" = "80"
    "service.k8s.aws/stack"    = "ingress-nginx/nginx-ingress-ingress-nginx-controller"
  }

  default_action {
    order            = 1
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/k8s-ingressn-nginxing-84e7cb73fe/201f0ea654165b19"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/net/k8s-ingressn-nginxing-e912559390/f6fe4796770dd9a0"
  port              = 80
  protocol          = "TCP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_net_luminati_proxy_staging_elb_1d2362322db2ae72_15edd22c5239c235" {
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/luminati-proxy-staging-elb/9fe2fc50262724ce"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/net/luminati-proxy-staging-elb/1d2362322db2ae72"
  port              = 22999
  protocol          = "TCP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_net_luminati_proxy_staging_elb_1d2362322db2ae72_2e82683e3aeb6e0c" {
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/luminati-proxy-staging-elb/9fe2fc50262724ce"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/net/luminati-proxy-staging-elb/1d2362322db2ae72"
  port              = 24002
  protocol          = "TCP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_net_luminati_proxy_staging_elb_1d2362322db2ae72_2f23c6d3f3d17aa0" {
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/luminati-proxy-staging-elb/9fe2fc50262724ce"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/net/luminati-proxy-staging-elb/1d2362322db2ae72"
  port              = 24008
  protocol          = "TCP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_net_luminati_proxy_staging_elb_1d2362322db2ae72_307990be80e8c2c2" {
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/luminati-proxy-staging-elb/9fe2fc50262724ce"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/net/luminati-proxy-staging-elb/1d2362322db2ae72"
  port              = 24004
  protocol          = "TCP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_net_luminati_proxy_staging_elb_1d2362322db2ae72_407b5aff579dd5e5" {
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/luminati-proxy-staging-elb/9fe2fc50262724ce"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/net/luminati-proxy-staging-elb/1d2362322db2ae72"
  port              = 24009
  protocol          = "TCP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_net_luminati_proxy_staging_elb_1d2362322db2ae72_44f2d0f32f291b20" {
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/luminati-proxy-staging-elb/9fe2fc50262724ce"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/net/luminati-proxy-staging-elb/1d2362322db2ae72"
  port              = 24010
  protocol          = "TCP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_net_luminati_proxy_staging_elb_1d2362322db2ae72_642a6700b2055fa2" {
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/luminati-proxy-staging-elb/9fe2fc50262724ce"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/net/luminati-proxy-staging-elb/1d2362322db2ae72"
  port              = 24007
  protocol          = "TCP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_net_luminati_proxy_staging_elb_1d2362322db2ae72_65f528cf35896313" {
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/luminati-proxy-staging-elb/9fe2fc50262724ce"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/net/luminati-proxy-staging-elb/1d2362322db2ae72"
  port              = 24003
  protocol          = "TCP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_net_luminati_proxy_staging_elb_1d2362322db2ae72_67e834b8028b3cc6" {
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/luminati-proxy-staging-elb/9fe2fc50262724ce"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/net/luminati-proxy-staging-elb/1d2362322db2ae72"
  port              = 24000
  protocol          = "TCP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_net_luminati_proxy_staging_elb_1d2362322db2ae72_923d91e3025b9336" {
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/luminati-proxy-staging-elb/9fe2fc50262724ce"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/net/luminati-proxy-staging-elb/1d2362322db2ae72"
  port              = 24005
  protocol          = "TCP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_net_luminati_proxy_staging_elb_1d2362322db2ae72_94508fd359608385" {
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/luminati-proxy-staging-elb/9fe2fc50262724ce"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/net/luminati-proxy-staging-elb/1d2362322db2ae72"
  port              = 24001
  protocol          = "TCP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_net_luminati_proxy_staging_elb_1d2362322db2ae72_a5f3957ed7c4e0a2" {
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/luminati-proxy-staging-elb/9fe2fc50262724ce"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/net/luminati-proxy-staging-elb/1d2362322db2ae72"
  port              = 24006
  protocol          = "TCP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_net_r_server_1c99945fe8b0ce33_aceb0f4c7df5bdf9" {
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/r-server/f4231eb1864102ba"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/net/r-server/1c99945fe8b0ce33"
  port              = 6311
  protocol          = "TCP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_net_selenium_hub_elb_7308aef84138b0d6_2631028f61b5086b" {
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/selenium-hub-elb/d5e43dfda467950c"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/net/selenium-hub-elb/7308aef84138b0d6"
  port              = 4443
  protocol          = "TCP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_net_selenium_hub_elb_7308aef84138b0d6_295c8dc96de2032e" {
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/selenium-hub-elb/d5e43dfda467950c"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/net/selenium-hub-elb/7308aef84138b0d6"
  port              = 80
  protocol          = "TCP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_net_selenium_hub_elb_7308aef84138b0d6_85c301da245c5e49" {
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/selenium-hub-elb/d5e43dfda467950c"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/net/selenium-hub-elb/7308aef84138b0d6"
  port              = 4444
  protocol          = "TCP"
}

resource "aws_alb_listener" "arn_aws_elasticloadbalancing_us_east_1_484375727565_listener_net_selenium_hub_elb_7308aef84138b0d6_89e775c86ef9e7a2" {
  default_action {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:targetgroup/selenium-hub-elb/d5e43dfda467950c"
    type             = "forward"
  }

  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:484375727565:loadbalancer/net/selenium-hub-elb/7308aef84138b0d6"
  port              = 4442
  protocol          = "TCP"
}

