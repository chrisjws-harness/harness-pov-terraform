resource "harness_platform_secret_text" "textsecret" {  
    identifier  = "example_secret"  
    name        = "example_secret"  
    description = "This is a text Secret, generated through Terraform"  
    org_id      = var.org  
    project_id  = var.project  
    tags        = ["example:tags"]  
  
    secret_manager_identifier = "harnessSecretManager"  
    value_type                = "Inline"  
    value                     = "secret"  
    lifecycle {  
        ignore_changes = [  
            value,  
        ]  
    }  
}
