resource "aws_instance" "happy-jenkins" {
    ami = var.image_id
    instance_type = var.type_instance
    key_name = "datascientest_keypair_morris"
    availability_zone = var.availability_zone[0]

    tags {
        name = "happy jenkins"
    }
}
