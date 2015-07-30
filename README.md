# interview-app
A shopping cart app

##Setup
* install & setup postgres: `brew install postgres`
* install gems: `bundle install`
* setup database.yml with your db creds:
```
cp config/database.yml.example config/database.yml
```
* prepare db: `rake db:create`
* migrate: `rake db:migrate`
* seed db: `rake db:seed`

##Running App
`foreman start`

## Running specs
`rake spec`
