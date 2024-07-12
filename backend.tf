terraform {
  backend "s3" {
    bucket = "the-bucket18"
    key    = "terraform/backend_exe6"
    region = "us-east-1"
  }
}