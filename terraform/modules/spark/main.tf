resource "aws_emr_cluster" "spark_cluster" {
  name          = var.cluster_name
  release_label = "emr-6.5.0"
  applications  = ["Spark"]

  service_role = aws_iam_role.emr_service_role.arn

  ec2_attributes {
    key_name         = var.key_name
    subnet_id        = var.subnet_id
    instance_profile = aws_iam_instance_profile.emr_instance_profile.arn
  }

  master_instance_group {
    instance_type  = var.master_instance_type
    instance_count = 1
  }

  core_instance_group {
    instance_type  = var.core_instance_type
    instance_count = var.core_instance_count
  }

  configurations_json = file("${path.module}/spark-config.json")
}

resource "aws_iam_role" "emr_service_role" {
  name = "${var.cluster_name}_service_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole",
      Effect    = "Allow",
      Principal = { Service = "elasticmapreduce.amazonaws.com" }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "emr_service_role_policy" {
  role       = aws_iam_role.emr_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonElasticMapReduceRole"
}

resource "aws_iam_role" "emr_job_flow_role" {
  name = "${var.cluster_name}_job_flow_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole",
      Effect    = "Allow",
      Principal = { Service = "ec2.amazonaws.com" }
    }]
  })
}

resource "aws_iam_instance_profile" "emr_instance_profile" {
  name = "${var.cluster_name}_instance_profile"
  role = aws_iam_role.emr_job_flow_role.name
}
