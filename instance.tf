resource "aws_key_pair" "the-key" {
  key_name   = "thekey"
  public_key = file("thekey.pub")
}

resource "aws_instance" "the-instance" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = var.TYPE
  subnet_id              = aws_subnet.the-pub-1.id
  key_name               = aws_key_pair.the-key.key_name
  vpc_security_group_ids = [aws_security_group.the_stack-sg.id]
  tags = {
    Name = "The_instace"
  }
}

resource "aws_ebs_volume" "vol_4_the" {
  availability_zone = var.ZONE1
  size              = 3

  tags = {
    Name = "extra_vol_4_the"
  }
}

resource "aws_volume_attachment" "atch_vol_dove" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.vol_4_the.id
  instance_id = aws_instance.the-instance.id
}

output "PublicIP" {
  value = aws_instance.the-instance.public_ip
}