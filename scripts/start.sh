source .env

# Setup the Fantom directory
echo $EMAIL >> nodes/fantom/.api
echo $PASSWORD >> nodes/fantom/.api

echo $PASSWORD >> nodes/fantom/.password

# Start docker compose
docker-compose up -d