data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"]  # Ubuntu account ID

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-20.04-amd64-server-*"]
  }

  # Uncomment this filter if needed later
  # filter {
  #   name   = "virtualization-type"
  #   values = ["hvm"]
  # }
}

resource "aws_instance" "dev_machine" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = "jomin-key-pair"

  tags = {
    Environment = "dev"
    Name        = "${var.name}-server"
  }
}
