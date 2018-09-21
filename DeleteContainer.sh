#!/bin/bash
echo -n "Enter 'y' to delete the containers of all usernames, else enter 'n': "
read option
if [ "$option" == "n" ]
then
    echo -n "Enter the usernames you want to delete, enter 'exit' when done deleting: "
    while read user
        do
            if [ "$user" != "exit" ]
                then
                    sudo docker rm $user
            else
                break
        fi
        done
else
    echo -n "Enter name of file containing usernames: "
    read file
    while read user
        do
            sudo docker rm $user
        done < $file
fi