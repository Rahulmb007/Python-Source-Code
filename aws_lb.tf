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

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_ac126a33_argocd_dev3argocd_a687_4cf2c3f1d9c523fc" {
  tags = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "LoadBalancer"
    "ingress.k8s.aws/stack"                = "argocd/dev3-argocd-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev3-argocd-ingress"
    "kubernetes.io/namespace"              = "argocd"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "LoadBalancer"
    "ingress.k8s.aws/stack"                = "argocd/dev3-argocd-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev3-argocd-ingress"
    "kubernetes.io/namespace"              = "argocd"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  internal                         = true
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "ac126a33-argocd-dev3argocd-a687"
  security_groups                  = ["sg-0204f0bfde482f49c"]
  subnet_mapping {
    subnet_id = "subnet-0b6ef8616d2b30de5"
  }

  subnet_mapping {
    subnet_id = "subnet-0070fcef3eafcc62a"
  }

  subnet_mapping {
    subnet_id = "subnet-0246184c24bfa6c9d"
  }

  subnet_mapping {
    subnet_id = "subnet-00405c02874c638ff"
  }

  subnets = ["subnet-0070fcef3eafcc62a", "subnet-0246184c24bfa6c9d", "subnet-00405c02874c638ff", "subnet-0b6ef8616d2b30de5"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_ac126a33_default_dev3ingre_dd09_84c4412c7a5c5bb9" {
  tags = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "LoadBalancer"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "LoadBalancer"
    "ingress.k8s.aws/stack"                = "default/dev-3-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev-3-ingress"
    "kubernetes.io/namespace"              = "default"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  internal                         = true
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "ac126a33-default-dev3ingre-dd09"
  security_groups                  = ["sg-0204f0bfde482f49c"]
  subnet_mapping {
    subnet_id = "subnet-009464f3dc58611e1"
  }

  subnet_mapping {
    subnet_id = "subnet-0b6ef8616d2b30de5"
  }

  subnet_mapping {
    subnet_id = "subnet-0070fcef3eafcc62a"
  }

  subnet_mapping {
    subnet_id = "subnet-0246184c24bfa6c9d"
  }

  subnet_mapping {
    subnet_id = "subnet-09db383fa8ed9a1ed"
  }

  subnet_mapping {
    subnet_id = "subnet-00405c02874c638ff"
  }

  subnets = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0246184c24bfa6c9d", "subnet-00405c02874c638ff", "subnet-0b6ef8616d2b30de5", "subnet-009464f3dc58611e1"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_ac126a33_istiosystem_dev3i_f8f0_9e5fcac98f550afb" {
  tags = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "LoadBalancer"
    "ingress.k8s.aws/stack"                = "istio-system/dev3-istio-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev3-istio-ingress"
    "kubernetes.io/namespace"              = "istio-system"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"              = "eks-data-dev-3"
    "ingress.k8s.aws/resource"             = "LoadBalancer"
    "ingress.k8s.aws/stack"                = "istio-system/dev3-istio-ingress"
    "kubernetes.io/cluster/eks-data-dev-3" = "owned"
    "kubernetes.io/ingress-name"           = "dev3-istio-ingress"
    "kubernetes.io/namespace"              = "istio-system"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  internal                         = true
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "ac126a33-istiosystem-dev3i-f8f0"
  security_groups                  = ["sg-0204f0bfde482f49c"]
  subnet_mapping {
    subnet_id = "subnet-0b6ef8616d2b30de5"
  }

  subnet_mapping {
    subnet_id = "subnet-0246184c24bfa6c9d"
  }

  subnet_mapping {
    subnet_id = "subnet-00405c02874c638ff"
  }

  subnets = ["subnet-0246184c24bfa6c9d", "subnet-00405c02874c638ff", "subnet-0b6ef8616d2b30de5"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_airpr_extractor_light4j_external_0b44b4a16dcc459a" {
  tags = {
    Billing        = "Extractor"
    Billing-Detail = "Content-Extractor"
    ServiceName    = "airpr-extractor-light4j-external"
  }

  tags_all = {
    Billing        = "Extractor"
    Billing-Detail = "Content-Extractor"
    ServiceName    = "airpr-extractor-light4j-external"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "airpr-extractor-light4j-external"
  security_groups                  = ["sg-052d9b0f438a6ee14"]
  subnet_mapping {
    subnet_id = "subnet-0518a439"
  }

  subnet_mapping {
    subnet_id = "subnet-af1f38a3"
  }

  subnet_mapping {
    subnet_id = "subnet-e45d30bf"
  }

  subnet_mapping {
    subnet_id = "subnet-29d0a404"
  }

  subnet_mapping {
    subnet_id = "subnet-893a1fc0"
  }

  subnets = ["subnet-e45d30bf", "subnet-0518a439", "subnet-af1f38a3", "subnet-893a1fc0", "subnet-29d0a404"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_airpr_extractor_light4j_f1dff3cee26ff8cd" {
  tags = {
    Billing        = "Extractor"
    Billing-Detail = "Content-Extractor"
    ServiceName    = "airpr-extractor-light4j"
  }

  tags_all = {
    Billing        = "Extractor"
    Billing-Detail = "Content-Extractor"
    ServiceName    = "airpr-extractor-light4j"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "airpr-extractor-light4j"
  security_groups                  = ["sg-052d9b0f438a6ee14"]
  subnet_mapping {
    subnet_id = "subnet-0518a439"
  }

  subnet_mapping {
    subnet_id = "subnet-af1f38a3"
  }

  subnet_mapping {
    subnet_id = "subnet-e45d30bf"
  }

  subnet_mapping {
    subnet_id = "subnet-29d0a404"
  }

  subnet_mapping {
    subnet_id = "subnet-893a1fc0"
  }

  subnets = ["subnet-e45d30bf", "subnet-0518a439", "subnet-af1f38a3", "subnet-893a1fc0", "subnet-29d0a404"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_airpr_extractor_light4j_internal_9cc8bb0e474d54b2" {
  tags = {
    Billing        = "Extractor"
    Billing-Detail = "Content-Extractor"
    ServiceName    = "airpr-extractor-light4j-internal"
  }

  tags_all = {
    Billing        = "Extractor"
    Billing-Detail = "Content-Extractor"
    ServiceName    = "airpr-extractor-light4j-internal"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  internal                         = true
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "airpr-extractor-light4j-internal"
  security_groups                  = ["sg-052d9b0f438a6ee14"]
  subnet_mapping {
    subnet_id = "subnet-d6d1a5fb"
  }

  subnet_mapping {
    subnet_id = "subnet-c62f09ca"
  }

  subnet_mapping {
    subnet_id = "subnet-ef0421a6"
  }

  subnet_mapping {
    subnet_id = "subnet-5a19a566"
  }

  subnet_mapping {
    subnet_id = "subnet-d45f328f"
  }

  subnets = ["subnet-ef0421a6", "subnet-d6d1a5fb", "subnet-d45f328f", "subnet-5a19a566", "subnet-c62f09ca"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_airpr_extractor_light4j_sl_54cdc2d5db7b9f6d" {
  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "airpr-extractor-light4j-sl"
  security_groups                  = ["sg-0d677f3e3a7f6f6dc", "sg-149f7c68"]
  subnet_mapping {
    subnet_id = "subnet-8dd2a6a0"
  }

  subnet_mapping {
    subnet_id = "subnet-893a1fc0"
  }

  subnets = ["subnet-893a1fc0", "subnet-8dd2a6a0"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_airpr_visitor_estimation_0e46e8ae62a2052d" {
  tags = {
    Billing        = "Crawler"
    Billing-Detail = "Visitor-Estimation"
  }

  tags_all = {
    Billing        = "Crawler"
    Billing-Detail = "Visitor-Estimation"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_deletion_protection       = true
  enable_http2                     = true
  idle_timeout                     = 60
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "airpr-visitor-estimation"
  security_groups                  = ["sg-149f7c68", "sg-f396c780"]
  subnet_mapping {
    subnet_id = "subnet-40072209"
  }

  subnet_mapping {
    subnet_id = "subnet-ab5f32f0"
  }

  subnet_mapping {
    subnet_id = "subnet-9d19a5a1"
  }

  subnets = ["subnet-ab5f32f0", "subnet-9d19a5a1", "subnet-40072209"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_analyst_es_5x_7575abbee24bce0d" {
  tags = {
    Billing        = "Analyst"
    Billing-Detail = "Analyst-Elasticsearch-5x"
  }

  tags_all = {
    Billing        = "Analyst"
    Billing-Detail = "Analyst-Elasticsearch-5x"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "analyst-es-5x"
  security_groups                  = ["sg-0cc3e526f44dccbaa"]
  subnet_mapping {
    subnet_id = "subnet-0518a439"
  }

  subnet_mapping {
    subnet_id = "subnet-af1f38a3"
  }

  subnet_mapping {
    subnet_id = "subnet-514c3d34"
  }

  subnet_mapping {
    subnet_id = "subnet-e45d30bf"
  }

  subnet_mapping {
    subnet_id = "subnet-29d0a404"
  }

  subnet_mapping {
    subnet_id = "subnet-893a1fc0"
  }

  subnets = ["subnet-514c3d34", "subnet-e45d30bf", "subnet-0518a439", "subnet-af1f38a3", "subnet-893a1fc0", "subnet-29d0a404"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_analytics_es_5x_7af6b8bcd507e73b" {
  tags = {
    Billing        = "Analyst"
    Billing-Detail = "Analytics-Elasticsearch-5x"
  }

  tags_all = {
    Billing        = "Analyst"
    Billing-Detail = "Analytics-Elasticsearch-5x"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "analytics-es-5x"
  security_groups                  = ["sg-04a264e8afe1cb921"]
  subnet_mapping {
    subnet_id = "subnet-0518a439"
  }

  subnet_mapping {
    subnet_id = "subnet-af1f38a3"
  }

  subnet_mapping {
    subnet_id = "subnet-514c3d34"
  }

  subnet_mapping {
    subnet_id = "subnet-e45d30bf"
  }

  subnet_mapping {
    subnet_id = "subnet-29d0a404"
  }

  subnet_mapping {
    subnet_id = "subnet-893a1fc0"
  }

  subnets = ["subnet-514c3d34", "subnet-e45d30bf", "subnet-0518a439", "subnet-af1f38a3", "subnet-893a1fc0", "subnet-29d0a404"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_analytics_es_6x_1627caec887b817e" {
  tags = {
    Billing        = "Analyst"
    Billing-Detail = "Analytics-Elasticsearch-6x"
  }

  tags_all = {
    Billing        = "Analyst"
    Billing-Detail = "Analytics-Elasticsearch-6x"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "analytics-es-6x"
  security_groups                  = ["sg-03ced1334c9b01d48"]
  subnet_mapping {
    subnet_id = "subnet-0518a439"
  }

  subnet_mapping {
    subnet_id = "subnet-af1f38a3"
  }

  subnet_mapping {
    subnet_id = "subnet-514c3d34"
  }

  subnet_mapping {
    subnet_id = "subnet-e45d30bf"
  }

  subnet_mapping {
    subnet_id = "subnet-29d0a404"
  }

  subnet_mapping {
    subnet_id = "subnet-893a1fc0"
  }

  subnets = ["subnet-514c3d34", "subnet-e45d30bf", "subnet-0518a439", "subnet-af1f38a3", "subnet-893a1fc0", "subnet-29d0a404"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_crawler_es_6x_4d921cbee6fc5ad5" {
  tags = {
    Billing        = "Crawler"
    Billing-Detail = "Crawler-Elasticsearch-6x"
  }

  tags_all = {
    Billing        = "Crawler"
    Billing-Detail = "Crawler-Elasticsearch-6x"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "crawler-es-6x"
  security_groups                  = ["sg-093a3bb9a7261bcfe"]
  subnet_mapping {
    subnet_id = "subnet-0518a439"
  }

  subnet_mapping {
    subnet_id = "subnet-af1f38a3"
  }

  subnet_mapping {
    subnet_id = "subnet-514c3d34"
  }

  subnet_mapping {
    subnet_id = "subnet-e45d30bf"
  }

  subnet_mapping {
    subnet_id = "subnet-29d0a404"
  }

  subnet_mapping {
    subnet_id = "subnet-893a1fc0"
  }

  subnets = ["subnet-514c3d34", "subnet-e45d30bf", "subnet-0518a439", "subnet-af1f38a3", "subnet-893a1fc0", "subnet-29d0a404"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_crawler_es_client_6b792cfb976f9e9b" {
  tags = {
    Billing        = "Crawler"
    Billing-Detail = "Crawler-Elasticsearch"
  }

  tags_all = {
    Billing        = "Crawler"
    Billing-Detail = "Crawler-Elasticsearch"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "crawler-es-client"
  security_groups                  = ["sg-234a9258", "sg-e086e784", "sg-9a7ca3fd", "sg-0c0f9e68"]
  subnet_mapping {
    subnet_id = "subnet-1a2bae43"
  }

  subnet_mapping {
    subnet_id = "subnet-daa409f1"
  }

  subnet_mapping {
    subnet_id = "subnet-2c21465b"
  }

  subnet_mapping {
    subnet_id = "subnet-f0f3bbca"
  }

  subnets = ["subnet-2c21465b", "subnet-f0f3bbca", "subnet-1a2bae43", "subnet-daa409f1"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_crawler_es_util_6fd6b370b0d0c38a" {
  tags = {
    Billing        = "Crawler"
    Billing-Detail = "ES-Utils-Plugins"
  }

  tags_all = {
    Billing        = "Crawler"
    Billing-Detail = "ES-Utils-Plugins"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_deletion_protection       = true
  enable_http2                     = true
  idle_timeout                     = 60
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "crawler-es-util"
  security_groups                  = ["sg-8f2f9dc7"]
  subnet_mapping {
    subnet_id = "subnet-1a2bae43"
  }

  subnet_mapping {
    subnet_id = "subnet-daa409f1"
  }

  subnet_mapping {
    subnet_id = "subnet-2c21465b"
  }

  subnet_mapping {
    subnet_id = "subnet-f0f3bbca"
  }

  subnets = ["subnet-2c21465b", "subnet-f0f3bbca", "subnet-1a2bae43", "subnet-daa409f1"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_crawler_percolates_5x_cc3a31f4746d1582" {
  tags = {
    Billing        = "Crawler-5x"
    Billing-Detail = "Crawler-Percolates-5x"
  }

  tags_all = {
    Billing        = "Crawler-5x"
    Billing-Detail = "Crawler-Percolates-5x"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_deletion_protection       = true
  enable_http2                     = true
  idle_timeout                     = 60
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "crawler-percolates-5x"
  security_groups                  = ["sg-a2a7f6d1"]
  subnet_mapping {
    subnet_id = "subnet-3a505616"
  }

  subnet_mapping {
    subnet_id = "subnet-8aa264c1"
  }

  subnet_mapping {
    subnet_id = "subnet-56c2c15a"
  }

  subnet_mapping {
    subnet_id = "subnet-5a7b4000"
  }

  subnet_mapping {
    subnet_id = "subnet-3f468900"
  }

  subnets = ["subnet-56c2c15a", "subnet-3a505616", "subnet-5a7b4000", "subnet-3f468900", "subnet-8aa264c1"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_crawler_percolates_fe_5x_60130645376ab7be" {
  tags = {
    Billing        = "Crawler-5x"
    Billing-Detail = "Crawler-Percolates-5x"
  }

  tags_all = {
    Billing        = "Crawler-5x"
    Billing-Detail = "Crawler-Percolates-5x"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "crawler-percolates-fe-5x"
  security_groups                  = ["sg-028fecc5f68b7b8a6"]
  subnet_mapping {
    subnet_id = "subnet-3a505616"
  }

  subnet_mapping {
    subnet_id = "subnet-8aa264c1"
  }

  subnet_mapping {
    subnet_id = "subnet-56c2c15a"
  }

  subnet_mapping {
    subnet_id = "subnet-5a7b4000"
  }

  subnet_mapping {
    subnet_id = "subnet-3f468900"
  }

  subnets = ["subnet-56c2c15a", "subnet-3a505616", "subnet-5a7b4000", "subnet-3f468900", "subnet-8aa264c1"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_crawler_prod_es_6x_712e6df24692bb95" {
  tags = {
    Billing        = "Crawler"
    Billing-Detail = "Crawler-Prod-Elasticsearch-6x"
  }

  tags_all = {
    Billing        = "Crawler"
    Billing-Detail = "Crawler-Prod-Elasticsearch-6x"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "crawler-prod-es-6x"
  security_groups                  = ["sg-09b6125727b03e8f9"]
  subnet_mapping {
    subnet_id = "subnet-0518a439"
  }

  subnet_mapping {
    subnet_id = "subnet-af1f38a3"
  }

  subnet_mapping {
    subnet_id = "subnet-514c3d34"
  }

  subnet_mapping {
    subnet_id = "subnet-e45d30bf"
  }

  subnet_mapping {
    subnet_id = "subnet-29d0a404"
  }

  subnet_mapping {
    subnet_id = "subnet-893a1fc0"
  }

  subnets = ["subnet-514c3d34", "subnet-e45d30bf", "subnet-0518a439", "subnet-af1f38a3", "subnet-893a1fc0", "subnet-29d0a404"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_f03c0651_default_prod1ingr_7563_ff0bb38c663e7d18" {
  tags = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "LoadBalancer"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
  }

  tags_all = {
    "ingress.k8s.aws/cluster"               = "eks-data-prod-1"
    "ingress.k8s.aws/resource"              = "LoadBalancer"
    "ingress.k8s.aws/stack"                 = "default/prod-1-ingress"
    "kubernetes.io/cluster/eks-data-prod-1" = "owned"
    "kubernetes.io/ingress-name"            = "prod-1-ingress"
    "kubernetes.io/namespace"               = "default"
  }

  access_logs {
    bucket  = "airpr-elb-accesslogs"
    enabled = true
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  internal                         = true
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "f03c0651-default-prod1ingr-7563"
  security_groups                  = ["sg-05f3f1c8e7b767c8e"]
  subnet_mapping {
    subnet_id = "subnet-009464f3dc58611e1"
  }

  subnet_mapping {
    subnet_id = "subnet-0b6ef8616d2b30de5"
  }

  subnet_mapping {
    subnet_id = "subnet-0070fcef3eafcc62a"
  }

  subnet_mapping {
    subnet_id = "subnet-0246184c24bfa6c9d"
  }

  subnet_mapping {
    subnet_id = "subnet-09db383fa8ed9a1ed"
  }

  subnet_mapping {
    subnet_id = "subnet-00405c02874c638ff"
  }

  subnets = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0246184c24bfa6c9d", "subnet-00405c02874c638ff", "subnet-0b6ef8616d2b30de5", "subnet-009464f3dc58611e1"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_k8s_default_dev2ingr_7be0a1ceb0_89894bc1f0fe2c35" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "LoadBalancer"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-dev-2"
    "ingress.k8s.aws/resource" = "LoadBalancer"
    "ingress.k8s.aws/stack"    = "default/dev-2-ingress"
  }

  access_logs {
    bucket  = "airpr-elb-accesslogs"
    enabled = true
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  enable_waf_fail_open             = true
  idle_timeout                     = 60
  internal                         = true
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "k8s-default-dev2ingr-7be0a1ceb0"
  security_groups                  = ["sg-0204f0bfde482f49c"]
  subnet_mapping {
    subnet_id = "subnet-03238c4e79281bbf8"
  }

  subnet_mapping {
    subnet_id = "subnet-0d7dcdfb4bfb75ca1"
  }

  subnets = ["subnet-03238c4e79281bbf8", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_k8s_default_prod3ing_75a5f4c190_650a139e70c846e1" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "LoadBalancer"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-data-prod-3"
    "ingress.k8s.aws/resource" = "LoadBalancer"
    "ingress.k8s.aws/stack"    = "default/prod-3-ingress"
  }

  access_logs {
    bucket = "airpr-elb-accesslogs"
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  internal                         = true
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "k8s-default-prod3ing-75a5f4c190"
  security_groups                  = ["sg-0204f0bfde482f49c"]
  subnet_mapping {
    subnet_id = "subnet-009464f3dc58611e1"
  }

  subnet_mapping {
    subnet_id = "subnet-0470c4405b2b5d1c8"
  }

  subnet_mapping {
    subnet_id = "subnet-03238c4e79281bbf8"
  }

  subnet_mapping {
    subnet_id = "subnet-0d7dcdfb4bfb75ca1"
  }

  subnet_mapping {
    subnet_id = "subnet-00405c02874c638ff"
  }

  subnets = ["subnet-0470c4405b2b5d1c8", "subnet-03238c4e79281bbf8", "subnet-00405c02874c638ff", "subnet-009464f3dc58611e1", "subnet-0d7dcdfb4bfb75ca1"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_k8s_istiosys_istioing_527dc2303c_ac7b79eb7e63bd31" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-ml-ops"
    "ingress.k8s.aws/resource" = "LoadBalancer"
    "ingress.k8s.aws/stack"    = "istio-system/istio-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "eks-ml-ops"
    "ingress.k8s.aws/resource" = "LoadBalancer"
    "ingress.k8s.aws/stack"    = "istio-system/istio-ingress"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  drop_invalid_header_fields       = true
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  internal                         = true
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "k8s-istiosys-istioing-527dc2303c"
  security_groups                  = ["sg-0f4b3d55361b26656", "sg-03d11ea75ef379476"]
  subnet_mapping {
    subnet_id = "subnet-009464f3dc58611e1"
  }

  subnet_mapping {
    subnet_id = "subnet-0070fcef3eafcc62a"
  }

  subnet_mapping {
    subnet_id = "subnet-09db383fa8ed9a1ed"
  }

  subnets = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-009464f3dc58611e1"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_luminati_proxy_manager_elb_d390b92366998397" {
  tags = {
    Billing        = "Crawler"
    Billing-Detail = "Crawler-Luminatti-Proxy-Manager"
    ServiceName    = "luminati-proxy-manager"
  }

  tags_all = {
    Billing        = "Crawler"
    Billing-Detail = "Crawler-Luminatti-Proxy-Manager"
    ServiceName    = "luminati-proxy-manager"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  internal                         = true
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "luminati-proxy-manager-elb"
  security_groups                  = ["sg-5d2b0717"]
  subnet_mapping {
    subnet_id = "subnet-c903a182"
  }

  subnet_mapping {
    subnet_id = "subnet-878bbd8b"
  }

  subnet_mapping {
    subnet_id = "subnet-5496757b"
  }

  subnet_mapping {
    subnet_id = "subnet-5c8d6901"
  }

  subnet_mapping {
    subnet_id = "subnet-5fef4b60"
  }

  subnets = ["subnet-5496757b", "subnet-c903a182", "subnet-5fef4b60", "subnet-878bbd8b", "subnet-5c8d6901"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_monitoring_es_5x_5a52e7ef4851c4c9" {
  tags = {
    Billing        = "Crawler"
    Billing-Detail = "Monitoring-Elasticsearch-5x"
  }

  tags_all = {
    Billing        = "Crawler"
    Billing-Detail = "Monitoring-Elasticsearch-5x"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "monitoring-es-5x"
  security_groups                  = ["sg-014ef6816108bff75"]
  subnet_mapping {
    subnet_id = "subnet-0518a439"
  }

  subnet_mapping {
    subnet_id = "subnet-af1f38a3"
  }

  subnet_mapping {
    subnet_id = "subnet-514c3d34"
  }

  subnet_mapping {
    subnet_id = "subnet-e45d30bf"
  }

  subnet_mapping {
    subnet_id = "subnet-29d0a404"
  }

  subnet_mapping {
    subnet_id = "subnet-893a1fc0"
  }

  subnets = ["subnet-514c3d34", "subnet-e45d30bf", "subnet-0518a439", "subnet-af1f38a3", "subnet-893a1fc0", "subnet-29d0a404"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_nlp_services_2_aca9adc3123f9c84" {
  tags = {
    Billing        = "Crawler"
    Billing-Detail = "crawler-nlp"
    ECSCluster     = "nlp-services-2"
  }

  tags_all = {
    Billing        = "Crawler"
    Billing-Detail = "crawler-nlp"
    ECSCluster     = "nlp-services-2"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  internal                         = true
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "nlp-services-2"
  security_groups                  = ["sg-02df5db3e8ce7db4e"]
  subnet_mapping {
    subnet_id = "subnet-d6d1a5fb"
  }

  subnet_mapping {
    subnet_id = "subnet-c62f09ca"
  }

  subnet_mapping {
    subnet_id = "subnet-ef0421a6"
  }

  subnet_mapping {
    subnet_id = "subnet-5a19a566"
  }

  subnet_mapping {
    subnet_id = "subnet-d45f328f"
  }

  subnets = ["subnet-ef0421a6", "subnet-d6d1a5fb", "subnet-d45f328f", "subnet-5a19a566", "subnet-c62f09ca"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_pixel_alb_af955ca7e396cd5c" {
  tags = {
    Billing        = "Pixel"
    Billing-Detail = "Pixel-ALB"
  }

  tags_all = {
    Billing        = "Pixel"
    Billing-Detail = "Pixel-ALB"
  }

  access_logs {
    bucket  = "airpr-pixel"
    enabled = true
    prefix  = "alb"
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_deletion_protection       = true
  enable_http2                     = true
  idle_timeout                     = 60
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "pixel-alb"
  security_groups                  = ["sg-cfb281b7"]
  subnet_mapping {
    subnet_id = "subnet-0c215a7a"
  }

  subnet_mapping {
    subnet_id = "subnet-7926af53"
  }

  subnet_mapping {
    subnet_id = "subnet-fe46cda6"
  }

  subnets = ["subnet-fe46cda6", "subnet-0c215a7a", "subnet-7926af53"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_prod_crawler_master_a826f6d7b758bcb1" {
  tags = {
    Billing        = "Crawler Master"
    Billing-Detail = "Crawler Master"
    ServiceName    = "prod-crawler-master"
  }

  tags_all = {
    Billing        = "Crawler Master"
    Billing-Detail = "Crawler Master"
    ServiceName    = "prod-crawler-master"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "prod-crawler-master"
  security_groups                  = ["sg-149f7c68", "sg-0faf98a01399fe0aa"]
  subnet_mapping {
    subnet_id = "subnet-0518a439"
  }

  subnet_mapping {
    subnet_id = "subnet-af1f38a3"
  }

  subnet_mapping {
    subnet_id = "subnet-514c3d34"
  }

  subnet_mapping {
    subnet_id = "subnet-e45d30bf"
  }

  subnet_mapping {
    subnet_id = "subnet-d3d2a6fe"
  }

  subnet_mapping {
    subnet_id = "subnet-893a1fc0"
  }

  subnets = ["subnet-514c3d34", "subnet-e45d30bf", "subnet-d3d2a6fe", "subnet-0518a439", "subnet-af1f38a3", "subnet-893a1fc0"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_splash_internal_84c86d80f6b76cf3" {
  tags = {
    Billing        = "Crawler"
    Billing-Detail = "Splash"
    ServiceName    = "splash-internal"
  }

  tags_all = {
    Billing        = "Crawler"
    Billing-Detail = "Splash"
    ServiceName    = "splash-internal"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  internal                         = true
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "splash-internal"
  security_groups                  = ["sg-0164db70a6c536f51"]
  subnet_mapping {
    subnet_id = "subnet-0518a439"
  }

  subnet_mapping {
    subnet_id = "subnet-af1f38a3"
  }

  subnet_mapping {
    subnet_id = "subnet-e45d30bf"
  }

  subnet_mapping {
    subnet_id = "subnet-29d0a404"
  }

  subnet_mapping {
    subnet_id = "subnet-893a1fc0"
  }

  subnets = ["subnet-e45d30bf", "subnet-0518a439", "subnet-af1f38a3", "subnet-893a1fc0", "subnet-29d0a404"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_staging_es_5x_48401b361793827e" {
  tags = {
    Billing        = "Crawler"
    Billing-Detail = "CrawlerStaging-Elasticsearch-5x"
  }

  tags_all = {
    Billing        = "Crawler"
    Billing-Detail = "CrawlerStaging-Elasticsearch-5x"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "staging-es-5x"
  security_groups                  = ["sg-0c2489873536cb86c"]
  subnet_mapping {
    subnet_id = "subnet-0518a439"
  }

  subnet_mapping {
    subnet_id = "subnet-af1f38a3"
  }

  subnet_mapping {
    subnet_id = "subnet-514c3d34"
  }

  subnet_mapping {
    subnet_id = "subnet-e45d30bf"
  }

  subnet_mapping {
    subnet_id = "subnet-29d0a404"
  }

  subnet_mapping {
    subnet_id = "subnet-893a1fc0"
  }

  subnets = ["subnet-514c3d34", "subnet-e45d30bf", "subnet-0518a439", "subnet-af1f38a3", "subnet-893a1fc0", "subnet-29d0a404"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_twitter_search_dev_47a97607e59a1bd4" {
  tags = {
    Billing        = "Crawler"
    Billing-Detail = "Twitter-Search"
  }

  tags_all = {
    Billing        = "Crawler"
    Billing-Detail = "Twitter-Search"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 300
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "twitter-search-dev"
  security_groups                  = ["sg-75380507"]
  subnet_mapping {
    subnet_id = "subnet-0518a439"
  }

  subnet_mapping {
    subnet_id = "subnet-af1f38a3"
  }

  subnet_mapping {
    subnet_id = "subnet-514c3d34"
  }

  subnet_mapping {
    subnet_id = "subnet-e45d30bf"
  }

  subnet_mapping {
    subnet_id = "subnet-29d0a404"
  }

  subnet_mapping {
    subnet_id = "subnet-893a1fc0"
  }

  subnets = ["subnet-514c3d34", "subnet-e45d30bf", "subnet-0518a439", "subnet-af1f38a3", "subnet-893a1fc0", "subnet-29d0a404"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_app_twitter_search_f8e973a8125006d8" {
  tags = {
    Billing        = "Crawler"
    Billing-Detail = "Twitter-Search"
  }

  tags_all = {
    Billing        = "Crawler"
    Billing-Detail = "Twitter-Search"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_deletion_protection       = true
  enable_http2                     = true
  idle_timeout                     = 300
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "twitter-search"
  security_groups                  = ["sg-75380507"]
  subnet_mapping {
    subnet_id = "subnet-0518a439"
  }

  subnet_mapping {
    subnet_id = "subnet-af1f38a3"
  }

  subnet_mapping {
    subnet_id = "subnet-514c3d34"
  }

  subnet_mapping {
    subnet_id = "subnet-e45d30bf"
  }

  subnet_mapping {
    subnet_id = "subnet-29d0a404"
  }

  subnet_mapping {
    subnet_id = "subnet-893a1fc0"
  }

  subnets = ["subnet-514c3d34", "subnet-e45d30bf", "subnet-0518a439", "subnet-af1f38a3", "subnet-893a1fc0", "subnet-29d0a404"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_net_ad9177437a8aa4954aabe013705ffd8d_d4c8ae7671f7ba6f" {
  tags = {
    "kubernetes.io/cluster/eks-data-prod-main" = "owned"
    "kubernetes.io/service-name"               = "prod/ingress-gw"
  }

  tags_all = {
    "kubernetes.io/cluster/eks-data-prod-main" = "owned"
    "kubernetes.io/service-name"               = "prod/ingress-gw"
  }

  access_logs {
    bucket = ""
  }

  internal           = true
  ip_address_type    = "ipv4"
  load_balancer_type = "network"
  name               = "ad9177437a8aa4954aabe013705ffd8d"
  subnet_mapping {
    subnet_id = "subnet-009464f3dc58611e1"
  }

  subnet_mapping {
    subnet_id = "subnet-0b6ef8616d2b30de5"
  }

  subnet_mapping {
    subnet_id = "subnet-0070fcef3eafcc62a"
  }

  subnet_mapping {
    subnet_id = "subnet-09db383fa8ed9a1ed"
  }

  subnets = ["subnet-09db383fa8ed9a1ed", "subnet-0070fcef3eafcc62a", "subnet-0b6ef8616d2b30de5", "subnet-009464f3dc58611e1"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_net_eks_data_prod_external_9a1b7bb4459ec04a" {
  access_logs {
    bucket = ""
  }

  ip_address_type    = "ipv4"
  load_balancer_type = "network"
  name               = "eks-data-prod-external"
  subnet_mapping {
    subnet_id = "subnet-af1f38a3"
  }

  subnet_mapping {
    subnet_id = "subnet-635e3338"
  }

  subnet_mapping {
    subnet_id = "subnet-514c3d34"
  }

  subnet_mapping {
    subnet_id = "subnet-8dd2a6a0"
  }

  subnet_mapping {
    subnet_id = "subnet-19072250"
  }

  subnets = ["subnet-514c3d34", "subnet-635e3338", "subnet-af1f38a3", "subnet-8dd2a6a0", "subnet-19072250"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_net_k8s_ingressn_nginxing_e912559390_f6fe4796770dd9a0" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "onclusive-production"
    "service.k8s.aws/resource" = "LoadBalancer"
    "service.k8s.aws/stack"    = "ingress-nginx/nginx-ingress-ingress-nginx-controller"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "onclusive-production"
    "service.k8s.aws/resource" = "LoadBalancer"
    "service.k8s.aws/stack"    = "ingress-nginx/nginx-ingress-ingress-nginx-controller"
  }

  access_logs {
    bucket = ""
  }

  ip_address_type    = "ipv4"
  load_balancer_type = "network"
  name               = "k8s-ingressn-nginxing-e912559390"
  subnet_mapping {
    subnet_id = "subnet-06d3d672702915e80"
  }

  subnet_mapping {
    subnet_id = "subnet-0ad0e38053e2a27e5"
  }

  subnet_mapping {
    subnet_id = "subnet-0ebcfea07205edfb2"
  }

  subnets = ["subnet-06d3d672702915e80", "subnet-0ad0e38053e2a27e5", "subnet-0ebcfea07205edfb2"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_net_luminati_proxy_staging_elb_1d2362322db2ae72" {
  tags = {
    Billing        = "Crawler"
    Billing-Detail = "Crawler-Luminatti-Proxy-Manager"
    ServiceName    = "luminati-proxy-staging"
  }

  tags_all = {
    Billing        = "Crawler"
    Billing-Detail = "Crawler-Luminatti-Proxy-Manager"
    ServiceName    = "luminati-proxy-staging"
  }

  access_logs {
    bucket = ""
  }

  internal           = true
  ip_address_type    = "ipv4"
  load_balancer_type = "network"
  name               = "luminati-proxy-staging-elb"
  subnet_mapping {
    subnet_id = "subnet-c903a182"
  }

  subnet_mapping {
    subnet_id = "subnet-878bbd8b"
  }

  subnet_mapping {
    subnet_id = "subnet-5496757b"
  }

  subnet_mapping {
    subnet_id = "subnet-5c8d6901"
  }

  subnet_mapping {
    subnet_id = "subnet-5fef4b60"
  }

  subnets = ["subnet-5496757b", "subnet-c903a182", "subnet-5fef4b60", "subnet-878bbd8b", "subnet-5c8d6901"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_net_r_server_1c99945fe8b0ce33" {
  tags = {
    Billing        = "Extractor"
    Billing-Detail = "R-Server"
    ServiceName    = "r-server"
  }

  tags_all = {
    Billing        = "Extractor"
    Billing-Detail = "R-Server"
    ServiceName    = "r-server"
  }

  access_logs {
    bucket = ""
  }

  ip_address_type    = "ipv4"
  load_balancer_type = "network"
  name               = "r-server"
  subnet_mapping {
    subnet_id = "subnet-0518a439"
  }

  subnet_mapping {
    subnet_id = "subnet-af1f38a3"
  }

  subnet_mapping {
    subnet_id = "subnet-e45d30bf"
  }

  subnet_mapping {
    subnet_id = "subnet-29d0a404"
  }

  subnet_mapping {
    subnet_id = "subnet-893a1fc0"
  }

  subnets = ["subnet-e45d30bf", "subnet-0518a439", "subnet-af1f38a3", "subnet-893a1fc0", "subnet-29d0a404"]
}

resource "aws_lb" "arn_aws_elasticloadbalancing_us_east_1_484375727565_loadbalancer_net_selenium_hub_elb_7308aef84138b0d6" {
  tags = {
    Billing        = "Crawler"
    Billing-Detail = "Crawler-Selenium"
    ServiceName    = "selenium-hub"
  }

  tags_all = {
    Billing        = "Crawler"
    Billing-Detail = "Crawler-Selenium"
    ServiceName    = "selenium-hub"
  }

  access_logs {
    bucket = ""
  }

  internal           = true
  ip_address_type    = "ipv4"
  load_balancer_type = "network"
  name               = "selenium-hub-elb"
  subnet_mapping {
    subnet_id = "subnet-c903a182"
  }

  subnet_mapping {
    subnet_id = "subnet-878bbd8b"
  }

  subnet_mapping {
    subnet_id = "subnet-5496757b"
  }

  subnet_mapping {
    subnet_id = "subnet-5c8d6901"
  }

  subnet_mapping {
    subnet_id = "subnet-5fef4b60"
  }

  subnets = ["subnet-5496757b", "subnet-c903a182", "subnet-5fef4b60", "subnet-878bbd8b", "subnet-5c8d6901"]
}

resource "aws_lb" "bert_inference_internal" {
  tags = {
    Billing        = "data"
    Billing-Detail = "bert_nlp"
    Description    = "Application Load Balancer for Bert NLP"
    ManagedBy      = "Terraform"
    Name           = "bert_inference_internal"
  }

  tags_all = {
    Billing        = "data"
    Billing-Detail = "bert_nlp"
    Description    = "Application Load Balancer for Bert NLP"
    ManagedBy      = "Terraform"
    Name           = "bert_inference_internal"
  }

  access_logs {
    bucket  = "airpr-elb-accesslogs"
    enabled = true
    prefix  = "bert-inference-internal"
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_deletion_protection       = true
  enable_http2                     = true
  idle_timeout                     = 3600
  internal                         = true
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "bert-inference-internal"
  security_groups                  = ["sg-0204f0bfde482f49c"]
  subnet_mapping {
    subnet_id = "subnet-af1f38a3"
  }

  subnet_mapping {
    subnet_id = "subnet-514c3d34"
  }

  subnet_mapping {
    subnet_id = "subnet-e45d30bf"
  }

  subnet_mapping {
    subnet_id = "subnet-29d0a404"
  }

  subnet_mapping {
    subnet_id = "subnet-893a1fc0"
  }

  subnets = ["subnet-514c3d34", "subnet-e45d30bf", "subnet-af1f38a3", "subnet-893a1fc0", "subnet-29d0a404"]
}

resource "aws_lb" "visitorestimation_prod_2" {
  tags = {
    Billing                             = "Analyst"
    Billing-Detail                      = "Analyst-VisitorEstimation"
    Name                                = "visitorEstimation-prod-2"
    "elasticbeanstalk:environment-id"   = "e-t4hw5gcuek"
    "elasticbeanstalk:environment-name" = "visitorEstimation-prod-2"
  }

  tags_all = {
    Billing                             = "Analyst"
    Billing-Detail                      = "Analyst-VisitorEstimation"
    Name                                = "visitorEstimation-prod-2"
    "elasticbeanstalk:environment-id"   = "e-t4hw5gcuek"
    "elasticbeanstalk:environment-name" = "visitorEstimation-prod-2"
  }

  access_logs {
    bucket = ""
  }

  desync_mitigation_mode           = "defensive"
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  ip_address_type                  = "ipv4"
  load_balancer_type               = "application"
  name                             = "awseb-e-t-AWSEBLoa-1NBQQIYDFQ9FU"
  security_groups                  = ["sg-0bb2ddb3bc1e972ad"]
  subnet_mapping {
    subnet_id = "subnet-40072209"
  }

  subnet_mapping {
    subnet_id = "subnet-ab5f32f0"
  }

  subnet_mapping {
    subnet_id = "subnet-78d2a655"
  }

  subnets = ["subnet-ab5f32f0", "subnet-78d2a655", "subnet-40072209"]
}

