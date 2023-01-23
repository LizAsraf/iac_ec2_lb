# AWS Infrastructure Using Terraform
This repository contains the Terraform code creates an AWS infrastructure with load balancer.

## Providers

- `aws` version `4.32.0`

## Modules

This IaC utilizes the following modules:
- `compute`: This module installs the ec2.
- `security`: This module creates the security group with the rout tables.
- `network`: This module installs the subnetworks and vpc. 
- `load_balancing`: This module creates a application load balancer if required.

## Prerequisites
- Terraform >= 0.14 
- A AWS Cloud Platform account.

## Usage

1. Clone the repository 
'''
    $ git clone git@github.com:LizAsraf/iac_ec2_lb.git
'''
2. Navigate to the cloned repository
'''
    $ cd iac_ec2_lb
'''
3. Create a file named `terraform.tfvars` and fill in the necessary variables. An example is provided in the `variables.tf` file.
- Set the values for the following variables in your `terraform.tfvars` file:
  - `enviroment`
  - `region`
  - `instance_type`
  - `instances_per_subnet`
  - `public_subnets_per_vpc`
  - `vpc_cidr`
  - `vpc_enable_nat_gateway`
  - `tags`
  - `volume_tags`
  - `ami`
  - `keyname`
4. Run `terraform init` to download the required providers
5. Run `terraform plan` to see the resources that will be created
6. Run `terraform apply` to create the resources

## File Structure

- `main.tf`: the main Terraform configuration file that calls the modules and sets the necessary variables
- `modules/`: a directory containing all the modules used in the configuration
- `variables.tf`:  Terraform variables file
- `terraform.tfvars` : Terraform variables values

## Note

- The code was last tested with Terraform version `0.14`
- This repository is for demonstration purposes and may not be suitable for production use without further modification.

## Additional Resources
- [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS](https://aws.amazon.com/documentation-overview/)