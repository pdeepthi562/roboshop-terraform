vpc = {
  main = {
    cidr = "10.0.0.0/16"
    subnets = {
      public = {
        public1 = { cidr = "10.0.0.0/24", az = "us-east-1a" }
        public2 = { cidr = "10.0.1.0/24", az = "us-east-1b" }
      }
      app = {
        app1 = { cidr = "10.0.2.0/24", az = "us-east-1a" }
        app2 = { cidr = "10.0.3.0/24", az = "us-east-1b" }
      }
      db = {
        db1 = { cidr = "10.0.6.0/24", az = "us-east-1a" }
        db2 = { cidr = "10.0.7.0/24", az = "us-east-1b" }
      }
    }
  }
}
default_vpc_id = "vpc-0ea00bb90d84e71e1"
default_vpc_cidr = "172.31.0.0/16"
default_vpc_route_table_id = "rtb-0dc27a26c8b542a80"

tags = {
  company_name = "ABC Tech"
  business_unit = "Ecommcerce"
  project_name = "roboshop"
  cost_center = "ecom_rs"
  created_by = "terraform"

}

env = "dev"

alb = {
  public = {
    internal = false
    lb_type = "application"
    sg_ingress_cidr = ["0.0.0.0/0"]
    sg_port = 80
  }

private = {
  internal = true
  lb_type = "application"
  sg_ingress_cidr = ["172.31.0.0/16", "10.0.0.0/16"]
  sg_port = 80
}
}

docdb = {
  main = {
    backup_retention_period = 5
    preferred_backup_window = "07:00-09:00"
    skip_final_snapshot     = true
    engine_version = "4.0.0"
    engine_family = "docdb4.0"
    instance_count = 1
    instance_class = "db.t3.medium"
  }
}