terraform {
  backend "s3" {
    bucket = "jofin-terraform-statefile"
    key    = "server_name/statefile"
    region = "ap-south-1"
  }
}
