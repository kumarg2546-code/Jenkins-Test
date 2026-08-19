
resource "aws_instance" "ec2" {

  count = length(var.subnets)


  ami = data.aws_ami.ubuntu.id


  instance_type = var.instance_type


  subnet_id = var.subnets[count.index]


  vpc_security_group_ids = [var.sg_id]


  associate_public_ip_address = true
  
  key_name = "Demo-Test"

  user_data = file("${path.module}/jenkins.sh")


  tags = {

    Name = "jenkins-${count.index}"

  }

}