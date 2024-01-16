provider  "aws" {
    region = "us-east-1"
}

resource "aws_instance" "dev-project" {
    ami = "ami-0005e0cfe09cc9050"
    instance type = "t2.micro"
    key_name = "dev"
    security_group = ["dev-project-sg"]
}

resource "aws-security_group" "dev-project-sg" {
    name = "demo-project-sg"
    description = "SSH Access"
{

}

ingress {
    description   = "SSh access"
    from_port     = 22
    to_port       = 22
    protocol      = "tcp"
    cidr_blocks   = ["0.0.0.0/0"]
}

egress {
    from_port    = 0
    to_port      = 0
    protocol     = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
}

tags = {
    name = "SSH-port"
}
}