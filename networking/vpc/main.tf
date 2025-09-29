terraform {
  required_providers {
    aws = { source = "hashicorp/aws" }
  }
}
variable "name" {}
variable "cidr_block" { default = "10.0.0.0/16" }
variable "tags" { type = map(string) default = {} }

resource "aws_vpc" "this" {
  cidr_block = var.cidr_block
  tags = merge(var.tags, { Name = var.name })
}

output "vpc_id" { value = aws_vpc.this.id }
