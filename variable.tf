variable "REGION" {

  default = "us-east-2"
}

variable "ZONE1" {
  default = "us-east-2a"
}

variable "ZONE2" {
  default = "us-east-2b"
}

#This IP specified here is for test, you'll modify it when you deploy your solution.
variable "MYIP" {
  default = "192.168.1.1/32"
}

variable "ZONE3" {
  default = "us-east-2c"
}

variable "AMIS" {
  type = map(any)

  default = {
    us-east-2 = "ami-0b898040803850657"
    us-east-1 = "ami-0fc61db8544a617ed"

  }
}

variable "USER" {
  default = "ec2-user"
}

variable "PUB_KEY" {
  default = ""
}

variable "PRI_KEY" {
  default = ""
}