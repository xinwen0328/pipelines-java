resource "aws_subnet" "my_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr_block # 根据你的需求选择合适的CIDR块
  availability_zone       = "us-east-2a"   # 根据你的需求选择合适的可用区
  map_public_ip_on_launch = true            # 设置为 true 表示子网中的实例将自动分配公共 IP 地址

  tags = {
    Name = var.subnet_name
    NickName = var.stage
  }
}