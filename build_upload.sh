registry_name="acrasgardeomainrnd001"

# Delete the existing wso2is-7.0.0 folder
rm -rf wso2is-7.0.0

# Extract the ZIP file
unzip wso2is-7.0.0.zip

# Ask for the tag input
read -p "Enter tag for the Docker image: " tag

# Build Docker image
docker build -t is7.0:$tag .

# Login to Azure Container Registry (ACR)
az acr login --name $registry_name

# Tag the Docker image
docker tag is7.0:$tag $registry_name.azurecr.io/is7.0:$tag

# Push Docker image to ACR
docker push $registry_name.azurecr.io/is7.0:$tag

echo "Docker image tagged and pushed to Azure Container Registry successfully."