data "aws_iam_role" "role" {
  name = "ecr_role"
}
/* data "aws_iam_instance_profile" "profile" {
  name = "liz_profile"
} */
resource "aws_iam_instance_profile" "profile" {
  name = "liz_profile"
  role = data.aws_iam_role.role.name
}
resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  count = length(var.subnet) * var.instances_per_subnet
  iam_instance_profile = aws_iam_instance_profile.profile.name
  subnet_id      = element(var.subnet, count.index)
  user_data = file("first_deployment.sh")
  user_data_replace_on_change = "true"
  key_name = var.keyname
  security_groups =  [var.security_groups]
  tags = merge(
    var.tags,
    {
      Name = "instance_${var.enviroment}_${count.index+1}_${terraform.workspace}"
    },
  )
  volume_tags = merge(
    var.volume_tags,
    {
      Name = "instance_${var.enviroment}_${count.index+1}_${terraform.workspace}"
    },
  )
}

resource "null_resource" "first_deployment" {
  provisioner "local-exec" {
    command = "${path.module}/first_deployment.sh"
  }
  depends_on = [aws_instance.ec2]
}

