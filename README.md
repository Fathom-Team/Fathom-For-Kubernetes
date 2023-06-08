# Fathom for Kubernetes
Instructions: 

docker run -e GITHUB_CLIENT_ID=<your_github_client_id> \
           -e GITHUB_CLIENT_SECRET=<your_github_client_secret> \
           -e GOOGLE_CLIENT_ID=<your_google_client_id> \
           -e GOOGLE_CLIENT_SECRET=<your_google_client_secret> \
           -p 3000:3000 fathomforkubernetes/fathom-beta:0.0