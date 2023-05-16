# Overview

This repo shows the workflow in Atlantis

## Atlantis Setup

Let's get Atlantis setup locally on our computer.

This is a [good guide to follow.](https://www.runatlantis.io/guide/testing-locally.html)

## Start Ngrok

First you'll need to create an account by going to https://ngrok.com/. You will then get a token that you can use below.

```bash
ngrok config add-authtoken <your_token>
ngrok http 4141
```

Grab the Forwarding URL Example:
```bash
https://b3c4-13-82-2-162.ngrok-free.app
```

Insert that in the `URL` environment variable in `start.sh`

```bash
URL="https://b3c4-13-82-2-162.ngrok-free.app"
```

## Create a Random String

You can use [this link to create one]( https://www.random.org/strings). Then add it to the `SECRET` environment variable in `start.sh`. 

```bash
SECRET="thisisrandom"
```

## Create a Webhook for GitHub

Go to your repo's settings
Select Webhooks or Hooks in the sidebar
Click Add webhook
set Payload URL to your ngrok url with /events at the end. Ex. https://b3c4-13-82-2-162.ngrok-free.app/events
double-check you added /events to the end of your URL.
set Content type to application/json
set Secret to your random string that you set above
select Let me select individual events
check the boxes
Pull request reviews
Pushes
Issue comments
Pull requests
leave Active checked
click Add webhook

## Create an Personal Access token in GitHub for Atlantis

Here we'll create the access token that Atlantis uses to comment on the pull request and set commit statuses.

Create a [Personal Access Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token#creating-a-fine-grained-personal-access-token)
create a token with repo scope
set the token as an environment variable in the `start.sh` file.

```bash
TOKEN="{YOUR_TOKEN}"
```

## Google Credentials

In your Google cloud project under `IAM & Admin`, generate a new key under `Service Accounts`.

This will save a json file into your computer. Save this to a JSON file called `gcp-secret-key.json` which should be added in your .gitignore file. There is a sample file in this repo called `gcp-secret-key-example.json`. You can save it there and rename it to `gcp-secret-key.json`.

Make sure the correct path is specified in the `GOOGLE_APPLICATION_CREDENTIALS` environment variable in `start.sh`.
```bash
export GOOGLE_APPLICATION_CREDENTIALS="./gcp-secret-key.json"
```

## Start Atlantis

Now open a new terminal tab in Codespaces and run:

```bash
./start.sh
```

The application should now run on port 4141 and you can access it by clicking on the globe icon under the `PORTS` tab in Codespaces.

## Add a Developer to our Repo

Now let's invite a developer to our repo so they can run a pull request to a dev branch.

Make sure to make the main branch protected.

You can now make a change as a developer in a dev branch and then create a pull request. This will automatically run a Terraform plan. If satisfied, you can then run `atlantis apply` which will apply the changes. Then the owner of the repo can now approve the pull request and the dev branch will get merged with the main branch.