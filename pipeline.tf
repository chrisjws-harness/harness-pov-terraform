resource "harness_platform_pipeline" "approval_pipeline" {  
    identifier  = "approval_pipeline"  
    name        = "Approval Pipeline"  
    description = "Simple Approval Stage pipeline generated through Terraform"  
    project_id  = var.project
    org_id      = var.org 
  
    yaml        = <<PIPETEXT
pipeline:
  name: Approval Pipeline 
  identifier: approval_pipeline
  projectIdentifier: ${var.project}
  orgIdentifier: ${var.org} 
  tags: {}
  stages:
    - stage:
        name: Test
        identifier: Test
        description: ""
        type: Approval
        spec:
          execution:
            steps:
              - step:
                  name: Test
                  identifier: Test
                  type: HarnessApproval
                  timeout: 1d
                  spec:
                    approvalMessage: |-
                      Please review the following information
                      and approve the pipeline progression
                    includePipelineExecutionHistory: true
                    approvers:
                      minimumCount: 1
                      disallowPipelineExecutor: false
                      userGroups:
                        - account._account_all_users
                    approverInputs: []
        tags: {}

PIPETEXT  
}
