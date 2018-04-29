printf "Running test1: Calling index page (No database queries involved)\n"
wrk -t8 -c200 -s Benchmarking/Get.lua http://localhost:3000/
printf "\n"

printf "Running test2: Retreiving database entry by id\n"
wrk -t8 -c200 -s Benchmarking/GetByID.lua http://localhost:3000/
printf "\n"

printf "Running test3: Creating database entries\n"
wrk -t8 -c200 -s Benchmarking/Post.lua http://localhost:3000/
printf "\n"

printf "Running test4: Updating database entries\n"
wrk -t8 -c200 -s Benchmarking/Put.lua http://localhost:3000/
printf "\n"

printf "Running test5: Deleting database entries\n"
wrk -t8 -c200 -s Benchmarking/Delete.lua http://localhost:3000/
printf "\n"

printf "Running test6: Trying all routes\n"
wrk -t8 -c200 -s Benchmarking/MultiplePaths.lua http://localhost:3000/
