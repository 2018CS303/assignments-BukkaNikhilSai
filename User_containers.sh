echo -n "Enter name of the user: "
read name
sudo docker start $name
sudo docker attach $name