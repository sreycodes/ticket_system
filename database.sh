printf "Database setup:\nLogging in as root... Please enter password when prompted!\n"
cat database_setup.sql | mysql -u root -p
