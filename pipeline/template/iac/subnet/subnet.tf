resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24" # 根据你的需求选择合适的CIDR块
  availability_zone       = "us-east-2a"   # 根据你的需求选择合适的可用区
  map_public_ip_on_launch = true            # 设置为 true 表示子网中的实例将自动分配公共 IP 地址

  tags = {
    Name = "my-subnet"
    NickName = "spider"
  }
}