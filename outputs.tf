output "ip" {
    value = "${aws_instance.fibonacci.public_ip}"
}

output "service_endpoint" {
    value = "http://${aws_instance.fibonacci.public_ip}/api"
}
