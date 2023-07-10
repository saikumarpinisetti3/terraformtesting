resource "aws_instance" "devops" {
  ami = var.ami_image
  instance_type = var.instance_type
}
