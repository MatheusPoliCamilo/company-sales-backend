![rspec](https://ruby.ci/badges/70c1189f-60c9-44d2-853d-dab3a0cb9663/rspec)
![rubocop](https://ruby.ci/badges/70c1189f-60c9-44d2-853d-dab3a0cb9663/rubocop)
![simplecov](https://ruby.ci/badges/70c1189f-60c9-44d2-853d-dab3a0cb9663/simplecov)
![brakeman](https://ruby.ci/badges/70c1189f-60c9-44d2-853d-dab3a0cb9663/brakeman)
![bundler_audit](https://ruby.ci/badges/70c1189f-60c9-44d2-853d-dab3a0cb9663/bundler_audit)
![reek](https://ruby.ci/badges/70c1189f-60c9-44d2-853d-dab3a0cb9663/reek)
![ruby_critic](https://ruby.ci/badges/70c1189f-60c9-44d2-853d-dab3a0cb9663/ruby_critic)

# SalesBox
SalesBox is a easy to use cloud based sales analyzer that accepts text files (tab separated) uploads.

https://sales-box-app.vercel.app/

## Features
With SalesBox you can:
 * Check the Gross Income for each upload
 * Check the All Time Gross Income for all the uploads made
 * See a list of uploaded files to control your analysis.

## Get Started :fire:
This repository is the Rails back-end for the SalesBox project. 
Follow the setup below to install and run it locally.

## Prerequisites :floppy_disk:

To run the project, you will need the following dependencies installed:

[Ruby 2.7.2](https://www.ruby-lang.org/en/documentation/installation/)

[Gem bundler](https://bundler.io/)

[Postgresql](https://www.postgresql.org/download/)

## Installation 🛠 

1. After clonning the repository, in the `ROOT` directory run the following command to install the dependencies.

        bundle install
  
## Running the project ⚙️

To run the project locally, use the commands bellow.

1. Starts the ProstgreSQL service.

Linux:

        sudo service postgresql start
        
MacOS: 

        brew service postgresql start
        
2. Create and prepare the database.

        bin/rails db:create
        bin/rails db:migrate

3. Run the Rails server.

        bin/rails server

The Rails server will run by default on `localhost:3000`.

## Running Tests :white_check_mark:

1. Run tests with

        bundle exec rspec
        
2. For reporting access `coverage/indes.html` on your browser.

## Improvements 📈

1. Use ActiveStorage with some service like AWS for work with the company sales uploaded file.
2. Cache on total all-time gross income endpoint.
3. Some code refactoring to enable the disabled RuboCop cops and Reek rules.
