resource "aws_security_group" "node_group_one" {
  name_prefix = "node_group_one"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.0.0/8",
    ]
  }

  ingress {
    from_port        = 80
    to_port          = 30000
    protocol         = "tcp"
    
    cidr_blocks = [
      "10.0.0.0/8",
    ]
  }

  tags = var.my_tags
}
