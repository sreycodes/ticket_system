**Setup:**

Run **./database.sh** on your terminal to create a table called **ticket** inside a database called **db** on your local mysql by logging in as **root**.

Run **./server.sh** or type in **npm start** to start the server.

Open a new terminal window and run **./benchmarking.sh** to run all the **6 wrk tests** for the server.

Run **./task.sh** to run wrk for multiple paths on the server for connections ranging from 2000000 to 4000000. According to my analysis this is where I start hitting 1 request per second.
