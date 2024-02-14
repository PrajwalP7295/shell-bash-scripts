# Write a bash script which gives multiple options related to AWS resources like listing down unused resources(LBs, Volumes, EIP, Target Groups, etc), running instances with their info, etc



#!/bin/bash

aws configure set aws_access_key_id "<your_aws_acc_key_id>"
aws configure set aws_secret_access_key "<your_aws_sec_acc_key_id>"
aws configure set default.region "<region_of_your_resources>"

function list_unused_resources() {
  echo "Listing unused resources :- "
  echo ""

  echo "Unused load balancers:"
  aws elbv2 describe-load-balancers --query 'LoadBalancers[?!Instances].LoadBalancerArn' --output text

  echo ""
  echo "Unused volumes:"
  aws ec2 describe-volumes --filters Name=status,Values=available --query 'Volumes[*].[VolumeId, VolumeType, State, Size, AvailabilityZone]' --output table

  echo ""
  echo "Unused EIPs:"
  aws ec2 describe-addresses --filters Name=association-id,Values=none --query 'Addresses[*].[PublicIp,InstanceId,AllocationId]' --output table

  echo ""
  echo "Unused target groups:"
  aws elbv2 describe-target-groups --query 'TargetGroups[?!TargetGroupArn]' --output text

  echo ""
}

function running_instances() {
  echo "Displaying running instances :-"
  echo ""

  aws ec2 describe-instances --filters Name=instance-state-name,Values=running --query 'Reservations[*].Instances[*].[InstanceId, InstanceType, PublicIpAddress, LaunchTime]' --output table

  echo ""
}

echo "Select an option:"
echo "1. List unused resources"
echo "2. Display running instances"
read option

case $option in
  1)
    list_unused_resources
    ;;
  2)
    running_instances
    ;;
  *)
    echo "Invalid option selected. Please choose from given options."
    ;;
esac




# Output : 

# [prajwal@prajwal a6]$ ./a10aws.sh

# Select an option:
# 1. List unused resources
# 2. Display running instances

# 2

# Displaying running instances :-

# ---------------------------------------------------------------------------------
# |                               DescribeInstances                               |
# +----------------------+-----------+---------------+----------------------------+
# |  i-02a83cbef9955743a |  t2.micro |  3.86.187.117 |  2023-04-27T08:05:56.000Z  |
# +----------------------+-----------+---------------+----------------------------+

# [prajwal@prajwal a6]$ ./a10aws.sh

# Select an option:
# 1. List unused resources
# 2. Display running instances

# 1

# Listing unused resources :-

# Unused load balancers:

# Unused volumes:
# ------------------------------------------------------------------
# |                         DescribeVolumes                        |
# +------------------------+------+------------+----+--------------+
# |  vol-0593c17744d54272a |  gp2 |  available |  2 |  us-east-1a  |
# +------------------------+------+------------+----+--------------+

# Unused EIPs:

# Unused target groups:
