export POSTMAN_COLLECTION_URL="https://api.getpostman.com/collections"
export POSTMAN_ENV_URL="https://api.getpostman.com/environments"
export NEWMAN_ENVIRONMENT_UID="YOUR ENVIRONMENT UID"
export NEWMAN_POSTMAN_APIKEY="YOUR POSTMAN API KEY"

#array of collections (ids) you want to run - you can get this via the Postman API or in the UI
collections=("COLLECTION_ID_1" "COLLECTION_ID_2" "COLLECTION_ID_3")

for collection in "${collections[@]}"; do
    #in this example, I'm running the "Submit your solution" folder for every day of 30 days of Postman for developers
    newman run "$POSTMAN_COLLECTION_URL/$collection?apikey=$NEWMAN_POSTMAN_APIKEY" --env-var "collectionUid=$collection?apikey=$NEWMAN_POSTMAN_APIKEY" -e "$POSTMAN_ENV_URL/$NEWMAN_ENVIRONMENT_UID?apikey=$NEWMAN_POSTMAN_APIKEY" --folder "Submit your solution" --reporter-htmlextra-showEnvironmentData
done
