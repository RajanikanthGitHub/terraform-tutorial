module "mymodule" {
  source = "./modules/vpc_moudle"
}

module "compute" {
  source = "./modules/compute"
  
}

