# Installation for Ubuntu 18.04
sudo apt-get update -y
sudo apt-get install npm -y
sudo npm install n -g -y
sudo n latest

# Install MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org

# Install dependencies
sudo apt-get install libkrb5-dev -y

# Fetch explorer code
git clone https://github.com/dondreytaylor/iquidus-btg.git explorer
cd explorer && npm install

# Create settings file
cat <<EOT >> ./settings.json
/*
  This file must be valid JSON. But comments are allowed

  Please edit settings.json, not settings.json.template
*/
{
  // name your instance!
  "title": "Bithereum Explorer",

  "address": "explorer.bithereum.network",

  // coin name
  "coin": "Bithereum",

  // coin symbol
  "symbol": "BTH",

  // logo
  "logo": "/images/bgold.jpg",

  // favicon
  "favicon": "public/favicon.ico",

  // Uses bootswatch themes (http://bootswatch.com/)
  // Valid options:
  //     Cerulean, Cosmo, Cyborg, Darkly, Flatly, Journal, Lumen, Paper,
  //     Readable, Sandstone, Simplex, Slate, Spacelab, Superhero, United, Yeti
  // theme (see /public/themes for available themes)
  "theme": "Lumen",

  // port to listen for requests on.
  "port" : 3001,

  // database settings (MongoDB)
  "dbsettings": {
    "user": "bithereum",
    "password": "3xp!0reR",
    "database": "explorerdb",
    "address": "localhost",
    "port": 27017
  },

  //update script settings
  "update_timeout": 10,
  "check_timeout": 250,

  // wallet settings
  "wallet": {
    "host": "localhost",
    "port": 8332,
    "user": "bitcoingold",
    "pass": "bitcoingold"
  },

  // confirmations
  "confirmations": 3,

  // language settings
  "locale": "locale/en.json",

  // menu settings
  "display": {
    "api": true,
    "markets": true,
    "richlist": true,
    "twitter": false,
    "facebook": false,
    "googleplus": false,
    "search": true,
    "movement": true,
    "network": true
  },

  // index page (valid options for difficulty are POW, POS or Hybrid)
  "index": {
    "show_hashrate": true,
    "difficulty": "POW",
    "last_txs": 100
  },

  // ensure links on API page are valid
  "api": {
    "blockindex": 0,
    "blockhash": "",
    "txhash": "",
    "address": ""
  },

  // market settings
  //supported markets: bittrex, poloniex, yobit, empoex, bleutrade, cryptopia, ccex
  //default market is loaded by default and determines last price in header
  "markets": {
    "coin": "BTG",
    "exchange": "USD",
    "enabled": ["yobit"],
    "cryptopia_id": "1658",
    "ccex_key" : "Get-Your-Own-Key",
    "default": "yobit"
  },

  // richlist/top100 settings
  "richlist": {
    "distribution": true,
    "received": true,
    "balance": true
  },
  // movement page settings
  // min amount: show transactions greater than this value
  // low flag: greater than this value flagged yellow
  // high flag: greater than this value flagged red
  "movement": {
    "min_amount": 1,
    "low_flag": 1000,
    "high_flag": 5000
  },

  // twitter, facebook, googleplus
  "twitter": "bitcoingold",
  "facebook": "btcgpu",
  "googleplus": "yourgooglepluspage",

  //genesis
  "genesis_tx": "",
  "genesis_block": "",

  //heavy (enable/disable additional heavy features)
  "heavy": false,

  //amount of txs to index per address (stores latest n txs)
  "txcount": 120,

  //show total sent & received on address page (set false if PoS)
  "show_sent_received": true,

  // how to calculate current coin supply
  // COINBASE : total sent from coinbase (PoW)
  // GETINFO : retreive from getinfo api call (PoS)
  // HEAVY: retreive from heavys getsupply api call
  // BALANCES : total of all address balances
  // TXOUTSET : retreive from gettxoutsetinfo api call
  "supply": "COINBASE",

  // how to acquire network hashrate
  // getnetworkhashps: uses getnetworkhashps api call, returns in GH/s
  // netmhashps: uses getmininginfo.netmhashpsm returns in MH/s
  "nethash": "getnetworkhashps",

  // nethash unitd: sets nethash API return units
  // valid options: "P" (PH/s), "T" (TH/s), "G" (GH/s), "M" (MH/s), "K" (KH/s)
  "nethash_units": "K",

  // Address labels
  // example : "JhbrvAmM7kNpwA6wD5KoAsbtikLWWMNPcM": {"label": "This is a burn address", "type":"danger", "url":"http://example.com"}
  // label (required) = test to display
  // type (optional) = class of label, valid types: default, primary, warning, danger, success
  // url (optional) = url to link to for more information
  "labels": {
  //  "JSoEdU717hvz8KQVq2HfcqV9A79Wihzusu": {"label": "Developers address", "type":"primary", "url":"http://example.com"},
  //  "JSWVXHWeYNknPdG9uDrcBoZHztKMFCsndw": {"label": "Cryptsy"}
  }
}
EOT


cd ..
mv explorer ../
cd ..

service mongod start
