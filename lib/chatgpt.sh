

function chatgpt.fmt.message { #data
    __chatgpt_build_message "$1" | jq -R '.choices[0].message.content'
}

function __chatgpt_build_message { #data
    price_1h_percent=$(echo $1 | jq .market_data.price_change_percentage_1h_in_currency.usd)
    price_24h_percent=$(echo $1 | jq .market_data.price_change_percentage_24h_in_currency.usd)
    price_7d_percent=$(echo $1 | jq .market_data.price_change_percentage_7d_in_currency.usd)
    current_price=$(echo $1 | jq .market_data.current_price.usd)
    h24h=$(echo $1 | jq .market_data.high_24h.usd)
    l24h=$(echo $1 | jq .market_data.low_24h.usd)
    volume=$(echo $1 | jq .market_data.total_volume.usd)

    content="write a chat message from Scammer to notify about pricing of Ronin (RON) by this data, current $current_price USD, change 1h $price_1h_percent%, change 24h $price_24h_percent%, change 7d $price_7d_percent%. 24h lowest at $l24h and highest $h24h, volume $volume usd"

    curl https://api.openai.com/v1/chat/completions \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $OPENAI_API_KEY" \
        -d  @- << EOF
{
    "model": "gpt-3.5-turbo",
    "messages": [
        {
            "role": "user",
            "content": "$content"
        }
    ]
}
EOF
}