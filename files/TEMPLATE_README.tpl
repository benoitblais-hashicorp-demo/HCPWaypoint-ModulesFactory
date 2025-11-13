# HCP Terraform Module Template

This HCP Waypoint template is use to provision a GitHub repository from a repository template and publish the module into HCP Terraform Private Registry.

## Overview

This template provisions a GitHub repository and publish the module into HCP Terraform Private Registry using a HashiCorp Terraform no-code module. It is designed to help developers being quickly able to create HCP Terraform Module.

### Features
*   Create and manage repository within your GitHub organization.
*   Configure branch protection for repository.
*   Configure GitHub team access.
*   Publish module into HCP Terraform Private Registry

## Usage

Instructions on how to use the template within the HCP Waypoint UI to create an application.

1.  Navigate to the **Templates** section in your HCP Waypoint dashboard.
2.  Select the **HCPTerraformModule** template.
3.  Follow the prompts to configure the application.

## Configure settings
*   `Application name`: Must be unique. It can be up to 50 characters and can only include letters, numbers, dashes, and underscores. It must be the same name as the module name and finished with `-module`.

### Required Inputs
*   `module_name` (string): The name the Terraform module.
*   `module_provider` (string): The main provider the module uses.

## Provisioned Resources

An overview of the main resources that will be created when an application is generated from this template.

*   `GitHub Repository`: A GitHub repository following the enterprise best practices for the configuraiton.
*   `Branch Protection`: A branch protection rule for the `main` branch.
*   `Team Repository`: Configure access to the repository.
*   `Registry Module`: Publish the module into the Private Module Registry.
*   `No-code Module`: If required, enable no-code option for the module.
