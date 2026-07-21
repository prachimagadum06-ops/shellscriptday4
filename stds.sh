

  #!/bin/bash

while true
do
    echo " Student Record Management System"
    echo "1. Add Student"
    echo "2. View Students"
    echo "3. Search Student"
    echo "4. Delete Student"
    echo "5. Exit"
    echo -n "Enter your choice: "
    read choice

    if [ "$choice" -eq 1 ]; then
        echo -n "Enter Student ID: "
        read id

        echo -n "Enter Student Name: "
        read name

        echo -n "Enter Student Course: "
        read course

        echo "$id,$name,$course" >> students.txt
        echo "Student Added Successfully!"

    elif [ "$choice" -eq 2 ]; then
        echo "Student Records"
        if [ -f students.txt ]; then
            cat students.txt
        else
            echo "No Records Found!"
        fi

    elif [ "$choice" -eq 3 ]; then
        echo -n "Enter Student ID to Search: "
        read sid

        if grep -q "^$sid," students.txt 2>/dev/null; then
            grep "^$sid," students.txt
        else
            echo "Student Not Found!"
        fi

    elif [ "$choice" -eq 4 ]; then
        echo -n "Enter Student ID to Delete: "
        read did

        if grep -q "^$did," students.txt 2>/dev/null; then
            grep -v "^$did," students.txt > temp.txt
            mv temp.txt students.txt
            echo "Student Deleted Successfully!"
        else
            echo "Student Not Found!"
        fi

    elif [ "$choice" -eq 5 ]; then
        echo "Thank You!"
        break

    else
        echo "Invalid Choice!"
    fi

    echo
done
