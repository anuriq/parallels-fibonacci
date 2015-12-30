provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.region}"
}

resource "aws_security_group" "fibonacci_service" {
  name        = "fibonacci_service_acl"
  description = "Used in Fibonacci service"

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "auth" {
  key_name   = "fibonacci-key"
  public_key = "${file(var.public_key_path)}"
}

resource "aws_instance" "fibonacci" {
  connection {
    user = "ubuntu"
    private_key = "${file(var.private_key_path)}"
  }
  key_name = "${aws_key_pair.auth.id}"

  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"

  vpc_security_group_ids = ["${aws_security_group.fibonacci_service.id}"]

  provisioner "remote-exec" {
    scripts = [
      "00_prepare_server.sh",
      "10_install_parallels_fibonacci.sh"
    ]
  }
}
