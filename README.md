# Windows_Based_beanstalk_deployment


Prereuisite plugins:    AWS Credentials
                        Status view

To have local pc to secret manager interaction:

1) Create IAM with # secretsmanager:GetSecretValue

Then, add them to # AWS Credentials, then use them in script to gather main secret keys

# Note: echo for secret keys should not be used in groovy scripts

