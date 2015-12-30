variable "access_key" {}
variable "secret_key" {}
variable "region" {
    default = "eu-central-1"
}
variable "amis" {
    default = {
        eu-central-1 = "ami-accff2b1"
    }
}
variable "public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}
variable "private_key_path" {
  default = "~/.ssh/id_rsa"
}
