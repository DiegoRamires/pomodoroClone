# PomodoroClone

Create and manage your tasks with pomodoro method.
Application designed in order to manage tasks with pomodoro method.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

You must have docker and docker-compose installed

```
For more information, please see https://docs.docker.com/install/ 
```

### Installing

Access the project folder in your terminal enter the following

```
$ docker-compose build
```

```
$ docker-compose run --rm app bundle install
```

```
$ docker-compose run --rm app bundle exec rails db:create
```

```
$ docker-compose run --rm app bundle exec rails db:migrate
```
After that for test the installation enter the following to up the server

```
$ docker-compose up
```

Open your browser and access localhost:3000 to see the home page

## Built With

* [Ruby on Rails](https://rubyonrails.org/) - The web framework used
* [PostgreSQL](https://www.postgresql.org/) - SGDB

## Authors

* **Diego Gonçalves** - [DiegoRamires](https://github.com/DiegoRamires)
* **Ronaldo Carneiro da Silva Filho** - [kikogamer](https://github.com/kikogamer) 

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details