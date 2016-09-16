# react-rails
Rails API integration

1. Download/ Clone the repo
2. bundle install
3. rake db:migrate
4. cd public/git submodule add git@github.com:wordnik/swagger-ui.git swagger  -- repo for swagger UI
5. rails s
6. http://localhost:3000/api/v1/apidocs  -- To generate the json
7. http://localhost:3000/swagger/dist/index.html?url=/api/v1/apidocs#/  -- To access UI for swagger
