# **Setup:**

Run **./database.sh** on your terminal to create a table called **ticket** inside a database called **db** on your local mysql by logging in as **root**.

Run **./server.sh** or type in **npm start** to start the server.

Open a new terminal window and run **./benchmarking.sh** to run all the **6 wrk tests** for the server.

Run **/task.sh** to run wrk for multiple paths on the server for connections ranging from 2000000 to 4000000. According to my analysis this is where I start hitting 1 request per second.

# Analysis

We see that our server starts off well for updation and deletion while it performs poorest for get requests. I think this can be attributed to the indexing of the database by the column ID. I think the reason get requests are slower due to extra redirection and rendering. This could be solved by changing the same webpage using javascript to show the results. We can use a buffer/cache if we realize the same ID is being retrieved multiple times. As the styling is not complex right now, it can probably be compiled with the html instead of accessing an empty styles.css file. Maybe using pure HTML instead of handlebars will reduce conversion time.

The POST request also doesn't perform very well. One solution could be to create a batch of IDs in one go instead of creating one every time the user asks for one. Also as we notice that the UPDATE request performs very well, we could have a number of null rows created in advance and update them every time the user tries to create one.

Overall, our miscellaneous or mixture of requests performs average and hits the lower bound of 1 request per second the last.
