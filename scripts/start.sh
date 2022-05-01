source .env

# Setup the Fantom directory
echo $EMAIL >> nodes/fantom/.api
echo $PASSWORD >> nodes/fantom/.api

echo $PASSWORD >> nodes/fantom/.password

docker-compose up -d