

vpc_cidr_range= "192.168.0.0/16"

public_subnet1_cidr= "192.168.0.0/24"
public_subnet1_availability_zone= "ap-south-1a"
public_subnet1_tags={
    Name= "public_sunet1"
    Environment= "Dev"
}


public_subnet2_cidr= "192.168.1.0/24"
public_subnet2_availability_zone= "ap-south-1a"
public_subnet2_tags={
    Name= "public_sunet2"
    Environment= "Dev"
}


private_subnet1_cidr= "192.168.2.0/24"
private_subnet1_availability_zone= "ap-south-1a"
private_subnet1_tags={
    Name= "private_sunet1"
    Environment= "Dev"
}

private_subnet2_cidr= "192.168.3.0/24"
private_subnet2_availability_zone= "ap-south-1b"
private_subnet2_tags={
    Name= "private_sunet2"
    Environment= "Dev"
}


ami_image1     = "ami-0574da719dca65348"
instance_type1 = "t2.micro"

ami_image2     = "ami-0574da719dca65348"
instance_type2 = "t2.micro"


bucket_name1 = "devops-terra-1"
bucket_name2 = "devops-terra-2"

