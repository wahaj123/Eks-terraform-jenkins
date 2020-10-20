aws eks create-nodegroup \
--cluster-name getting-started-eks \
--nodegroup-name test \
--node-role $role_arn \
--subnets subnet-0295c94fc12df711b \
--disk-size 200 \
--scaling-config minSize=1,maxSize=2,desiredSize=1 \
--instance-types t2.small



aws eks create-cluster \
--name getting-started-eks \
--role-arn $role_arn \
--resources-vpc-config subnetIds=subnet-05f98ab49c6a2b263,subnet-03589b5b07e5c3aa2,subnet-0576e2ff4154ced36,subnet-0295c94fc12df711b,securityGroupIds=sg-0b1e21e93d4fa4595,endpointPublicAccess=true,endpointPrivateAccess=false

eksctl create cluster --name getting-started-eks \
--region us-east-2 \
--version 1.17 \
--managed \
--node-type t2.small \
--nodes 1 \
--node-volume-size 200 \
--ssh-access \
--ssh-public-key=Wahaj-ohio \