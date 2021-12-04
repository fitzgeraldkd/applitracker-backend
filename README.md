# AppliTracker (Back-End)

[Click here](https://applitracker.netlify.app/) to see the deployed app.

[Click here](https://github.com/fitzgeraldkd/applitracker-frontend) to see the repository for the front-end. More information about this project will be available in that repository's README.

## Installation (Local)

To run this locally, you will need to run [PostgreSQL](https://www.postgresql.org/) on your local machine. Please follow the official instructions to get this installed.

After cloning this repository and getting PostgreSQL running, the first thing you should do is make sure all the required gems are installed. You can do this by running this command in your terminal:

```bash
bundle install
```

Then create a `config/secrets.rb` file. This will allow you to define environment variables to connect to the database and generate JSON Web Tokens. The file is listed in the `.gitignore` to help prevent unintentionally sharing the contents of this file. The file should look like this:

```rb
# config/secrets.rb
ENV['database'] = 'your database name here'
ENV['password'] = 'your database password here'
ENV['jwt_token'] = 'your secret to generate secure JSON Web Tokens'
```

Once these secret keys are defined, create the tables by running the following command in your terminal: 

```bash
rails db:migrate
```

You can then run the server with:

```bash
rails s
```