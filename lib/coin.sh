#!/bin/bash

function coin.get {
    data=$(curl -XGET "https://api.coingecko.com/api/v3/coins/$1?tickers=false&market_data=1&community_data=false&developer_data=false&sparkline=false&localization=false" -H 'accept: application/json')
    echo $data
}

function coin.fmt.notify_price { # data
        price_1h_percent=$(echo $1 | jq .market_data.price_change_percentage_1h_in_currency.usd)
    price_24h_percent=$(echo $1 | jq .market_data.price_change_percentage_24h_in_currency.usd)
    price_7d_percent=$(echo $1 | jq .market_data.price_change_percentage_7d_in_currency.usd)
    current_price=$(echo $1 | jq .market_data.current_price.usd)
    h24h=$(echo $1 | jq .market_data.high_24h.usd)
    l24h=$(echo $1 | jq .market_data.low_24h.usd)

    message= cat <<EOF
Ronin - \$RON\n
Price [USD]: $current_price\n
H: $h24h | L: $l24h\n
1h changed: $price_1h_percent%\n
24h changed: $price_24h_percent%\n
7d changed: $price_7d_percent%\n
\n
`Cronjob at: https://github.com/duythinht/crontab/`"
EOF
    echo $message
}

function coin.fmt.notify_price_by_percent { # data, changed
        price_1h_percent=$(echo $1 | jq .market_data.price_change_percentage_1h_in_currency.usd)
    price_24h_percent=$(echo $1 | jq .market_data.price_change_percentage_24h_in_currency.usd)
    price_7d_percent=$(echo $1 | jq .market_data.price_change_percentage_7d_in_currency.usd)
    current_price=$(echo $1 | jq .market_data.current_price.usd)
    h24h=$(echo $1 | jq .market_data.high_24h.usd)
    l24h=$(echo $1 | jq .market_data.low_24h.usd)

    message= cat <<EOF
Ronin - \$RON - Price has been changed: $2%\n
Price [USD]: $current_price\n
H: $h24h | L: $l24h\n
1h changed: $price_1h_percent%\n
24h changed: $price_24h_percent%\n
7d changed: $price_7d_percent%\n
\n
`Cronjob at: https://github.com/duythinht/crontab/`"
EOF
    echo $message
}



function coin.data.current_price {
    echo $1 | jq .market_data.current_price.usd
}
