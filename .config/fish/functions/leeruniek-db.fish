function leeruniek-db -a env -d "Leeruniek frontend database connect using Google CloudSQL"
    set credential_file "/home/andreid/.ssh/leeruniek-cloud-sql.json"
    set region "leeruniek-155216:europe-west1"

    switch "$env"
        case "stage"
            cloud_sql_proxy \
                -instances=$region:frontend-db-staging=tcp:5433 \
                -credential_file=$credential_file
        case "prod"
            cloud_sql_proxy \
                -instances=$region:frontend-db-production=tcp:5432 \
                -credential_file=$credential_file
    end
end
