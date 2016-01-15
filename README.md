# mangoO-stable

This is the stable branch of mangoO Microfinance Management. mangoO was designed to work in small and medium sized microfinance institutions. Typically, customers will have to buy shares to become members of the society. These members will then hold both a savings and a loans account with the financial institution. 
mangoO was initially developed for the SACCO (Savings and Credit Cooperative) of the Anglican Luweero Diocese in Luweero, Uganda and the development was funded by the Christian Services International (Stuttgart, Germany) and the German government.

## Installation
As mangoO is fully based on web technology, it requires a PHP-capable webserver and a MySQL database. For testing purposes, using XAMPP is recommended.

To connect to the test database included in this repository (mangoo.sql), the required configuration is as follows.
Server: 127.0.0.1 /
Database user: root /
Database password: '' (empty password).
These are the current default settings included in mng_settings.php. They should only be used for test installations. Make sure to change database user and password for any productive environment!

The default login for the program GUI is:
Username: admin /
Password: password

It his highly recommended to change the password salt in each new installation by editing salt.php.

## Licence
This software is licensed under the GNU General Public License 3.0, a copy of which can be found in the LICENSE file.
