resource "aws_security_group" "publico" {
  name = "${var.prefix}-publico-nginx"
  description = "Security group publico para ${var.prefix}"
  vpc_id = var.vpc_id

  // SSH
  ingress {
    description = "SSH"
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["10.0.254.0/28"]
  }

  // HTTP
  ingress {
    description = "HTTP"
    from_port = 80
    protocol = "TCP"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  // HTTPS
  ingress {
    description = "HTTPS"
    from_port = 443
    protocol = "TCP"
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = merge(
{
    Name = "${var.prefix}-publico"
  },
  var.tags
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "nginx" {
  ami = var.ami
  instance_type = "t2.micro"
  subnet_id = var.subnet_id
  associate_public_ip_address = true
  key_name = "heltas-workshop-2022"
  vpc_security_group_ids = [
    aws_security_group.publico.id
  ]
  
  tags = merge(
{
    Name = "${var.prefix}-nginx-"
  },
  var.tags
  )

  depends_on = [ aws_security_group.publico]
}