#! /bin/bash
FILENAME=$1
echo "Pushing ${FILENAME} to s3"
aws s3 cp $FILENAME s3://mdalzell --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers
