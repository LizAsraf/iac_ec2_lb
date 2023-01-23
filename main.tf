module "network" {
  source                 = "./modules/network"
  public_subnets_per_vpc = var.public_subnets_per_vpc
  enviroment             = var.enviroment
  tags = var.tags
}

module "security" {
  source = "./modules/security"
  depends_on = [module.network]
  vpcid      = module.network.vpcid
  enviroment = var.enviroment
  vpcname    = module.network.vpcname
  tags = var.tags
}

module "compute" {
  source = "./modules/compute"
  security_groups = module.security.security_groups
  subnet = module.network.subnet
  enviroment = var.enviroment
  instances_per_subnet = var.instances_per_subnet
  ami           = var.ami
  tags = var.tags
  volume_tags = var.volume_tags
}

module "load_balancing" {
  count = length(module.network.subnet) > 1 ? 1:0
  source = "./modules/load_balancing"
  vpcid = module.network.vpcid
  vpcname = module.network.vpcname
  instances_ids = module.compute.instance_id
  security_groups = module.security.security_groups
  subnet = module.network.subnet
  tags = var.tags

}
