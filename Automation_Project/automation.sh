sudo apt update -y
sudo apt upgrade -y
if service --status-all | grep -L 'apache2'; then        #check if apache2 is installed by checking if it is within list of all the services. 
if service --status-all | grep -Fq '[ - ]  apache2'; then        #check if apache2 is in disabled state.
  sudo service apache2 start
fi
else
sudo apt-get install apache2
sudo service apache2 start
fi
myname=Shreekant
timestamp=06022021-120810
s3_bucket=upgrad-shreekant
aws s3 cp /tmp/${myname}-httpd-logs-${timestamp}.tar s3://${s3_bucket}/
