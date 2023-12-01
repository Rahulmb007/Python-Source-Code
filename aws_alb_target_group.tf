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

resource "aws_alb_target_group" "LXoZC" {
  tags = {
    Billing        = "data"
    Billing-Detail = "bert_nlp_backfill"
    Description    = "Target Group for Bert NLP"
    ManagedBy      = "Terraform"
    Name           = "bert_inference_tg"
  }

  tags_all = {
    Billing        = "data"
    Billing-Detail = "bert_nlp_backfill"
    Description    = "Target Group for Bert NLP"
    ManagedBy      = "Terraform"
    Name           = "bert_inference_tg"
  }

  deregistration_delay = "30"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 10
    matcher             = "200"
    path                = "/health_check"
    port                = "80"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 3
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "bert-inference-tg-backfill"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "XjQJc" {
  tags = {
    Billing        = "data"
    Billing-Detail = "bert_nlp"
    Description    = "Target Group for Bert NLP"
    ManagedBy      = "Terraform"
    Name           = "bert_inference_tg"
  }

  tags_all = {
    Billing        = "data"
    Billing-Detail = "bert_nlp"
    Description    = "Target Group for Bert NLP"
    ManagedBy      = "Terraform"
    Name           = "bert_inference_tg"
  }

  deregistration_delay = "30"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 10
    matcher             = "200"
    path                = "/health_check"
    port                = "80"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 3
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "bert-inference-tg-v1-gpu-2"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "airpr_extractor_light4j" {
  tags = {
    Billing     = "Extractor"
    Name        = "airpr-extractor-light4j"
    ServiceName = "airpr-extractor-light4j"
  }

  tags_all = {
    Billing     = "Extractor"
    Name        = "airpr-extractor-light4j"
    ServiceName = "airpr-extractor-light4j"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    matcher             = "401"
    path                = "/api/ping"
    port                = "80"
    protocol            = "HTTP"
    timeout             = 25
    unhealthy_threshold = 10
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "airpr-extractor-light4j"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "airpr_extractor_light4j_external" {
  tags = {
    Billing     = "Extractor"
    Name        = "airpr-extractor-light4j-external"
    ServiceName = "airpr-extractor-light4j-external"
  }

  tags_all = {
    Billing     = "Extractor"
    Name        = "airpr-extractor-light4j-external"
    ServiceName = "airpr-extractor-light4j-external"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    matcher             = "401"
    path                = "/api/ping"
    port                = "80"
    protocol            = "HTTP"
    timeout             = 25
    unhealthy_threshold = 10
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "airpr-extractor-light4j-external"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "airpr_extractor_light4j_internal" {
  tags = {
    Billing     = "Extractor"
    Name        = "airpr-extractor-light4j-internal"
    ServiceName = "airpr-extractor-light4j-internal"
  }

  tags_all = {
    Billing     = "Extractor"
    Name        = "airpr-extractor-light4j-internal"
    ServiceName = "airpr-extractor-light4j-internal"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    matcher             = "401"
    path                = "/api/ping"
    port                = "80"
    protocol            = "HTTP"
    timeout             = 25
    unhealthy_threshold = 10
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "airpr-extractor-light4j-internal"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_1e32677d_005bf6d6b895b81d121_a3916b939d6e5c8d" {
  tags = {
    "elbv2.k8s.aws/cluster"                 = "eks-data-prod-3"
    "ingress.k8s.aws/cluster"               = "eks-data-prod-3"
    "ingress.k8s.aws/resource"              = "default/prod-3-ingress-ner-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-3-ingress"
    "kubernetes.io/cluster/eks-data-prod-3" = "owned"
    "kubernetes.io/ingress-name"            = "prod-3-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "ner-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"                 = "eks-data-prod-3"
    "ingress.k8s.aws/cluster"               = "eks-data-prod-3"
    "ingress.k8s.aws/resource"              = "default/prod-3-ingress-ner-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-3-ingress"
    "kubernetes.io/cluster/eks-data-prod-3" = "owned"
    "kubernetes.io/ingress-name"            = "prod-3-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "ner-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "1e32677d-005bf6d6b895b81d121"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_1e32677d_0ed5dce3a02873c5ebf_de9a9125cb5f991a" {
  tags = {
    "elbv2.k8s.aws/cluster"                 = "eks-data-prod-3"
    "ingress.k8s.aws/cluster"               = "eks-data-prod-3"
    "ingress.k8s.aws/resource"              = "default/prod-3-ingress-trie-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-3-ingress"
    "kubernetes.io/cluster/eks-data-prod-3" = "owned"
    "kubernetes.io/ingress-name"            = "prod-3-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "trie-alb"
    "kubernetes.io/service-port"            = "80"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"                 = "eks-data-prod-3"
    "ingress.k8s.aws/cluster"               = "eks-data-prod-3"
    "ingress.k8s.aws/resource"              = "default/prod-3-ingress-trie-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-3-ingress"
    "kubernetes.io/cluster/eks-data-prod-3" = "owned"
    "kubernetes.io/ingress-name"            = "prod-3-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "trie-alb"
    "kubernetes.io/service-port"            = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "1e32677d-0ed5dce3a02873c5ebf"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_1e32677d_473d5ab1a93408a75f2_a107ee8a5126a0f2" {
  tags = {
    "elbv2.k8s.aws/cluster"                 = "eks-data-prod-3"
    "ingress.k8s.aws/cluster"               = "eks-data-prod-3"
    "ingress.k8s.aws/resource"              = "default/prod-3-ingress-lsh-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-3-ingress"
    "kubernetes.io/cluster/eks-data-prod-3" = "owned"
    "kubernetes.io/ingress-name"            = "prod-3-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "lsh-alb"
    "kubernetes.io/service-port"            = "80"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"                 = "eks-data-prod-3"
    "ingress.k8s.aws/cluster"               = "eks-data-prod-3"
    "ingress.k8s.aws/resource"              = "default/prod-3-ingress-lsh-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-3-ingress"
    "kubernetes.io/cluster/eks-data-prod-3" = "owned"
    "kubernetes.io/ingress-name"            = "prod-3-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "lsh-alb"
    "kubernetes.io/service-port"            = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "1e32677d-473d5ab1a93408a75f2"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_1e32677d_4bd018b06f38add2368_bbe90c7441c649fb" {
  tags = {
    "elbv2.k8s.aws/cluster"                 = "eks-data-prod-3"
    "ingress.k8s.aws/cluster"               = "eks-data-prod-3"
    "ingress.k8s.aws/resource"              = "default/prod-3-ingress-ner2-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-3-ingress"
    "kubernetes.io/cluster/eks-data-prod-3" = "owned"
    "kubernetes.io/ingress-name"            = "prod-3-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "ner2-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"                 = "eks-data-prod-3"
    "ingress.k8s.aws/cluster"               = "eks-data-prod-3"
    "ingress.k8s.aws/resource"              = "default/prod-3-ingress-ner2-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-3-ingress"
    "kubernetes.io/cluster/eks-data-prod-3" = "owned"
    "kubernetes.io/ingress-name"            = "prod-3-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "ner2-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "1e32677d-4bd018b06f38add2368"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_1e32677d_a3fb53f6b2308086847_a5fefa851a0b5092" {
  tags = {
    "elbv2.k8s.aws/cluster"                 = "eks-data-prod-3"
    "ingress.k8s.aws/cluster"               = "eks-data-prod-3"
    "ingress.k8s.aws/resource"              = "default/prod-3-ingress-sent-tokenize-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-3-ingress"
    "kubernetes.io/cluster/eks-data-prod-3" = "owned"
    "kubernetes.io/ingress-name"            = "prod-3-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "sent-tokenize-alb"
    "kubernetes.io/service-port"            = "80"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"                 = "eks-data-prod-3"
    "ingress.k8s.aws/cluster"               = "eks-data-prod-3"
    "ingress.k8s.aws/resource"              = "default/prod-3-ingress-sent-tokenize-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-3-ingress"
    "kubernetes.io/cluster/eks-data-prod-3" = "owned"
    "kubernetes.io/ingress-name"            = "prod-3-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "sent-tokenize-alb"
    "kubernetes.io/service-port"            = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "1e32677d-a3fb53f6b2308086847"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_1e32677d_ae365eaa600dd532b25_f93f5029132924be" {
  tags = {
    "elbv2.k8s.aws/cluster"                 = "eks-data-prod-3"
    "ingress.k8s.aws/cluster"               = "eks-data-prod-3"
    "ingress.k8s.aws/resource"              = "default/prod-3-ingress-sent-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-3-ingress"
    "kubernetes.io/cluster/eks-data-prod-3" = "owned"
    "kubernetes.io/ingress-name"            = "prod-3-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "sent-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"                 = "eks-data-prod-3"
    "ingress.k8s.aws/cluster"               = "eks-data-prod-3"
    "ingress.k8s.aws/resource"              = "default/prod-3-ingress-sent-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-3-ingress"
    "kubernetes.io/cluster/eks-data-prod-3" = "owned"
    "kubernetes.io/ingress-name"            = "prod-3-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "sent-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "1e32677d-ae365eaa600dd532b25"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_1e32677d_dbac5f0cb2a0a1d88ae_feeab4933b48ee75" {
  tags = {
    "elbv2.k8s.aws/cluster"                 = "eks-data-prod-3"
    "ingress.k8s.aws/cluster"               = "eks-data-prod-3"
    "ingress.k8s.aws/resource"              = "default/prod-3-ingress-genre-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-3-ingress"
    "kubernetes.io/cluster/eks-data-prod-3" = "owned"
    "kubernetes.io/ingress-name"            = "prod-3-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "genre-alb"
    "kubernetes.io/service-port"            = "80"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"                 = "eks-data-prod-3"
    "ingress.k8s.aws/cluster"               = "eks-data-prod-3"
    "ingress.k8s.aws/resource"              = "default/prod-3-ingress-genre-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-3-ingress"
    "kubernetes.io/cluster/eks-data-prod-3" = "owned"
    "kubernetes.io/ingress-name"            = "prod-3-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "genre-alb"
    "kubernetes.io/service-port"            = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "1e32677d-dbac5f0cb2a0a1d88ae"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_ac126a33_3153585015027dbaf70_af00bbd076e3fb91" {
  tags = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "argocd/dev3-argocd-ingress-argogrpc:443"
    "ingress.k8s.aws/stack"                = "argocd/dev3-argocd-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev3-argocd-ingress"
    "kubernetes.io/namespace"              = "argocd"
    "kubernetes.io/service-name"           = "argogrpc"
    "kubernetes.io/service-port"           = "443"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "argocd/dev3-argocd-ingress-argogrpc:443"
    "ingress.k8s.aws/stack"                = "argocd/dev3-argocd-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev3-argocd-ingress"
    "kubernetes.io/namespace"              = "argocd"
    "kubernetes.io/service-name"           = "argogrpc"
    "kubernetes.io/service-port"           = "443"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "ac126a33-3153585015027dbaf70"
  port                          = 1
  protocol                      = "HTTPS"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_ac126a33_3a60693406e68564c7d_1ecd431fb6d27d3c" {
  tags = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-sent-inf-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "sent-inf-alb"
    "kubernetes.io/service-port"           = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-sent-inf-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "sent-inf-alb"
    "kubernetes.io/service-port"           = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "ac126a33-3a60693406e68564c7d"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_ac126a33_52df734bd4b94905075_21f0183a7d3181c8" {
  tags = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-lsh-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "lsh-alb"
    "kubernetes.io/service-port"           = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-lsh-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "lsh-alb"
    "kubernetes.io/service-port"           = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "ac126a33-52df734bd4b94905075"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_ac126a33_58f5bf1ff04dd9bcbb6_73571f22c8be18fe" {
  tags = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-gpt3-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "gpt3-alb"
    "kubernetes.io/service-port"           = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-gpt3-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "gpt3-alb"
    "kubernetes.io/service-port"           = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "ac126a33-58f5bf1ff04dd9bcbb6"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_ac126a33_5b786a1b985ee4210bc_83f8880fbc9b89f1" {
  tags = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-textsum-inf-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "textsum-inf-alb"
    "kubernetes.io/service-port"           = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-textsum-inf-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "textsum-inf-alb"
    "kubernetes.io/service-port"           = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "ac126a33-5b786a1b985ee4210bc"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_ac126a33_6af0e78cc3af9f93cc0_fc390c4761ee13fd" {
  tags = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-keybert-inf-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "keybert-inf-alb"
    "kubernetes.io/service-port"           = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-keybert-inf-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "keybert-inf-alb"
    "kubernetes.io/service-port"           = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "ac126a33-6af0e78cc3af9f93cc0"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_ac126a33_70deab3b94a8d8f6f8c_915c6e1b4f8a2b15" {
  tags = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-minhash-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "minhash-alb"
    "kubernetes.io/service-port"           = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-minhash-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "minhash-alb"
    "kubernetes.io/service-port"           = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "ac126a33-70deab3b94a8d8f6f8c"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_ac126a33_760c27d54e37e5cf529_6de40ab1f73e0cf2" {
  tags = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-ner-inf-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "ner-inf-alb"
    "kubernetes.io/service-port"           = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-ner-inf-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "ner-inf-alb"
    "kubernetes.io/service-port"           = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "ac126a33-760c27d54e37e5cf529"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_ac126a33_77f45a98a19cb423e08_a841d006f96e7dd4" {
  tags = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-sent-vodafone-inf-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "sent-vodafone-inf-alb"
    "kubernetes.io/service-port"           = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-sent-vodafone-inf-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "sent-vodafone-inf-alb"
    "kubernetes.io/service-port"           = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "ac126a33-77f45a98a19cb423e08"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_ac126a33_7d210e81518a0c7612c_d9af33cc9dd7cf31" {
  tags = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-entity-fish-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "entity-fish-alb"
    "kubernetes.io/service-port"           = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-entity-fish-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "entity-fish-alb"
    "kubernetes.io/service-port"           = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "ac126a33-7d210e81518a0c7612c"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_ac126a33_9222513f2ba34aa4005_c957d1e8fd903b90" {
  tags = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-sent-tokenize-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "sent-tokenize-alb"
    "kubernetes.io/service-port"           = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-sent-tokenize-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "sent-tokenize-alb"
    "kubernetes.io/service-port"           = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "ac126a33-9222513f2ba34aa4005"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_ac126a33_99bd928c3ae755f4d43_afdfdfb572427386" {
  tags = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-iptc-inf-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "iptc-inf-alb"
    "kubernetes.io/service-port"           = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-iptc-inf-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "iptc-inf-alb"
    "kubernetes.io/service-port"           = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "ac126a33-99bd928c3ae755f4d43"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_ac126a33_9ebc10267eec317fd66_529f4d02c5a8ba88" {
  tags = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "istio-system/dev3-istio-ingress-istio-ingressgateway:80"
    "ingress.k8s.aws/stack"                = "istio-system/dev3-istio-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev3-istio-ingress"
    "kubernetes.io/namespace"              = "istio-system"
    "kubernetes.io/service-name"           = "istio-ingressgateway"
    "kubernetes.io/service-port"           = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "istio-system/dev3-istio-ingress-istio-ingressgateway:80"
    "ingress.k8s.aws/stack"                = "istio-system/dev3-istio-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev3-istio-ingress"
    "kubernetes.io/namespace"              = "istio-system"
    "kubernetes.io/service-name"           = "istio-ingressgateway"
    "kubernetes.io/service-port"           = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "ac126a33-9ebc10267eec317fd66"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_ac126a33_aa745e01d443555cd3d_50ea2cf665c82cf9" {
  tags = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-sent2-inf-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "sent2-inf-alb"
    "kubernetes.io/service-port"           = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-sent2-inf-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "sent2-inf-alb"
    "kubernetes.io/service-port"           = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "ac126a33-aa745e01d443555cd3d"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_ac126a33_af2e78d73a8f911b6ad_60f54598323bfef5" {
  tags = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-entity-fish-docker-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "entity-fish-docker-alb"
    "kubernetes.io/service-port"           = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-entity-fish-docker-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "entity-fish-docker-alb"
    "kubernetes.io/service-port"           = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "ac126a33-af2e78d73a8f911b6ad"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_ac126a33_b103e89b55ab3d6eeee_59ac1a823d63aaaa" {
  tags = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-trie-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "trie-alb"
    "kubernetes.io/service-port"           = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-trie-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "trie-alb"
    "kubernetes.io/service-port"           = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "ac126a33-b103e89b55ab3d6eeee"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_ac126a33_c1a1b2d53f06e592692_50bd802f40317a14" {
  tags = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-blink-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "blink-alb"
    "kubernetes.io/service-port"           = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-blink-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "blink-alb"
    "kubernetes.io/service-port"           = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "ac126a33-c1a1b2d53f06e592692"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_ac126a33_c9c8b7743a052e0f9d4_25b4bec833795af2" {
  tags = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-dga-inf-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "dga-inf-alb"
    "kubernetes.io/service-port"           = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-dga-inf-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "dga-inf-alb"
    "kubernetes.io/service-port"           = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "ac126a33-c9c8b7743a052e0f9d4"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_ac126a33_d3f59ba7db17aaa8a0b_dc776dfe3d2a0547" {
  tags = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-ner2-inf-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "ner2-inf-alb"
    "kubernetes.io/service-port"           = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-ner2-inf-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "ner2-inf-alb"
    "kubernetes.io/service-port"           = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "ac126a33-d3f59ba7db17aaa8a0b"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_ac126a33_d4f20c41647dbda58ab_0a364e7dc0fb95ba" {
  tags = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "argocd/dev3-argocd-ingress-argocd-server:443"
    "ingress.k8s.aws/stack"                = "argocd/dev3-argocd-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev3-argocd-ingress"
    "kubernetes.io/namespace"              = "argocd"
    "kubernetes.io/service-name"           = "argocd-server"
    "kubernetes.io/service-port"           = "443"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "argocd/dev3-argocd-ingress-argocd-server:443"
    "ingress.k8s.aws/stack"                = "argocd/dev3-argocd-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev3-argocd-ingress"
    "kubernetes.io/namespace"              = "argocd"
    "kubernetes.io/service-name"           = "argocd-server"
    "kubernetes.io/service-port"           = "443"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "ac126a33-d4f20c41647dbda58ab"
  port                          = 1
  protocol                      = "HTTPS"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_ac126a33_e094d528a6c47e3d6b4_c51994e018aaf266" {
  tags = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-genre-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "genre-alb"
    "kubernetes.io/service-port"           = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-genre-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "genre-alb"
    "kubernetes.io/service-port"           = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "ac126a33-e094d528a6c47e3d6b4"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_ac126a33_fd314a1add5035c66a9_7e5999d300a60ecb" {
  tags = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-coref-resolution-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "coref-resolution-alb"
    "kubernetes.io/service-port"           = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "default/dev-3-ingress-coref-resolution-alb:80"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
    "kubernetes.io/service-name"           = "coref-resolution-alb"
    "kubernetes.io/service-port"           = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "ac126a33-fd314a1add5035c66a9"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_airpr_extractor_light4j_int_r_28d8026f12bc09ec" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 5
    interval            = 30
    matcher             = "401"
    path                = "/api/ping"
    port                = "80"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "airpr-extractor-light4j-int-r"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_airpr_extractor_light4j_sl_22cdf61ea41150f6" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 5
    interval            = 30
    matcher             = "401"
    path                = "/api/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "airpr-extractor-light4j-sl"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_airpr_visitor_estimation_in_ab1fc3ba21164b50" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "airpr-visitor-estimation-in"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_analyst_es_5x_86ddec83520445eb" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 20
    matcher             = "200"
    path                = "/"
    port                = "9200"
    protocol            = "HTTP"
    timeout             = 10
    unhealthy_threshold = 3
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "analyst-es-5x"
  port                          = 9200
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_analytics_es_5x_30d8eda4d7d7eeda" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "9200"
    protocol            = "HTTP"
    timeout             = 10
    unhealthy_threshold = 3
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "analytics-es-5x"
  port                          = 9200
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_analytics_es_6x_19bf24db8bb506fc" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 20
    matcher             = "200"
    path                = "/"
    port                = "9200"
    protocol            = "HTTP"
    timeout             = 10
    unhealthy_threshold = 3
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "analytics-es-6x"
  port                          = 9200
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_awseb_e_t_awsebloa_1nbqqiydfq9fu_6168e72d139f6660" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 10
    matcher             = "200"
    path                = "/"
    port                = "80"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 5
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "awseb-e-t-AWSEBLoa-1NBQQIYDFQ9FU"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_cerebro_44003fc029dc2925" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 30
    matcher             = "200"
    path                = "/login"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 3
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "cerebro"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-a2450ec7"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_crawler_es_5x_client_apps_tg_4c347dc6984837be" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 5
    interval            = 60
    matcher             = "200"
    path                = "/broadcast/_search"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 59
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "crawler-es-5x-client-apps-tg"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_crawler_es_5x_client_b8f5bd0f878cdd9e" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 6
    interval            = 60
    matcher             = "200"
    path                = "/broadcast/_search"
    port                = "9200"
    protocol            = "HTTP"
    timeout             = 59
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "crawler-es-5x-client"
  port                          = 9200
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_crawler_es_5x_client_external_7ec87b03b81a9780" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 4
    interval            = 60
    matcher             = "200"
    path                = "/broadcast/_search"
    port                = "9200"
    protocol            = "HTTP"
    timeout             = 59
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "crawler-es-5x-client-external"
  port                          = 9200
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_crawler_es_5x_e38e4860a7fdfac3" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 60
    matcher             = "200"
    path                = "/crawler-recent/_search"
    port                = "9200"
    protocol            = "HTTP"
    timeout             = 59
    unhealthy_threshold = 3
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "crawler-es-5x"
  port                          = 9200
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_crawler_es_5x_prod_tg_a7eb1c0fafaa8f36" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 5
    interval            = 60
    matcher             = "200"
    path                = "/broadcast/_search"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 59
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "crawler-es-5x-prod-tg"
  port                          = 9200
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_crawler_es_6x_e199539b3fef0122" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 60
    matcher             = "200"
    path                = "/"
    port                = "9200"
    protocol            = "HTTP"
    timeout             = 59
    unhealthy_threshold = 3
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "crawler-es-6x"
  port                          = 9200
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_crawler_es_client_3701de8785773646" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 60
    matcher             = "200"
    path                = "/"
    port                = "9200"
    protocol            = "HTTP"
    timeout             = 59
    unhealthy_threshold = 5
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "crawler-es-client"
  port                          = 9200
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-a2450ec7"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_crawler_es_master_health_check_c79135d15f5f056a" {
  tags = {
    Billing         = "Crawler"
    Billing-details = "Crawler-master-health"
  }

  tags_all = {
    Billing         = "Crawler"
    Billing-details = "Crawler-master-health"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 30
    matcher             = "200"
    path                = "/crawler-recent/_search"
    port                = "9200"
    protocol            = "HTTP"
    timeout             = 29
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "Crawler-es-master-health-check"
  port                          = 9200
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_crawler_percolates_5x_86fef6459504b7b1" {
  deregistration_delay = "30"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 20
    matcher             = "200"
    path                = "/"
    port                = "9200"
    protocol            = "HTTP"
    timeout             = 18
    unhealthy_threshold = 4
  }

  load_balancing_algorithm_type = "least_outstanding_requests"
  name                          = "crawler-percolates-5x"
  port                          = 9200
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_crawler_percolates_fe_5x_e286814ecab26c00" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 20
    matcher             = "200"
    path                = "/"
    port                = "9200"
    protocol            = "HTTP"
    timeout             = 10
    unhealthy_threshold = 3
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "crawler-percolates-fe-5x"
  port                          = 9200
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_crawler_prod_es_6x_6e3338061ac5c780" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 60
    matcher             = "200"
    path                = "/"
    port                = "9200"
    protocol            = "HTTP"
    timeout             = 59
    unhealthy_threshold = 3
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "crawler-prod-es-6x"
  port                          = 9200
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_ec73704e_376504958c1a5495477_642bd7c910cfe10c" {
  tags = {
    "ingress.k8s.aws/cluster"                    = "eks-data-prod-main-2"
    "ingress.k8s.aws/resource"                   = "dev/dev-ingress-sentiment-tensorflow-alb:8501"
    "ingress.k8s.aws/stack"                      = "dev/dev-ingress"
    "kubernetes.io/cluster/eks-data-prod-main-2" = "owned"
    "kubernetes.io/ingress-name"                 = "dev-ingress"
    "kubernetes.io/namespace"                    = "dev"
    "kubernetes.io/service-name"                 = "sentiment-tensorflow-alb"
    "kubernetes.io/service-port"                 = "8501"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"                    = "eks-data-prod-main-2"
    "ingress.k8s.aws/resource"                   = "dev/dev-ingress-sentiment-tensorflow-alb:8501"
    "ingress.k8s.aws/stack"                      = "dev/dev-ingress"
    "kubernetes.io/cluster/eks-data-prod-main-2" = "owned"
    "kubernetes.io/ingress-name"                 = "dev-ingress"
    "kubernetes.io/namespace"                    = "dev"
    "kubernetes.io/service-name"                 = "sentiment-tensorflow-alb"
    "kubernetes.io/service-port"                 = "8501"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/v1/models/bert_sentiment"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "ec73704e-376504958c1a5495477"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_eks_data_prod_external_ae77efafde975ad1" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 30
    matcher             = "200-399"
    path                = "/health_check"
    port                = "443"
    protocol            = "HTTPS"
    timeout             = 10
    unhealthy_threshold = 3
  }

  name               = "eks-data-prod-external"
  port               = 80
  preserve_client_ip = "true"
  protocol           = "TCP"
  stickiness {
    type = "source_ip"
  }

  target_type = "alb"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_eks_data_prod_external_ssl_5057b81a56be1b8c" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 30
    matcher             = "200-399"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTPS"
    timeout             = 10
    unhealthy_threshold = 3
  }

  name               = "eks-data-prod-external-ssl"
  port               = 443
  preserve_client_ip = "true"
  protocol           = "TCP"
  stickiness {
    type = "source_ip"
  }

  target_type = "alb"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_eks_data_prod_sentence_tokenize_3052e2108cf3dd47" {
  tags = {
    Billing        = "data"
    Billing-Detail = "eks_data_nlp"
  }

  tags_all = {
    Billing        = "data"
    Billing-Detail = "eks_data_nlp"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 5
    interval            = 30
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "eks-data-prod-sentence-tokenize"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-0aa7ca510d59df28c"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_elasticache_nudge_analyst_47e4068b8c6e7e98" {
  tags = {
    Billing = "Analyst"
  }

  tags_all = {
    Billing = "Analyst"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 30
    port                = "traffic-port"
    protocol            = "TCP"
    timeout             = 10
    unhealthy_threshold = 3
  }

  name               = "elasticache-nudge-analyst"
  port               = 6379
  preserve_client_ip = "false"
  protocol           = "TCP"
  stickiness {
    type = "source_ip"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_f03c0651_019f6f9d49a94f6d97a_8e87eaba4f13ee71" {
  tags = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-genre-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "genre-alb"
    "kubernetes.io/service-port"            = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-genre-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "genre-alb"
    "kubernetes.io/service-port"            = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "f03c0651-019f6f9d49a94f6d97a"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_f03c0651_326cb0b9908915988da_09908afda0258f99" {
  tags = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-sent2-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "sent2-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-sent2-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "sent2-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "f03c0651-326cb0b9908915988da"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_f03c0651_4816c1fdc113d8234ea_69140bb49ef0529e" {
  tags = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-gpt3-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "gpt3-alb"
    "kubernetes.io/service-port"            = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-gpt3-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "gpt3-alb"
    "kubernetes.io/service-port"            = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "f03c0651-4816c1fdc113d8234ea"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_f03c0651_4a9b77f4576a0df03d9_bd07750cb7e16e82" {
  tags = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-trie-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "trie-alb"
    "kubernetes.io/service-port"            = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-trie-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "trie-alb"
    "kubernetes.io/service-port"            = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "f03c0651-4a9b77f4576a0df03d9"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_f03c0651_4ce0c05e2cb65af99ee_32dc5f2788b94c6e" {
  tags = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-minhash-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "minhash-alb"
    "kubernetes.io/service-port"            = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-minhash-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "minhash-alb"
    "kubernetes.io/service-port"            = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "f03c0651-4ce0c05e2cb65af99ee"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_f03c0651_51ac38e9eb3aa647768_9a04ef24f880f9d9" {
  tags = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-coref-resolution-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "coref-resolution-alb"
    "kubernetes.io/service-port"            = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-coref-resolution-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "coref-resolution-alb"
    "kubernetes.io/service-port"            = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "f03c0651-51ac38e9eb3aa647768"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_f03c0651_572e8cc49f9671cf629_be50c1ac20226965" {
  tags = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-sent-vodafone-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "sent-vodafone-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-sent-vodafone-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "sent-vodafone-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "f03c0651-572e8cc49f9671cf629"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_f03c0651_5804f2b5f95ba6a738e_afb86de7d12fcb54" {
  tags = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-ner-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "ner-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-ner-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "ner-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "f03c0651-5804f2b5f95ba6a738e"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_f03c0651_5f7dbea93a94033d3b6_fe45594bc88f58e9" {
  tags = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-textsum-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "textsum-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-textsum-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "textsum-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "f03c0651-5f7dbea93a94033d3b6"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_f03c0651_7580f1b096760a1a4ac_b62dff4bceaa5a66" {
  tags = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-keybert-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "keybert-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-keybert-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "keybert-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "f03c0651-7580f1b096760a1a4ac"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_f03c0651_7fbc3972c004e33d4df_7dcc09b8b72da035" {
  tags = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-dga-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "dga-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-dga-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "dga-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "f03c0651-7fbc3972c004e33d4df"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_f03c0651_838934c8ff2ce3bdd54_7e1392dd859121c0" {
  tags = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-sent2-1-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "sent2-1-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-sent2-1-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "sent2-1-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "f03c0651-838934c8ff2ce3bdd54"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_f03c0651_84044b3e37007bb6499_48f68d6732b29207" {
  tags = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-iptc-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "iptc-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-iptc-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "iptc-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "f03c0651-84044b3e37007bb6499"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_f03c0651_95dff8f17c479485e91_a75141a3242ac617" {
  tags = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-sent-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "sent-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-sent-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "sent-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "f03c0651-95dff8f17c479485e91"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_f03c0651_b34a49fdac6ec5a6296_0675c180ad7139b7" {
  tags = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-ner2-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "ner2-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-ner2-inf-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "ner2-inf-alb"
    "kubernetes.io/service-port"            = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "f03c0651-b34a49fdac6ec5a6296"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_f03c0651_d1c94251b1ac58845f1_52c0bba7349ae076" {
  tags = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-blink-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "blink-alb"
    "kubernetes.io/service-port"            = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-blink-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "blink-alb"
    "kubernetes.io/service-port"            = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "f03c0651-d1c94251b1ac58845f1"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_f03c0651_ecced7fbd957e657f38_b3879a575f815390" {
  tags = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-lsh-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "lsh-alb"
    "kubernetes.io/service-port"            = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-lsh-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "lsh-alb"
    "kubernetes.io/service-port"            = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "f03c0651-ecced7fbd957e657f38"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_f03c0651_f27230579caed51b127_3cf2220c44064db6" {
  tags = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-sent-tokenize-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "sent-tokenize-alb"
    "kubernetes.io/service-port"            = "80"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "default/prod-1-ingress-sent-tokenize-alb:80"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
    "kubernetes.io/service-name"            = "sent-tokenize-alb"
    "kubernetes.io/service-port"            = "80"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "f03c0651-f27230579caed51b127"
  port                          = 1
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_blinkalb_12cfa07d75_135a581d135d6a09" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-blink-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-blink-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-blinkalb-12cfa07d75"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_blinkalb_dc5c3562f6_11d4039eb6b8c6e1" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-blink-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-blink-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-blinkalb-dc5c3562f6"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_corefres_6361943703_b2d1951584c8e5b1" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-coref-resolution-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-coref-resolution-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-corefres-6361943703"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_corefres_e7443c15ee_c94146faa53d301c" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-coref-resolution-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-coref-resolution-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-corefres-e7443c15ee"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_dgainfal_518b933de8_a956697885a156e8" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-dga-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-dga-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-dgainfal-518b933de8"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_dgainfal_ce246919bd_743d81873234f6e0" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-dga-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-dga-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-dgainfal-ce246919bd"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_entityfi_0fb739f322_b27b98d9572538a0" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-entity-fish-docker-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-entity-fish-docker-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-entityfi-0fb739f322"
  port                          = 8090
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_entityfi_38bedc7021_0a76fdd3b576e3b9" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-entity-fish-docker-alb:81"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-entity-fish-docker-alb:81"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-entityfi-38bedc7021"
  port                          = 8091
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_entityfi_8401f9940f_a9bc9bfd03d8c4d1" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-entity-fish-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-entity-fish-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-entityfi-8401f9940f"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_entityfi_c6970e2ab9_925fdba9dc4ab2e7" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-entity-fish-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-entity-fish-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-entityfi-c6970e2ab9"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_entityfi_c7935019be_5fa909e5ece491d0" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-entity-fish-docker-alb:81"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-entity-fish-docker-alb:81"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-entityfi-c7935019be"
  port                          = 8091
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_entityfi_f58af7d23e_e57b50ae6f43b40b" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-entity-fish-docker-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-entity-fish-docker-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-entityfi-f58af7d23e"
  port                          = 8090
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_genrealb_f4e78e2a9b_63924b3cdad96029" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-genre-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-genre-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-genrealb-f4e78e2a9b"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_gpt3alb_01f0d905a9_0fb10e0dd7cc17fb" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-gpt3-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-gpt3-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-gpt3alb-01f0d905a9"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_gpt3alb_c5b3b91a2b_cb860c58c6e686c4" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-gpt3-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-gpt3-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-gpt3alb-c5b3b91a2b"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_iptcinfa_14affd4029_bd67011cb35b3c7b" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-iptc-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-iptc-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-iptcinfa-14affd4029"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_iptcinfa_18bc168e56_029437ce9e1865b1" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-iptc-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-iptc-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-iptcinfa-18bc168e56"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_keyberti_1e50565144_76680de4c3389f05" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-keybert-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-keybert-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-keyberti-1e50565144"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_keyberti_b5177217da_fc55c8aaea4d1315" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-keybert-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-keybert-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-keyberti-b5177217da"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_lshalb_01ed4560f7_71ffb11f200da61c" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-lsh-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-lsh-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-lshalb-01ed4560f7"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_minhasha_8da94dcf87_679be626ec0dcdc0" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-minhash-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-minhash-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-minhasha-8da94dcf87"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_minhasha_b2fb241b15_50d535abbf363411" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-minhash-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-minhash-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-minhasha-b2fb241b15"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_ner2infa_3655c8dd97_50c59e26d44573a7" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-ner2-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-ner2-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-ner2infa-3655c8dd97"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_nerinfal_bb94b77401_ad98d56ea7360da5" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-ner-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-ner-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-nerinfal-bb94b77401"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_nsfwclas_227699d31b_66c583eaebf88637" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-nsfw-classifier-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-nsfw-classifier-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-nsfwclas-227699d31b"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_nsfwclas_44d1a8e590_9b4fbc979e39188e" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-nsfw-classifier-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-nsfw-classifier-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-nsfwclas-44d1a8e590"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_sent21in_436df70b8d_ee369a139bb75fb7" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-sent2-1-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-sent2-1-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-sent21in-436df70b8d"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_sent21in_be26090430_02f04d6c0178351e" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-sent2-1-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-sent2-1-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-sent21in-be26090430"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_sent2inf_5d9e044878_700506d061ee4ce0" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-sent2-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-sent2-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-sent2inf-5d9e044878"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_sent2inf_93a69b2cd1_051c5a10f822baed" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-sent2-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-sent2-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-sent2inf-93a69b2cd1"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_sentinfa_00b4b16ad1_0a3af7a87f2ce80a" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-sent-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-sent-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-sentinfa-00b4b16ad1"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_senttoke_8b04d24b9a_b8431ff6b35a7ea9" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-sent-tokenize-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-sent-tokenize-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-senttoke-8b04d24b9a"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_sentvoda_4045d4caa2_f6809093f09f3985" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-sent-vodafone-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-sent-vodafone-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-sentvoda-4045d4caa2"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_sentvoda_9cb30ac02f_bfdff61f05dfeef0" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-sent-vodafone-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-sent-vodafone-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-sentvoda-9cb30ac02f"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_textsumb_094bae5326_d2ea52d6f4530873" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-textsum-bart-es-inf2:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-textsum-bart-es-inf2:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-textsumb-094bae5326"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_textsumb_1bf43d2114_8bf22008fb6475ad" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-textsum-brio-inf2:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-textsum-brio-inf2:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-textsumb-1bf43d2114"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_textsumb_220e1b26d0_85336ce7c80aabb9" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-textsum-bart-it-fanpage-inf2:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-textsum-bart-it-fanpage-inf2:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-textsumb-220e1b26d0"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_textsumb_768daae2b0_dc1719d7cd9c9b98" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-textsum-bart-latest-inf2:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-textsum-bart-latest-inf2:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-textsumb-768daae2b0"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_textsumb_8f3c855bd9_2f75b8a0d5555678" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-textsum-bart-latest-inf2:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-textsum-bart-latest-inf2:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-textsumb-8f3c855bd9"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_textsumb_c043032bf1_af303d5a1c39dc44" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-textsum-bart-es-inf2:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-textsum-bart-es-inf2:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-textsumb-c043032bf1"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_textsumb_c516c243bb_d720b73c8378523d" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-textsum-bart-ca-inf2:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-textsum-bart-ca-inf2:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-textsumb-c516c243bb"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_textsumb_d7a3b0446c_91bb8a0ee970ffbd" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-textsum-brio-inf2:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-textsum-brio-inf2:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-textsumb-d7a3b0446c"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_textsumb_dfcf3170b6_7455d041347d51eb" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-textsum-bart-ca-inf2:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-textsum-bart-ca-inf2:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-textsumb-dfcf3170b6"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_textsumb_f36583a253_284a45616e7cf1af" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-textsum-bart-it-fanpage-inf2:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-textsum-bart-it-fanpage-inf2:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-textsumb-f36583a253"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_textsumc_2cc6424f98_01ee837787f21e08" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-textsum-client-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-textsum-client-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-textsumc-2cc6424f98"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_textsumc_b15a7a7719_d722e3ef0a0466e5" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-textsum-client-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-textsum-client-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-textsumc-b15a7a7719"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_textsumd_8716f1305c_e767bce370ab6bac" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-textsum-deltalm-inf2:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-textsum-deltalm-inf2:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-textsumd-8716f1305c"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_textsumd_8ec4abb725_98a414adeb302ef2" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-textsum-deltalm-inf2:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-textsum-deltalm-inf2:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-textsumd-8ec4abb725"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_textsumi_9cebbd3424_1d9aa70e2db4aa84" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-textsum-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-textsum-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-textsumi-9cebbd3424"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_textsumi_ee7fe2c25f_5fbbaaab12387a91" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-textsum-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-textsum-inf-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-textsumi-ee7fe2c25f"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_textsumm_1ce3dd9976_13a5566221dd06e2" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-textsum-mbart-inf2:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-textsum-mbart-inf2:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-textsumm-1ce3dd9976"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_textsumm_4fdec02116_5d09c3b946a9f931" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-textsum-mbart-inf2:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-textsum-mbart-inf2:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-textsumm-4fdec02116"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_textsumn_0543d9441a_f65e60dfe8fa85b3" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-textsum-nasca-inf2:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "default/prod-3-ingress-textsum-nasca-inf2:80"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-textsumn-0543d9441a"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_textsumn_9ba9f7ddf5_ad349f4c5ae8ffc8" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-textsum-nasca-inf2:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-textsum-nasca-inf2:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-textsumn-9ba9f7ddf5"
  port                          = 8080
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_default_triealb_573fb3dd3b_cf8e8927688abb83" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-trie-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "default/dev-2-ingress-trie-alb:80"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-default-triealb-573fb3dd3b"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_ingressn_nginxing_84e7cb73fe_201f0ea654165b19" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "onclusive-production"
    "service.k8s.aws/resource" = "ingress-nginx/nginx-ingress-ingress-nginx-controller:80"
    "service.k8s.aws/stack"    = "ingress-nginx/nginx-ingress-ingress-nginx-controller"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "onclusive-production"
    "service.k8s.aws/resource" = "ingress-nginx/nginx-ingress-ingress-nginx-controller:80"
    "service.k8s.aws/stack"    = "ingress-nginx/nginx-ingress-ingress-nginx-controller"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 10
    port                = "traffic-port"
    protocol            = "TCP"
    timeout             = 10
    unhealthy_threshold = 3
  }

  name               = "k8s-ingressn-nginxing-84e7cb73fe"
  port               = 1
  preserve_client_ip = "false"
  protocol           = "TCP"
  proxy_protocol_v2  = true
  stickiness {
    type = "source_ip"
  }

  target_type = "ip"
  vpc_id      = "vpc-09b2e6e3b5c92678f"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_ingressn_nginxing_d437bd584c_106d40c5a1306f62" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "onclusive-production"
    "service.k8s.aws/resource" = "ingress-nginx/nginx-ingress-ingress-nginx-controller:443"
    "service.k8s.aws/stack"    = "ingress-nginx/nginx-ingress-ingress-nginx-controller"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "onclusive-production"
    "service.k8s.aws/resource" = "ingress-nginx/nginx-ingress-ingress-nginx-controller:443"
    "service.k8s.aws/stack"    = "ingress-nginx/nginx-ingress-ingress-nginx-controller"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 10
    port                = "traffic-port"
    protocol            = "TCP"
    timeout             = 10
    unhealthy_threshold = 3
  }

  name               = "k8s-ingressn-nginxing-d437bd584c"
  port               = 1
  preserve_client_ip = "false"
  protocol           = "TCP"
  proxy_protocol_v2  = true
  stickiness {
    type = "source_ip"
  }

  target_type = "ip"
  vpc_id      = "vpc-09b2e6e3b5c92678f"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_istiosys_istioing_929f751ef3_85458b164b55eeb0" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-ml-ops"
    "ingress.k8s.aws/resource" = "istio-system/istio-ingress-istio-ingressgateway:80"
    "ingress.k8s.aws/stack"    = "istio-system/istio-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-ml-ops"
    "ingress.k8s.aws/resource" = "istio-system/istio-ingress-istio-ingressgateway:80"
    "ingress.k8s.aws/stack"    = "istio-system/istio-ingress"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "k8s-istiosys-istioing-929f751ef3"
  port                          = 30168
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_k8s_prod_ingressg_1311dce736_ed0e0f45875a8ec2" {
  tags = {
    "kubernetes.io/cluster/eks-data-prod-main" = "owned"
    "kubernetes.io/service-name"               = "prod/ingress-gw"
  }

  tags_all = {
    "kubernetes.io/cluster/eks-data-prod-main" = "owned"
    "kubernetes.io/service-name"               = "prod/ingress-gw"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 30
    port                = "31201"
    protocol            = "TCP"
    timeout             = 10
    unhealthy_threshold = 3
  }

  name               = "k8s-prod-ingressg-1311dce736"
  port               = 31201
  preserve_client_ip = "true"
  protocol           = "TCP"
  stickiness {
    type = "source_ip"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_lambda_176rokeaqz1f2lwshkuz_f95503cc54a4b84e" {
  health_check {
    healthy_threshold   = 5
    interval            = 35
    matcher             = "200"
    path                = "/"
    timeout             = 30
    unhealthy_threshold = 2
  }

  name = "lambda-176rOkeaqZ1F2LWShKuz"
  stickiness {
    type = ""
  }

  target_type = "lambda"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_luminati_proxy_manager_elb_5de2124b5b8ad476" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    port                = "24000"
    protocol            = "TCP"
    timeout             = 10
    unhealthy_threshold = 2
  }

  name               = "luminati-proxy-manager-elb"
  port               = 22999
  preserve_client_ip = "true"
  protocol           = "TCP"
  stickiness {
    type = "source_ip"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_luminati_proxy_manager_elb_app_81b178592c641668" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 20
    matcher             = "200"
    path                = "/"
    port                = "24000"
    protocol            = "HTTP"
    timeout             = 10
    unhealthy_threshold = 3
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "luminati-proxy-manager-elb-app"
  port                          = 22999
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_luminati_proxy_staging_elb_9fe2fc50262724ce" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    port                = "24000"
    protocol            = "TCP"
    timeout             = 10
    unhealthy_threshold = 2
  }

  name               = "luminati-proxy-staging-elb"
  port               = 22999
  preserve_client_ip = "true"
  protocol           = "TCP"
  stickiness {
    type = "source_ip"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_monitoring_es_5x_11fd9b64dc4b90a9" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 15
    matcher             = "200"
    path                = "/"
    port                = "9200"
    protocol            = "HTTP"
    timeout             = 10
    unhealthy_threshold = 3
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "monitoring-es-5x"
  port                          = 9200
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_onclusive_data_streaming_1_tg_8d645bd021500227" {
  tags = {
    Billing = "CRAWLER"
  }

  tags_all = {
    Billing = "CRAWLER"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 30
    port                = "traffic-port"
    protocol            = "TCP"
    timeout             = 10
    unhealthy_threshold = 3
  }

  name               = "onclusive-data-streaming-1-tg"
  port               = 9092
  preserve_client_ip = "false"
  protocol           = "TCP"
  stickiness {
    type = "source_ip"
  }

  target_type = "ip"
  vpc_id      = "vpc-0324ee1c5ba324c3d"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_onclusive_data_streaming_2_tg_371a19447e3bbea4" {
  tags = {
    Billing = "CRAWLER"
  }

  tags_all = {
    Billing = "CRAWLER"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 30
    port                = "traffic-port"
    protocol            = "TCP"
    timeout             = 10
    unhealthy_threshold = 3
  }

  name               = "onclusive-data-streaming-2-tg"
  port               = 9092
  preserve_client_ip = "false"
  protocol           = "TCP"
  stickiness {
    type = "source_ip"
  }

  target_type = "ip"
  vpc_id      = "vpc-0324ee1c5ba324c3d"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_pixel_east_1_5b05c9aa345129bd" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 5
    interval            = 30
    matcher             = "200"
    path                = "/debug"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "pixel-east-1"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-661e0802"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_prod_crawler_master_f327df089948cb3a" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 5
    interval            = 30
    matcher             = "401"
    path                = "/api/run_dummy_task"
    port                = "80"
    protocol            = "HTTP"
    timeout             = 25
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "prod-crawler-master"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_selenium_hub_elb_d5e43dfda467950c" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    port                = "4444"
    protocol            = "TCP"
    timeout             = 10
    unhealthy_threshold = 2
  }

  name               = "selenium-hub-elb"
  port               = 4444
  preserve_client_ip = "true"
  protocol           = "TCP"
  stickiness {
    type = "source_ip"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_staging_es_5x_76a5423de128fa00" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 60
    matcher             = "200"
    path                = "/"
    port                = "9200"
    protocol            = "HTTP"
    timeout             = 59
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "staging-es-5x"
  port                          = 9200
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_twitter_search_dev_tg_adaff190b8ccc1ce" {
  health_check {
    healthy_threshold   = 5
    interval            = 35
    matcher             = "200"
    path                = "/"
    timeout             = 30
    unhealthy_threshold = 2
  }

  name = "twitter-search-dev-tg"
  stickiness {
    type = ""
  }

  target_type = "lambda"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_twitter_search_tg_b4bfc8eea1da6080" {
  health_check {
    healthy_threshold   = 5
    interval            = 35
    matcher             = "200"
    path                = "/"
    timeout             = 30
    unhealthy_threshold = 2
  }

  name = "twitter-search-tg"
  stickiness {
    type = ""
  }

  target_type = "lambda"
}

resource "aws_alb_target_group" "arn_aws_elasticloadbalancing_us_east_1_484375727565_targetgroup_visitor_estimation_instances_36d7b9033d3dbab4" {
  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    matcher             = "200"
    path                = "/"
    port                = "80"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "visitor-estimation-instances"
  port                          = 5000
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "bert_inference_tg" {
  tags = {
    Billing        = "data"
    Billing-Detail = "bert_nlp"
    Description    = "Target Group for Bert NLP"
    ManagedBy      = "Terraform"
    Name           = "bert_inference_tg"
  }

  tags_all = {
    Billing        = "data"
    Billing-Detail = "bert_nlp"
    Description    = "Target Group for Bert NLP"
    ManagedBy      = "Terraform"
    Name           = "bert_inference_tg"
  }

  deregistration_delay = "30"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 10
    matcher             = "200"
    path                = "/health_check"
    port                = "80"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 3
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "bert-inference-tg"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "bert_inference_tg_v1_gpu" {
  tags = {
    Billing        = "data"
    Billing-Detail = "bert_nlp"
    Description    = "Target Group for Bert NLP"
    ManagedBy      = "Terraform"
    Name           = "bert_inference_tg_v1-gpu"
  }

  tags_all = {
    Billing        = "data"
    Billing-Detail = "bert_nlp"
    Description    = "Target Group for Bert NLP"
    ManagedBy      = "Terraform"
    Name           = "bert_inference_tg_v1-gpu"
  }

  deregistration_delay = "30"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 10
    matcher             = "200"
    path                = "/health_check"
    port                = "80"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 3
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "bert-inference-tg-v1-gpu"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "bert_inference_tg_v2" {
  tags = {
    Billing        = "data"
    Billing-Detail = "bert_nlp"
    Description    = "Target Group for Bert NLP"
    ManagedBy      = "Terraform"
    Name           = "bert_inference_tg_v2"
  }

  tags_all = {
    Billing        = "data"
    Billing-Detail = "bert_nlp"
    Description    = "Target Group for Bert NLP"
    ManagedBy      = "Terraform"
    Name           = "bert_inference_tg_v2"
  }

  deregistration_delay = "30"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 10
    matcher             = "200"
    path                = "/health_check"
    port                = "80"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 3
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "bert-inference-tg-v2"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "ip"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "nlp_services_2_production" {
  tags = {
    Billing        = "Crawler"
    Billing-Detail = "crawler-nlp"
    ECSCluster     = "nlp-services-2"
    Name           = "nlp-services-2-production"
  }

  tags_all = {
    Billing        = "Crawler"
    Billing-Detail = "crawler-nlp"
    ECSCluster     = "nlp-services-2"
    Name           = "nlp-services-2-production"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 5
    interval            = 60
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 10
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "nlp-services-2-production"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "nlp_services_2_staging" {
  tags = {
    Billing        = "Crawler"
    Billing-Detail = "crawler-nlp"
    ECSCluster     = "nlp-services-2"
    Name           = "nlp-services-2-staging"
  }

  tags_all = {
    Billing        = "Crawler"
    Billing-Detail = "crawler-nlp"
    ECSCluster     = "nlp-services-2"
    Name           = "nlp-services-2-staging"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 5
    interval            = 60
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 10
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "nlp-services-2-staging"
  port                          = 5000
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "nlp_services_production" {
  tags = {
    Billing        = "Crawler"
    Billing-Detail = "Crawler-NLP"
    ECSCluster     = "nlp-services"
    Name           = "nlp-services-production"
  }

  tags_all = {
    Billing        = "Crawler"
    Billing-Detail = "Crawler-NLP"
    ECSCluster     = "nlp-services"
    Name           = "nlp-services-production"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 5
    interval            = 60
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 10
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "nlp-services-production"
  port                          = 80
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "nlp_services_staging" {
  tags = {
    Billing        = "Crawler"
    Billing-Detail = "Crawler-NLP"
    ECSCluster     = "nlp-services"
    Name           = "nlp-services-staging"
  }

  tags_all = {
    Billing        = "Crawler"
    Billing-Detail = "Crawler-NLP"
    ECSCluster     = "nlp-services"
    Name           = "nlp-services-staging"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 5
    interval            = 60
    matcher             = "200"
    path                = "/ping"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 10
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "nlp-services-staging"
  port                          = 5000
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "onclusive_data_streaming" {
  tags = {
    Billing          = "CRAWLER"
    "Billing Detail" = "Critical Mention to MSK integration"
    Name             = "onclusive-data-streaming"
  }

  tags_all = {
    Billing          = "CRAWLER"
    "Billing Detail" = "Critical Mention to MSK integration"
    Name             = "onclusive-data-streaming"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 30
    port                = "traffic-port"
    protocol            = "TCP"
    timeout             = 10
    unhealthy_threshold = 3
  }

  name               = "onclusive-data-streaming"
  port               = 9092
  preserve_client_ip = "true"
  protocol           = "TCP"
  stickiness {
    type = "source_ip"
  }

  target_type = "instance"
  vpc_id      = "vpc-0324ee1c5ba324c3d"
}

resource "aws_alb_target_group" "r_server" {
  tags = {
    Billing        = "Extractor"
    Billing-Detail = "R-Server"
    Name           = "r-server"
    ServiceName    = "r-server"
  }

  tags_all = {
    Billing        = "Extractor"
    Billing-Detail = "R-Server"
    Name           = "r-server"
    ServiceName    = "r-server"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 5
    interval            = 30
    port                = "traffic-port"
    protocol            = "TCP"
    timeout             = 10
    unhealthy_threshold = 5
  }

  name               = "r-server"
  port               = 6311
  preserve_client_ip = "true"
  protocol           = "TCP"
  stickiness {
    type = "source_ip"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

resource "aws_alb_target_group" "splash_internal_splash_tg" {
  tags = {
    Billing     = "Crawler"
    Name        = "splash-internal-splash-tg"
    ServiceName = "splash-internal"
  }

  tags_all = {
    Billing     = "Crawler"
    Name        = "splash-internal-splash-tg"
    ServiceName = "splash-internal"
  }

  deregistration_delay = "300"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    matcher             = "200"
    path                = "/"
    port                = "8050"
    protocol            = "HTTP"
    timeout             = 25
    unhealthy_threshold = 10
  }

  load_balancing_algorithm_type = "round_robin"
  name                          = "splash-internal-splash"
  port                          = 443
  protocol                      = "HTTP"
  protocol_version              = "HTTP1"
  stickiness {
    cookie_duration = 86400
    type            = "lb_cookie"
  }

  target_type = "instance"
  vpc_id      = "vpc-8e992de8"
}

