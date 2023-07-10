module "aws_vpc" {

    source = "./modules/aws_vpc"
    vpc_cidr_block = var.vpc_cidr_range
    tags = var.tags
    vpc_id= aws_vpc.vpc_id
}

module "aws_public_subnet1" {
    source= "./modules/aws_subnet"
     vpc_id     = module.aws_vpc.vpc_id
     subnet_cidr_block = var.public_subnet1_cidr
     availability_zone = var.public_subnet1_availability_zone
    tags= var.tags
}



module "aws_public_subnet2"{

    source = "./modules/aws_subnet"
    vpc_id = module.aws_vpc.vpc_id
    subnet_cidr_block= var.public_subnet2_cidr
    availability_zone= var.public_subnet2_availability_zone
    tags= var.tags
}

module "aws_private_subnet1"{

    source = "./modules/aws_subnet"
    vpc_id = module.aws_vpc.vpc_id
    subnet_cidr_block= var.private_subnet1_cidr
    availability_zone= var.private_subnet1_availability_zone
    tags= var.tags
}


module "aws_private_subnet2"{

    source = "./modules/aws_subnet"
    vpc_id = module.aws_vpc.vpc_id
    subnet_cidr_block= var.private_subnet2_cidr
    availability_zone= var.private_subnet2_availability_zone
    tags= var.tags
}

module "internet_gateway" {
    
    source= "./modules/aws_igw"
    vpc_id= module.aws_vpc.vpc_id
}

module "public_RT" {
    
    source = "./modules/aws_route_table"
    vpc_id = module.aws_vpc.vpc_id
    gateway_id = module.internet_gateway.igw_id
}

module "public_subnet1_RT_association"{
    source= "./modules/aws_rt_association"
    subnet_id= module.aws_public_subnet1.subnet_id
    route_table_id = module.public_RT.route_table_id

}

module "eip1"{
    source= "./modules/aws_eip"
}

module "eip2" {
  source = "./modules/aws_eip"
}

module "natgw1"{
    source = "./modules/aws_natgw"
    eip_id=module.eip1.eip_id
    subnet_id = module.aws_public_subnet1.subnet_id
}
module "natgw2"{
    source="./modules/aws_natgw"
    eip_id = module.eip2.eip_id
    subnet_id= module.aws_public_subnet2.subnet_id
}

module "private_RT1"{
    source= "./modules/aws_route_table"
    vpc_id= module.aws_vpc.vpc_id
    gateway_id = module.natgw1.natw_id
}

module "private_RT2" {
    source = "./modules/aws_route_table"
    vpc_id= module.aws_vpc.vpc_id
    gateway_id = module.natgw2.natw_id
  
}

module "privatesubnet1_RT_association"{
    source= "./modules/aws_rt_association"
    subnet_id = module.aws_private_subnet1.subnet_id
    route_table_id = module.private_RT1.route_table_id
}
module "privatesubnet2_RT_association"{
    source= "./modules/aws_rt_association"
    subnet_id = module.aws_private_subnet2.subnet_id
    route_table_id = module.private_RT2.route_table_id
}


module "instance1" {

    source =  "./modules/aws_ec2"

    ami_image      =  var.ami_image1
    instance_type   = var.instance_type1
}

module "instance2" {

    source =  "./modules/aws_ec2"

    ami_image      =  var.ami_image2
    instance_type   = var.instance_type2
   
}

module "s3_bucket1" {
  
  source = "./modules/aws_s3"

  bucket_name = var.bucket_name1
  tags        = {

    "name" = "s3_1"
  }
}

module "s3_bucket2" {
  source = "./modules/aws_s3"

  bucket_name = var.bucket_name2
  tags    = {

    "name" = "s3_2"
  }
}
