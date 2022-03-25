## Programmatic authentication

To use the AWS cli, you need authentication with MFA:
```
terraform get
```
Set the `aws_access_key_id` `aws_secret_access_key` `aws_session_token` in .aws/credentials for the default scope

If everything is good, then this should give you information about your user:

```
aws iam get-user
```
 More info here https://aws.amazon.com/de/premiumsupport/knowledge-center/authenticate-mfa-cli/

## Cluster creation

To create the cluster:
```
eksctl create cluster -f .\eks-us-east-1-team-y.yaml
```

To delete the cluster:
```
eksctl delete cluster --region=us-east-1 --name=eks-us-east-1-team-y
```
