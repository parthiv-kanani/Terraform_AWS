variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "ZONE2" {
  default = "us-east-1b"
}

variable "ZONE3" {
  default = "us-east-1c"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-06c68f701d8090592"
    us-east-2 = "ami-08be1e3e6c338b037"
  }
}

variable "USER" {
  default = "ec2-user"
}

variable "PUB_KEY" {
  default = "thekey.pub"
}

variable "PRIV_KEY" {
  default = "thekey"
}

variable "MYIP" {
  default = "24.185.148.25/32"
}

variable "TYPE" {
  default = "t2.micro"
}