# Asana OAuth Helper

Small sinatra application to help you get your OAuth Token for your Asana Application.
This is specially useful to play around Asana API.

## Usage

### Requirements:

[POW](http://pow.cx/) - To run this Sinatra application.
[Tunnelss](https://github.com/rchampourlier/tunnelss) - To use SSL

_Note: Tricks for [persiting SSL with Tunnelss over reboot](http://www.sebgrosjean.com/en/news/2014/2/9/rails-with-ssl-in-development-with-pow-and-tunnels)_

### 1) Install dependencies

```sh
bundle install
```

### 2) Setup your Asana Application credentials

```sh
cp .powenv.sample .powenv
```

Edit the `ASANA_CLIENT_ID` and `ASANA_CLIENT_SECRET` environment variables from the `.powenv` file.

### 3) Restart Pow

Make sure to restart Pow, using:

```sh
touch tmp/restart.txt
```
