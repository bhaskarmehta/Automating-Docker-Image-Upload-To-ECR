Build and Push Docker Image Into ECR And Scan the Image
--------------------------------------------------------

*** This GitHub Actions workflow is designed to automate the process of building a Docker image, pushing it to Amazon Elastic Container Registry (ECR), and performing a vulnerability scan using Trivy.

Setup
-----
  Prerequisites - 
    1) We have created a simple NodeJS Application.
    2) AWS Credentials: Ensure that you have appropriate AWS credentials set up and configured in your repository's secrets as AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY.
    3) Dockerfile: You should have a Dockerfile in the root directory of your repository to build the Docker image.

Configuration
--------------
 1) AWS ECR Repository: Update the ECR_REPOSITORY variable in the workflow file (main.yml) to match the name of your ECR repository.
2) Trivy Installation: Trivy is used for vulnerability scanning. This workflow installs Trivy in the Ubuntu environment.

Workflow Functions
-------------------
Trigger - 
   This workflow runs on two events:

   1) Push: Triggered on pushes to the main branch.
   2) Pull Request: Triggered on pull requests targeting the main branch.

Workflow Steps - 
1) Checkout Repository: Fetches the repository content to the runner.
2) Configure AWS credentials: Sets up AWS credentials for authentication.
3) Login to Amazon ECR: Logs in to AWS ECR using the configured credentials.
4) Build, tag, and push image to Amazon ECR: Builds the Docker image based on the provided Dockerfile. Tags the image using the GitHub run number. Pushes the image to the specified ECR repository.
5) Install Trivy: Installs Trivy for vulnerability scanning.
6) Scan Docker Image for Vulnerabilities: Uses Trivy to scan the pushed Docker image in the specified ECR repository for vulnerabilities.
