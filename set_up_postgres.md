# Setting up a Postgres database

This document is a rough set of notes sufficient to set up a database that allows remote connections, on an Ubuntu 12.04.2 LTS virtual machine.

Disclaimer: This document is far from sufficient for setting up a locked-down Postgres server.  Only follow these instructions for a machine on a reasonably separated network.

This document assumes a target Postgres service on an Ubuntu virtual machine, IP address `172.16.123.231`.  End goal: Remote query access from the `172.16.123.0/24` subnet with a non-database-root user.


## References

* https://help.ubuntu.com/community/PostgreSQL
* http://www.cyberciti.biz/faq/howto-add-postgresql-user-account/
* http://blog.deliciousrobots.com/2011/12/13/get-postgres-working-on-ubuntu-or-linux-mint/
* http://www.cyberciti.biz/tips/postgres-allow-remote-access-tcp-connection.html
* https://help.ubuntu.com/10.04/serverguide/postgresql.html


## Setup


### Installing the server

These commands install the server, client, and a Postgres GUI.

    sudo apt-get install postgresql-9.1 pgadmin3 postgresql-client-common
    sudo -u postgres psql postgres <<EOF
    \password postgres
    EOF


### Enabling password access

Password login will not work until you perform these steps.

    sudo vi /etc/postgresql/9.1/main/pg_hba.conf

Change line "`local all all peer`" to "`local all all md5`" (note: lot of white spaces in that line)
Change line "`local all postgres peer`" to "`local all postgres md5`" (note: lot of white spaces in that line)
Then restart the server:

    sudo service postgresql restart

You should be able to log in locally now (or at least get a complaint that a database doesn't exist, which shows you got past authentication):

    psql -U postgres


### Adding user `diskprint_writer` with a password

    sudo -u postgres psql postgres <<EOF
    CREATE USER diskprint_writer WITH PASSWORD 'a_default_password';
    EOF


### Enabling remote access

Configuring Ubuntu's firewall didn't seem necessary.  Allow postgresql clients to connect from the VM network (with non-`postgres` accounts) by appending instructions to a few configuration files:

    sudo su
    echo "listen_addresses = '172.16.123.231'" >>/etc/postgres/9.1/main/postgresql.conf
    echo "host all postgres 172.16.123.0/24 reject" >>/etc/postgresql/9.1/main/pg_hba.conf
    echo "host all all 172.16.123.0/24 md5" >>/etc/postgresql/9.1/main/pg_hba.conf
    service postgresql restart
    exit

Check open ports to see that the server is now listening:

    netstat -tulanp

Test actual remote access by logging in from the VM host:

    psql --host=172.16.123.231 -U diskprint_writer

(Again, you may get the database doesn't exist error.  At this point, that's fine.)

You are now ready to populate the database content.
