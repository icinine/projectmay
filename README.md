Doc Base  - User Guide
======================

Overview
--------

### Thank you for reading our user-guide 

Doc Base is a user-friendly Contract mamnagement software designed for use for small teams. The Procurement Admins create and upload contracts to the Database where they can be queried and downloaded by users across the larger company.

Test Driven Development Notes
-----------------------------

> ## Testing Specs for Contracts
>
> Desc (description) must be present
> Desc (description) must be betweeen 20 and 500 characters
> name must be more than 5 characters
> user_id must be present *(Foreign Key)*

### Gem Used
* Carrierwave
* Bootstrap-sass
* Mini_magick
* Will_paginate
* Chartkick
* PRY
* Postgres - for Development
* Sqlite3 - for Production