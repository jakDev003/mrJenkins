# Repository Overview

This repository contains Jenkins pipeline configurations for multiple projects. The pipelines are designed to automate the build, test, and deployment processes for JavaScript and Java applications using Maven. The repository includes configuration files for Jenkins, such as `jenkins.yml` and multiple `Jenkinsfile` scripts for different projects.

## Repository Structure

- `jenkins.yml`: Configuration file for Jenkins, including system settings, security settings, and tool installations.
- `Jenkinsfile`: Pipeline script for the main project.
- `jenkins_pipelines/repo1/Jenkinsfile`: Pipeline script for `repo1`.
- `jenkins_pipelines/repo2/Jenkinsfile`: Pipeline script for `repo2`.

## Prerequisites

- Jenkins installed and running.
- Docker installed and running.
- Git installed.
- Maven installed.
- Node.js and npm installed.
- SSH access to the SFTP server.

## Jenkins Configuration

### `jenkins.yml`

This file configures Jenkins with the following settings:

- **System Message**: Displays a message on the Jenkins dashboard.
- **Executors**: Sets the number of executors to 1.
- **SCM Checkout Retry Count**: Sets the retry count for SCM checkouts to 2.
- **Mode**: Sets Jenkins to NORMAL mode.
- **Security Realm**: Configures local security with no signup allowed and admin user credentials.
- **Authorization Strategy**: Allows logged-in users to do anything and disallows anonymous read access.
- **Tool Configuration**: Configures Git tool installation.
- **Unclassified Settings**: Configures Jenkins URL, mailer settings, and metrics reporters.

### `Jenkinsfile`

This file defines a Jenkins pipeline with the following stages:

1. **Checkout**: Clones the Git repository.
2. **SonarQube Analysis**: Runs SonarQube analysis using Maven.
3. **Run Docker Compose**: Starts Docker containers using `docker-compose`.
4. **NPM Test**: Installs npm dependencies and runs tests.
5. **NPM Build**: Builds the project using npm.
6. **Deploy via SFTP**: Deploys built files to an SFTP server.
7. **Post Actions**: Always runs `docker-compose down` and sends an email notification.

### `jenkins_pipelines/repo1/Jenkinsfile` and `jenkins_pipelines/repo2/Jenkinsfile`

These files define similar pipelines for `repo1` and `repo2` with the same stages as the main `Jenkinsfile`.

## How to Run

1. **Start Jenkins**: Ensure Jenkins is running.
2. **Configure Jenkins**:
   - Install the required plugins: Git, Maven Integration, NodeJS, Docker Pipeline, SonarQube Scanner, SSH Agent.
   - Configure the Jenkins URL, mailer settings, and metrics reporters as specified in `jenkins.yml`.
   - Set up credentials for SonarQube and SFTP.
3. **Create a Pipeline Job**:
   - Create a new pipeline job in Jenkins.
   - Configure the job to use the appropriate `Jenkinsfile` from this repository.
4. **Run the Pipeline**: Trigger the pipeline job to start the build, test, and deployment process.

## Plugins Used

- **Git Plugin**: Used for cloning the Git repository.
- **Maven Integration Plugin**: Used for running Maven commands.
- **NodeJS Plugin**: Used for running npm commands.
- **Docker Pipeline Plugin**: Used for managing Docker containers.
- **SonarQube Scanner Plugin**: Used for running SonarQube analysis.
- **SSH Agent Plugin**: Used for deploying files via SFTP.

## Environment Variables

- `GIT_REPO`: URL of the Git repository.
- `SONARQUBE_URL`: URL of the SonarQube server.
- `SONARQUBE_CREDENTIALS`: Credentials ID for SonarQube.
- `SFTP_SERVER`: SFTP server address.
- `SFTP_USER`: Credentials ID for SFTP user.
- `SFTP_PASSWORD`: Credentials ID for SFTP password.
- `SFTP_DESTINATION`: Destination path on the SFTP server.

## Contact

For any questions or issues, please contact the repository maintainer at `admin@example.com`.