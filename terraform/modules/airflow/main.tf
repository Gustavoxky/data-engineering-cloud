resource "aws_ecs_cluster" "airflow_cluster" {
  name = var.cluster_name
}

resource "aws_ecs_task_definition" "airflow_task" {
  family                   = "${var.cluster_name}_airflow"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "512"
  memory                   = "1024"

  container_definitions = jsonencode([{
    name      = "airflow-webserver"
    image     = var.airflow_image
    cpu       = 256
    memory    = 512
    essential = true
    portMappings = [{
      containerPort = 8080
      hostPort      = 8080
    }]
    }, {
    name      = "airflow-scheduler"
    image     = var.airflow_image
    cpu       = 256
    memory    = 512
    essential = true
  }])
}

resource "aws_ecs_service" "airflow_service" {
  name            = "airflow-service"
  cluster         = aws_ecs_cluster.airflow_cluster.id
  task_definition = aws_ecs_task_definition.airflow_task.arn
  desired_count   = 1

  network_configuration {
    subnets          = var.subnets
    security_groups  = var.security_groups
    assign_public_ip = true
  }
}
