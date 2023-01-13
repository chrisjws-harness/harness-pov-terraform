resource "harness_platform_organization" "org" {
    name      = "Engineering Sandbox"
    identifier = var.org 
    description = "Managed with Terraform"
}
