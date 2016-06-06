
Ariadne
===

This gem keeps track of time consumed by test takers. 

Build Status:
---

[![Build Status](https://travis-ci.org/elitmus/ariadne.svg?branch=master)](https://travis-ci.org/elitmus/ariadne)

[![Code Climate](https://codeclimate.com/github/elitmus/ariadne/badges/gpa.svg)](https://codeclimate.com/github/elitmus/ariadne)

[![Test Coverage](https://codeclimate.com/github/elitmus/ariadne/badges/coverage.svg)](https://codeclimate.com/github/elitmus/ariadne/coverage)

[![Issue Count](https://codeclimate.com/github/elitmus/ariadne/badges/issue_count.svg)](https://codeclimate.com/github/elitmus/ariadne)

Steps to install:
---

1. Install `redis`

    ```sh
    $ brew install redis
    ```

2. Start the redis server

    ```sh
    $ redis-server
    ```

3. In your Rails app, create `config/initializers/ariadne.rb` with following content

    ```ruby
    # config/initializers/ariadne.rb

    # Set Redis URL
    ENV['REDIS_URL'] = "#{your_redis_server_URL}"

    # set the host application name to be used to save data in Ariadne
    ENV['APP_NAME']  = "#{your_application_name}"
    ```

4. Include in your `Gemfile` 

    ```ruby
    # Gemfile

    gem 'ariadne'
    ```

5. run 
    ```sh
    $ bundle install
    ```