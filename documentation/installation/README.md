# Scheduleless Installation

## Ruby Installation

I use rvm but you could use rbenv or something similar. Follow the instructions
here: 
https://rvm.io/rvm/install

* rvm install 2.3.1
* gem install bundler

## Postgres Installation

Install Postgres `brew install postgresql`. Postgres can be tricky to set up. After installation try
`psql`. If you cannot log in you may need to manage this through the psql user
on the system.

* createdb `whoami`
* psql -d `whoami` -U `whoami` 

Once logged in you can run these commands to set up the user in postgres.
* `CREATE USER rails WITH PASSWORD 'rails';`
* `ALTER USER rails WITH SUPERUSER;`

You can then try running `rails db:create` If this fails you may need to edit
the pg_hba.conf to allow connections on all users from localhost.
[How to Edit pg_hba.conf](https://www.postgresql.org/docs/9.1/static/auth-pg-hba-conf.html)

## Elasticsearch

It depends on Java so grab that
`brew cask install java`

We need version 2.4 because Chewy isn't compatible with later versions yet
`brew install elasticsearch@2.4`
`brew services start elasticsearch@2.4`

If you have existing data run `rake chewy:reset` to ensure that all the data is
loaded into elasticsearch.

## Redis

`brew install redis`
`brew services start redis`

## Seeding

A seed script is provided that takes a prefix and sets up a company with many
locations of different sizes.

`rake database:seed_demo[prefix]`

This will make the company Prefix Company and emails will look like
prefix.1@example.com - prefix.200@example.com.

prefix.1@example.com will be the company admin and all login passwords use
`password` for now.

## oAuth

#### Get an access token:

POST localhost:3000/oauth/token

```json
{
  "grant_type"    : "password",
  "username"      : "demo@example.com",
  "password"      : "password"
}
```

#### Use an access token:

In order to use a token use the authentication header

Authentication: Bearer <TokenGoeshere>

Example Curl:
```
curl -X GET -H "Authorization: Bearer c35042ae39fb1bcad57216eebcafdb6b7addb7ceea5cd99eadf11d2310b48b8d" -H "Cache-Control: no-cache" -H "Postman-Token: 5c9a1329-41c7-2d0a-904d-9e2024a9d61c" "http://localhost:3000/mobile_api/future_shifts"
```

### Problems Installing Capybara Webkit
If when installing gems, Capybara webkit fails follow these two cases:  
`command: qmake not found`: Follow the guides for linking Qt [here](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit)

`xcode not set up properly`: (You may have already tried to run `xcodebuild` which probably failed.) You have to agree to the command line interface license agreement. First open XCode itself and agree to the desktop agreement.  
Then, run `sudo xcode-select -s /Applications/Xcode.app/Contents/Developer`. This will allow you to run the `xcodebuild` command.  
Lastly run, `sudo xcodebuild -license` and spam `[SPACE]` until you reach the end and type `agree`.

After each case, retry installation of the gem.


## TODO

* a plan needs to be seeded by default
