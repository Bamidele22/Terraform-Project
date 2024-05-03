resource "aws_key_pair" "neutron-key" {
  #The keyname specified is abstract.
  key_name = "neutronkey"
  public_key = file(var.PUB_KEY)
}

resource "aws_instance" "neutron-neutron" {
  ami           = var.AMIS[var.REGION] # us-west-2
  instance_type = "t2.micro"
  subnet_id = aws_subnet.neutron-pub-1
  key_name = aws_key_pair.neutron-key.key_name
  vpc_security_group_ids = [aws_security_group.neutron_stack-SG.id]

  tags = {
    Name = "my-neuton"
  }
}

resource "aws_ebs_volume" "vol_4_neutron" {
  availability_zone = var.ZONE1
  size = 3
  tags = {
    Name = "extra-vol-4-neutron"
  }
}


resource "aws_volume_attachment" "atch_vol_neutron" {
    #xvdh/sdh
    device_name = "/dev/sdh"
    volume_id   = aws_ebs_volume.vol_4_neutron.id
    instance_id = aws_instance.neutron-neutron.id
  
}

output "PublicIP" {
  value = aws_instance.neutron-neutron.public_ip
}