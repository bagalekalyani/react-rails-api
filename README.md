# Rails API integration
Rails API integration with Swagger UI exposing all the API calls making it easy to see and test all API's.

### Installing

-  Clone the repo

        git clone https://github.com/bagalekalyani/react-rails-api.git

- Install all the gems

        bundle install

-  Create a new DB (postgres)

        rake db:create

-  Migrate the DB

        rake db:migrate

-  Start the rails server

        rails s

### Swagger UI
-  Repo for swagger UI

        cd public/git submodule add git@github.com:wordnik/swagger-ui.git swagger


-  To generate the json

        http://localhost:3000/api/v1/apidocs

- To access UI for swagger

        http://localhost:3000/swagger/dist/index.html?url=/api/v1/apidocs#/
