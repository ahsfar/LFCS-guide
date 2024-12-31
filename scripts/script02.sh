=#! /bin/bash

#scripts that accepts file name as param 
#then if the file is readable checks if it is a bash script file.
# checking if the filename is provided or not

if [ -z "$1" ]
 then
    echo "Please provide a file name as a parameter."
    exit 1
fi

file="$1"


# below code to check if the file is readable
if [ ! -r "$file" ]
 then
    echo "The file '$file' is not readable or maybe it does not exist."
    exit 1
fi


# now checking if it's a bash script
if  head -n 1 "$file" | grep -q "#! /bin/bash"
 then
    echo "The file '$file' is a bash script."
else
    echo "oh oh! This file '$file' is not a bash script."
fi

