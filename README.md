# CPU-Cop

This script will run the top command once and loop through the output lines, skipping the first seven lines that contain the header information. 
For each line, it will extract the user name, the process ID and the CPU usage percentage of the process. If the CPU usage is greater than a predefined threshold (80% in this example), it will check if the user is already in a file that stores the list of regular abusers. If the user is in the file, it will kill the process and log the action. 

If the user is not in the file, it will add the user to the file and log the action. This way, the script will identify and handle the regular high CPU users and their processes. 

You can run this script periodically using a cron job or a systemd timer to monitor the CPU usage.

I hope this helps. Please let me know if you have any questions or feedback. 😊
