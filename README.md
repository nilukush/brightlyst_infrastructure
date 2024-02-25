# DigitalOcean Terraform Configuration for Brightlyst

This repository contains the Terraform configuration files for provisioning infrastructure resources on DigitalOcean for the Brightlyst project. It's designed to create a secure, scalable, and highly available environment for deploying a web application.

## Project Overview

The Brightlyst Terraform project automates the deployment of a DigitalOcean Droplet within a Virtual Private Cloud (VPC), ensuring secure and isolated network traffic. It also sets up SSH access for secure remote management of the Droplet.

## Prerequisites

- **DigitalOcean Account**: You need an account on DigitalOcean. [Sign up here](https://cloud.digitalocean.com/registrations/new) if you haven't already.
- **DigitalOcean Personal Access Token**: Required for Terraform to authenticate with the DigitalOcean API. [Generate a token here](https://cloud.digitalocean.com/account/api/tokens).
- **SSH Key**: An SSH key added to your DigitalOcean account for secure access to your Droplets. [Instructions here](https://www.digitalocean.com/docs/droplets/how-to/add-ssh-keys/to-account/).

## Installation & Setup

### 1. Install Terraform

Ensure you have Terraform installed. [Download Terraform](https://www.terraform.io/downloads.html) and follow the installation instructions for your operating system.

### 2. Clone the Repository

Clone this repository to your local machine:

```sh
git clone --recurse-submodules git@github.com:nilukush/brightlyst_infrastructure.git
cd brightlyst-infrastructure
```

### 3. Configuration

Configure your project by editing the `terraform.tfvars` file with your DigitalOcean personal access token, SSH key fingerprint, and other customizable variables.

```hcl
do_token         = "your_digitalocean_personal_access_token"
region           = "nyc3"
image            = "ubuntu-20-04-x64"
size             = "s-1vcpu-1gb"
ssh_fingerprint  = "your_ssh_key_fingerprint"
```

**Note**: Do not commit `terraform.tfvars` to version control to keep your secrets secure.

### 4. Initialize Terraform

Run Terraform's `init` command to prepare your project for deployment:

```sh
terraform init
```

### 5. Deploy Infrastructure

Preview the changes Terraform will make with the `plan` command:

```sh
terraform plan
```

Apply the changes to provision your DigitalOcean infrastructure:

```sh
terraform apply
```

Confirm the action at the prompt, and Terraform will begin provisioning your resources.

## Database Setup

This project includes configuration for setting up a MySQL database and tables required for the application:

- The database is automatically created through Terraform using the `mysql_database` resource.
- Tables are set up using a `null_resource` with a `local-exec` provisioner that executes MySQL commands.

### Prerequisites for Database Setup

- MySQL CLI tool installed for manual database operations.
- `doctl` installed for managing DigitalOcean resources directly if needed.

### Manual Steps

If manual database or table setup is required, execute the following command:

```sh
mysql --host=[HOSTNAME] --port=25060 --user=[USERNAME] --password=[PASSWORD] --ssl-ca=[PATH_TO_CA_CERTIFICATE] -e "[SQL_COMMAND]"

---

## Managing Infrastructure

- **View Infrastructure**: Check the current state of your infrastructure using `terraform show`.
- **Update Infrastructure**: Modify your configuration files and run `terraform apply` to update your infrastructure.
- **Destroy Infrastructure**: Remove all the infrastructure resources managed by Terraform with `terraform destroy`.

## Security

Ensure your `terraform.tfvars` and any `.tfstate` files are excluded from version control by including them in your `.gitignore` file. Manage secrets securely and consider using a secrets manager for sensitive information.

## Support & Contributing

For support, contact the project maintainers or submit an issue on the GitHub repository issue tracker.

Contributions to this project are welcome! Please fork the repository and submit a pull request with your proposed changes.

## License

This project is open-sourced under the MIT License. See the [LICENSE](LICENSE) file for details.