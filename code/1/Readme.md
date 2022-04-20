I will be desiging the infrastuture with one VPC with 4 subnets with combination of private and public for various layers. In addition to that there will be a bastion host and a NAT gateway for the admins to have access to the infrastructure. I am also going to create a Auto scaling group across two availbality zones for fault tolerance and high availablity (Real SLA of 99.99%). Below is the proposed architecture in the intrest of time, I have borrowed it from this [link](https://medium.com/the-andela-way/designing-a-three-tier-architecture-in-aws-e5c24671f124)

![](arch_proposed.jpeg)

  
  
  
 1. VPC
 2. Internet gateway
 3. 4 Subnets (2 public and 2 private in 2 AZ's)
 4. Create two Route tables (public for internet and private for the traffic through NAT Gateway)
 5. Create NAT Gateway
 6.  ELB (Internet and the Internal Load balancer)
 7. Auto Scaling group
 8. Bastion Host
