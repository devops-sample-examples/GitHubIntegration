#!/bin/bash

#Author : Swathi
#Date : 23-02-2025
#Version : v1
#This script will report the AWS resource usage

set +x

#list s3 buckets
aws s3 ls

#list EC2 instances
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

#list lambda functions
aws lambda list-functions

#list IAM users
aws iam list-users

