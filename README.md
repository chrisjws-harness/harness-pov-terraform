# harness-pov-terraform  

  
### Configure
1. `mv harness.tf local-harness.tf`
2. Add values for `account_id` and `account_id` in `local-harness.tf`
3. Modify git connector value in `vars.tf`

### Run
1. `terraform init`
2. `terraform apply -auto-appove`
