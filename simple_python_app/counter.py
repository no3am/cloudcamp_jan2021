import time
import socket

# use an ongoing while loop to generate output
while True:
    # Set the hostname and the current date
    host = socket.gethostname()
    date = time.strftime("%Y-%m-%d %H:%M:%S")

    NOW = str(date)

    # Open the file named date in append mode
    # Append the output of hostname and time
    f = open("date.out", "a")
    f.write(NOW + "\n")
    f.write(host + "\n")
    f.close()

    # Sleep for 5 seconds then continue loop
    time.sleep(5)
