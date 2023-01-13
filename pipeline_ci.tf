variable "pipeline_name" {
  type = string
  default = "CI Pipeline"
}

variable "pipeline_id" {
  type = string
  default = "ci_pipeline"
}


resource "harness_platform_pipeline" "ci_pipeline" {  
    identifier  = var.pipeline_id
    name        = var.pipeline_name
    description = "Simple Approval Stage pipeline generated through Terraform"  
    project_id  = var.project
    org_id      = var.org 
  
    yaml        = <<PIPETEXT
pipeline:
  name: ${var.pipeline_name}
  identifier: ${var.pipeline_id}
  projectIdentifier: ${var.project}
  orgIdentifier: ${var.org}
  tags: {}
  properties:
    ci:
      codebase:
        connectorRef: ${var.pipeline_git_connector}
        build: <+input>
  stages:
    - stage:
        name: Build
        identifier: Build
        description: ""
        type: CI
        spec:
          cloneCodebase: true
          platform:
            os: Linux
            arch: Amd64
          runtime:
            type: Cloud
            spec: {}
          execution:
            steps:
              - step:
                  type: Run
                  name: Directory Contents
                  identifier: Directory_Contents
                  spec:
                    shell: Sh
                    command: ls -l
              - step:
                  type: Run
                  name: Build
                  identifier: Build
                  spec:
                    shell: Sh
                    command: mvn clean package -DskipTests
PIPETEXT  
}
