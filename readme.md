# Get /posts working using 2 AMIs
## Our task was to have /posts running successfully. To do this, I provisioned 2 AMIs and ran the database on one of them.


# Steps:

1) Firstly, create a new AMI for your db.
2) Ensure to add the following ports to your db machine, on seperate rows: 3000, 8080, 1024-65535
3) Sync your files from your os to your db AMI using the following command: `scp -i ~/.ssh/DevOpsStudents.pem -r ~/Desktop/nodejs-aws/environment/db ubuntu@ec2-34-243-23-72.eu-west-1.compute.amazonaws.com:/home/ubuntu/`
4) Check that your files have been properly synced. SSH into you DB AMI and use `ls` to verify all DB config files have been transferred successfully.
5) Run the provision.sh file within the DB AMI. If you get a permission denied error, run chmod u+x first.
6) Run the following command to verify that MongoDB is now running: `sudo systemctl status mongod`
7) Now, navigate to your AMI dashboard and click on DB security groups. Add your own app AMI IP address to the inbound DB rules.
8) Finally, we must create an env variable in our app AMI. Run the following command inside the app machine: `export DB_HOST=mongodb://34.251.87.187:27017/posts`
9) Navigate to your app directory and run `node app.js`
10) You should now be able to access /posts via your webapp!

test commit
1
2
3
4
5
6
7
8
9
