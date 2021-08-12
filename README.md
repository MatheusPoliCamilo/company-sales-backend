# Getting Started

Follow this settings to setup your project locally and run it.

## Prerequisites

To run the project locally, you will need the following dependencies installed:

    ruby 2.7.2
    gem bundler
    postgresql

## Installation

1. After clonning the repository, inside it, run the command bellow to install the dependencies.

        bundle install

2. Prepare database using the commands bellow.

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
