### Configuração

#### Dependencias
* [Ruby 2.4.1](http://ruby-doc.org)
* [Rails 5.1.6](http://rubyonrails.org)
* [PostgreSQL](https://www.postgresql.org)

#### Instalação e Configurações

```
git@github.com:DiegoRamires/pomodoroClone.git
bundle install
```

#### Criação e migração do banco de dados

`bundle exec rails db:create && rails db:migrate`

#### Rodar localmente

```
bundle exec rails server
```
- Acesse a url ~> `localhost:3000`