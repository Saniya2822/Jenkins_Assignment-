terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.40.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDQzL4Q9Ih4/fljc2ATSeJjjB1w+W69RTtXRqcvd4m/ZoEwk0j40QKCUCjx3CDH81xr2BbHVH/l3DwlRCSLK1lBAFaTWmcYXwsnZsjcZ4/WovEsP+Tdnu8LSN5VHgzvoeutGz0p8+vDWkzS1zCVDAn+mMTu9zAntWZwTKIzRvneldz2u6BjtKNS989CoVn82RvhemXzG6h/a+G3ykDHLbqlaCufu5NgfIow1YoZJF/njHuMfXw6zxRjTgGwkU1y5nVmzRz7XxoTHdoL6iKbOb0rLHJNoYCQzckxi5ROxS/y9Fi+FlThp4Se49AJWw1jjkId8FSzywrw0G9kF/Js3a5Ofr3XXY98HsCc+F+d2iF6PfR/IfweufVOYs35SVYARcz3Kp4egQSDDA+EQWlK6JlEPCag9KnKXvP8mS/I5jS0jYMV7cNf1SeZWEGJaLiXIbOiP+6jLon3dAh27LZuECbdge9L6BmnICiltOgrBxuWkcZiC4SqlDLWmRcrUItEUUs="
}

resource "aws_instance" "this" {
  ami                     = "ami-05295b6e6c790593e"
  instance_type           = "t2.micro"
  key_name = aws_key_pair.deployer.key_name
}