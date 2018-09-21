#!/bin/bash

echo -n "Enter name of the container to be monitored: "
read name
sudo docker logs -f $name