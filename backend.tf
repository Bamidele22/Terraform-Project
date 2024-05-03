terraform {
  backend "s3" {
    bucket = "XXXXXXXXXXXXXXXXXXXXXXXXXXX"
    key    = "terraform.tfstate"
    region = "us-east-1"    
  }
}