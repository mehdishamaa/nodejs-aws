# Get /posts working using 2 AMIs
## Our task was to have /posts running successfully. To do this, I provisioned 2 AMIs and ran the database on one of them.


# Steps:

1) Firstly, create a new AMI for your db.
2) Ensure to add the following ports to your db machine, on seperate rows: 3000, 8080, 1024-65535
3) Sync your files from your os to your db AMI using the following command: `scp -i ~/.ssh/DevOpsStudents.pem -r ~/Users/medimidi/Desktop/nodejs-aws/environment/db ubuntu@ec2-34-243-23-72.eu-west-1.compute.amazonaws.com:/home/ubuntu/`


