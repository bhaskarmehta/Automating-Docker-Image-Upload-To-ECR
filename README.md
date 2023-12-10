Build and Push Docker Image Into ECR And Scan the Image

This GitHub Actions workflow is designed to automate the process of building a Docker image, pushing it to Amazon Elastic Container Registry (ECR), and performing a vulnerability scan using Trivy.

Setup
Prerequisites
AWS Credentials: Ensure that you have appropriate AWS credentials set up and configured in your repository's secrets as AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY.
Dockerfile: You should have a Dockerfile in the root directory of your repository to build the Docker image.

Configuration
AWS ECR Repository: Update the ECR_REPOSITORY variable in the workflow file (main.yml) to match the name of your ECR repository.
Trivy Installation: Trivy is used for vulnerability scanning. This workflow installs Trivy in the Ubuntu environment.

Workflow Functions
Trigger
This workflow runs on two events:

Push: Triggered on pushes to the main branch.
Pull Request: Triggered on pull requests targeting the main branch.

Workflow Steps
Checkout Repository: Fetches the repository content to the runner.
Configure AWS credentials: Sets up AWS credentials for authentication.
Login to Amazon ECR: Logs in to AWS ECR using the configured credentials.
Build, tag, and push image to Amazon ECR:
Builds the Docker image based on the provided Dockerfile.
Tags the image using the GitHub run number.
Pushes the image to the specified ECR repository.
Install Trivy: Installs Trivy for vulnerability scanning.
Scan Docker Image for Vulnerabilities:
Uses Trivy to scan the pushed Docker image in the specified ECR repository for vulnerabilities.


Note -  I have created a simple NodeJS Application.
