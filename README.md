# GitHub Actions Setup for Kamal 2 Deployment

This project includes a Ruby script to automate the creation of a GitHub Actions workflow for deploying with Kamal 2.

## Features

- Automatically creates a `.github/workflows/deploy.yml` file.
- Configures GitHub Actions to:
  - Run on `push` to the `main` branch or manually via `workflow_dispatch`.
  - Deploy your application using Kamal 2.

## Requirements

- Ruby 3.2 or compatible version.
- `kamal` gem installed.

## Usage

1. Save the `setup_github_actions.rb` script to your project directory.
2. Run the script:
   ```bash
   ruby setup_github_actions.rb
   ```
3. The GitHub Actions workflow file will be created at `.github/workflows/deploy.yml`.

## Configuring Repository Secrets

Add a repository secret named `KAMAL_DEPLOYMENT` in your GitHub repository:

1. Go to **Settings** > **Secrets and variables** > **Actions**.
2. Add a new secret:
   - **Name:** `KAMAL_DEPLOYMENT`
   - **Value:** Your Kamal deployment configuration.

## Customization

- Update the Ruby version in the workflow if needed.
- Add additional steps to the workflow for dependency installation or pre-deployment tasks.

## License

This project is licensed under the MIT License.
