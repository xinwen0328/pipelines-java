variable "vpc_id" {
  description = "the ID fo my VPC"
  type        = string
}

variable "mytag1" {
  description = "My Tag #1"
  type        = string
  default     = var.mytag1_root
}