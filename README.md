# README

This sample auction application is written in Ruby on Rails 5.1.

It uses a simple sqlite3 database. Once you have cloned this application from
git, you run it as follows.

cd into your directory where you keep sources, e.g. cd ~/frank/src

git clone http://www.github.com/fgermanojr/auction.git

Assume you have rails installed, start local server, by typing rails s
when in the root directory of the application.

A sample data file is stored in test/fixtures/files/example_input.csv

To load this file, enter localhost:3000/submission/bulkload

Select the csv file; hit upload.
  The file will be uploaded and processed.
  Once loaded to the database, the summary view is shown.

If you want to see the detail behind it, use the detail button.
If you are on the detail page, you can return to the summary page.

You can also hit the summary and detail page from a browser with
localhost:3000/auctions_new/summary
localhost:3000/auctions_new/index

On the detail page, you will see future directions to manipulate the data;
This is NOT debugged code, but serves as a foundation for future work.
It is the result of setting up resource routes for the auction model.

There is an extra table in the database called auction; I initially had trouble
with Rails being confused about it being a module. So I added a new model, auction_new
to serve as the actual model. If this was for real I would just clean this up,
but I would rather spend the time on the test.

