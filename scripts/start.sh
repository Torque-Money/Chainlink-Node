# Setup the directories
NODE_PATH=nodes/

for d in $NODE_PATH/*; do
  if [ -d "$d" ]; then
    source $d/.env

    echo $EMAIL >> $d/.creds
    echo $PASSWORD >> $d/.creds

    echo $PASSWORD >> $d/.pass

  fi
done

# Start docker compose
# docker-compose up -d