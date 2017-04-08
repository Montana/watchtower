![watchtower](https://pbs.twimg.com/profile_images/657129189322059776/PCo6mdLg.png)

Watchtower (for MySQL + Docker)
======================

### Watchtower
Watchtower is a Python application designed for monitoring multiple MySQL instances in Docker, specifically built for Prowl.


#### Usage

Server list file is a CSV file that contains the Prowl group name, the Prowl hostname as well as the MySQL port, assuming your server list file is named "serverlist" <pre>cat</pre> into it 

<pre>cat serverlist.txt
group1,test1,3306
group1,test2,3306
group2,test3,3307
group2,test4,3307
</pre>
#### Running it with a custom MySQL config file using Docker 

The MySQL startup configuration in these Docker images is specified in the file /etc/my.cnf. If you want to customize this configuration for your own purposes, you can create your alternative configuration file in a directory on the host machine and then mount this file in the appropriate location inside the MySQL container, effectively replacing the standard configuration file.
<pre>docker run --name some-mysql -v /my/custom:/etc/mysql/conf.d -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag
</pre>

#### Docker optimized MySQL install

All binaries are stripped, non-debug only, this is only expected to be relevant for a large majority of Prowl employees who run Docker based MySQL instances
    
   <pre>
   /usr/bin/my_print_defaults
   /usr/bin/mysql
   /usr/bin/mysql_config
   /usr/bin/mysql_install_db
   /usr/bin/mysql_tzinfo_to_sql
   /usr/bin/mysql_upgrade
   /usr/bin/mysqldump
   /usr/sbin/mysqld
    </pre>

#### Create a MySQL user account 
````
GRANT REPLICATION CLIENT ON *.*  to {USER}@{MONITOR_SERVER_IP} IDENTIFIED BY '{PASSWORD}';
````
#### Run Watchtower
````
python watchtower.py serverlist.txt USER PASS
````

![Mode_InnoDB](screenshots/screenshot1.png "InnoDB Mode")
#### replication mode
![Mode_Replication](screenshots/screenshot2.png "Replication Mode")

Written by Montana Mendy for Prowl, LLC.
