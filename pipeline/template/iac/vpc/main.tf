resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16" # 根据你的需求选择合适的CIDR块

  tags = {
    Name = "my-vpc"
    NickName = "我的牛13虚拟网络"
  }
}