resource "aws_security_group" "happy-jenkins-sg" {
    name = "happy-jenkins-sg"
    description = "Allow 22, 8080"

    ingress {
        description = "Allow incoming traffic on port 80"
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Allow incoming traffic on port 22"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags {
        name = "happy-jenkins-sg"
    }
}

resource "aws_network_interface_sg_attachment" "happy-jenkins-sg-attachment" {
    security_group_id = aws_security_group.happy-jenkins-sg.id
    network_interface_id =  aws_instance.happy-jenkins.primary_network_interface_id
}