# Getting Started

![rspec](https://ruby.ci/badges/70c1189f-60c9-44d2-853d-dab3a0cb9663/rspec)
![rubocop](https://ruby.ci/badges/70c1189f-60c9-44d2-853d-dab3a0cb9663/rubocop)
![simplecov](https://ruby.ci/badges/70c1189f-60c9-44d2-853d-dab3a0cb9663/simplecov)
![brakeman](https://ruby.ci/badges/70c1189f-60c9-44d2-853d-dab3a0cb9663/brakeman)
![bundler_audit](https://ruby.ci/badges/70c1189f-60c9-44d2-853d-dab3a0cb9663/bundler_audit)
![reek](https://ruby.ci/badges/70c1189f-60c9-44d2-853d-dab3a0cb9663/reek)
![ruby_critic](https://ruby.ci/badges/70c1189f-60c9-44d2-853d-dab3a0cb9663/ruby_critic)

This project is the Rails back-end API for the SalesBox project. Follow this settings to setup the project locally and run it.

## Prerequisites

To run the project, you will need the following dependencies installed:

    ruby 2.7.2
    gem bundler
    postgresql

## Installation

1. After clonning the repository, inside it, run the command to install the dependencies.

        bundle install

2. Create and prepare the database.

        bin/rails db:create
        bin/rails db:migrate

3. If you want to seed the database, run the command bellow.

        rake db:seed
  
## Running the project

To run the project locally, use the commands bellow.

1. Starts the ProstgreSQL service.

        sudo service postgresql start

2. Runs the Rails server.

        bin/rails server

The Rails server will run by default on port 3000 of the localhost.
