```
eksctl create cluster --name getting-started-eks \
--region us-east-2 \
--version 1.17 \
--managed \
--node-type t2.small \
--nodes 1 \
--node-volume-size 200 \
--ssh-access \
--ssh-public-key=Wahaj-ohio 
```