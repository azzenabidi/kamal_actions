require 'fileutils'

def setup_github_actions
  workflow_dir = ".github/workflows"
  workflow_file = "#{workflow_dir}/deploy.yml"

  # Create the .github/workflows directory if it doesn't exist
  FileUtils.mkdir_p(workflow_dir)

  # Define the GitHub Actions workflow YAML content
  workflow_content = <<~YAML
    name: Deploy with Kamal

    on:
      push:
        branches:
          - main
      workflow_dispatch:

    jobs:
      deploy:
        runs-on: ubuntu-latest
        steps:
        - name: Checkout code
          uses: actions/checkout@v3

        - name: Set up Ruby
          uses: ruby/setup-ruby@v1
          with:
            ruby-version: '3.2' # Adjust to your Ruby version

        - name: Install Kamal
          run: |
            gem install kamal

        - name: Deploy with Kamal
          env:
            KAMAL_DEPLOYMENT: ${{ secrets.KAMAL_DEPLOYMENT }}
          run: |
            kamal deploy
  YAML

  # Write the workflow file
  File.open(workflow_file, "w") do |file|
    file.write(workflow_content)
  end

  puts "GitHub Actions workflow for Kamal deployment created at: #{workflow_file}"
end

# Run the setup
setup_github_actions
