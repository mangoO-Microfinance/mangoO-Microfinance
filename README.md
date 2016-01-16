# mangoO-stable

mangoO Microfinance Management was designed to work in small single branch microfinance institutions. Typically, customers will have to buy shares to become members of the society. These members will then hold both a savings and a loans account with the financial institution.

mangoO was initially developed for [Luweero Diocese SACCO (Savings and Credit Cooperative)](http://www.luweerodiocese.org/sacco) of the Anglican Luweero Diocese in Uganda. The development was funded by [Christian Services International (Stuttgart, Germany)](http://www.gottes-liebe-weltweit.de).

## Features
- Customer management
- Share account management
- Savings account management
- Loan management
- Reports
- Accounting

## Installation
As mangoO is fully based on web technology, it requires a PHP-capable webserver and a MySQL database. For testing purposes, using XAMPP is recommended.

To connect to the test database included in this repository (mangoo.sql), the required configuration is as follows.
Server: 127.0.0.1 /
Database user: root /
Database password: '' (empty password).
These are the current default settings included in mng_settings.php. They should only be used for test installations. Make sure to change database user and password for any productive environment! It is also highly recommended to change the password salt in each new installation by editing salt.php.

The default login for the program GUI is:
Username: admin /
Password: password

## Licence
This software is licensed under the GNU General Public License 3.0, a copy of which can be found in the LICENSE file.
