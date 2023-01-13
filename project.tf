resource "harness_platform_project" "project" {  
    name      = "Sample Build Pipeline"  
    identifier = var.project 
    org_id    = var.org 
}
