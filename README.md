# Testing AWS provider with Terraform

Basic example of how to use modules in Terraform, interacting with
`AWS` cloud provider.

> If you don't have an `AWS` account just click [here](https://aws.amazon.com/account/), click on the top right corner and follow the steps provided.

## Requirements

The basic requirements to run this project are:

* An `AWS` account (**dahhh**).
* Terraform version `>= 0.12`.
* git `latest` version (**recommended**).

## Project structure

This project is composed with:

* A main project (**terraform** folder)
* Single module example (**terraform/modules/aws_ec2** folder)

Each folder has their own files:

* **main<span></span>.tf** - main project code, where the resource/modules will be called
* **variables<span></span>.tf** - project variables, where all the dynamic parameters can be specified
* **outputs<span></span>.tf** - project outputs, where all the output information that we meed to obtain, can be specified

## Deploy project

Steps needed in order to deploy the project.

### Clone project

First of all, clone the project repository:

```bash
git clone https://github.com/aanogueira/testing_aws.git; cd testing_aws/terraform
```

### Initialize modules

Once he have the code and before we can deploy anything, we need to initialize the modules:

```bash
cd modules/aws_ec2
terraform init
```

Once that's finished, we can go back to our main terraform project.

```bash
cd ../..
```

### Setup Terraform credentials

We'll need to access our `AWS` console, navigate to our **account name**,
on the dropdown select **security_credentials**, navigate to access keys, select **Create New Access Key**
and you'll be presented with a prompt where you can see your new *access_key* and *secret_key*.

> Copy them and save them, once you close the prompt you won't be able to see them again and you'll need to generate new ones.

Now, in order to access our remote `AWS` project, we'll need to setup the credentials. We can do it
in multiple ways. Below I'll present you with some alternatives.

#### Inject to the code (bad approach)

Now that we have the credentials, we can access the `AWS`. To do it so, open and change
the **terraform/main.tf** file:

```json
provider "aws" {
  region     = var.aws_region
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}
```

> This approach isn't recommended since we are exposing our information in the code. If we decide to publish it, anyone with acces to the project will be able to see our private credentials.

#### Setup with AWS CLI

Before we begin, we'll need to download the `AWS` CLI. To do it so by following the steps
on [this](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) link.

Once we have it installed on our machine, we can simply type:

```bash
aws configure
```

And fill with the required information.

### Initialize project

Now that we have the credentials setup, we can initialize our main project. Like we did in with modules,
we just need to type:

```bash
terraform init
```

### Change variables

In order to fit our need, we can change the instance properties by changing the  **terraform/variables.tf** values:

```json
# Region of the project
variable "aws_region" {
  type        = string
  description = "Project region."
  default     = "us-west-2" # Updated with your region
}

# ID of the instance to be created
variable "aws_ami" {
  type        = string
  description = "Instance ami ID."
  default     = "ami-082335b69bcfdb15b" # This might need to be updated since they are constantly changing
}

# Type of the instance to be created
variable "aws_type" {
  type        = string
  description = "Instance type."
  default     = "t2.micro" # Updated with your desired instance type (this one is present in the free tier)
}
```

> For example proposes, I've left some default values. The instance selected won't be charged since is in the free tier.

### Validate project

Before we can deploy our project, it's a good practice to validate it. To do it so we just need to type:

```bash
terraform validate
```

This will output the resources that will be created, teh ones that wil be changed as well as the ones
that wil be deleted.

If everything went well, we should see that only **1** resource will be created.

### Apply project

Finally we can deploy the project. To do it so, we can type:

```bash
terraform apply
```

A better approach would be to generate a file from the plan option and apply it afterwards:

```bash
terraform plan -out tfplan
terraform apply tfplan
```

Aaaaand congratulations! You just deployed your `EC2` instance in your `AWS` project!

### Destroy project

Once we validated that our project was created and we don't need it no more, we can destroy it by typing:

```bash
terraform destroy
```
