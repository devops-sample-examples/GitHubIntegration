#!/bin/bash

helper()
# Github api url
API_URL="https://api.github.com"

# Github username and token
USERNAME = $username
TOKEN = $token

user and repo information
REPO_OWNER = $1
REPO_NAME = $2

# Function to make a GET request to the GitHub API
function github_api_get {
      local endpoint = "$1" # first argument from function
      local url ="${API_URL}/${endpoint}"
      
       # Send a GET request to the GitHub API with authentication
      curl -u "${USERNAME}:${TOKEN}" "${url}"
}
# Function to list users with read access to the repository
function list_users_with_read_access {
        local endpoint = " /repos/{owner}/{repo}/collaborators"

        # Fetch the list of collaborators on the repository
        collaborators = "$(github_api_get "$endpoint" | jq -r '.[] | select (.permissions.pull == true) | .login')"

        # Display the list of collaborators with read access
        if [[ -z "$collaborators" ]]; then
        echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
        echo "$collaborators"
        fi
}

function helper{
       expected_cmd_args = 2
       #  --$#  -->list of command line arguments while giving the command
       if [$# -ne $expected_cmd_args]; then 
       echo "please execute the script with required cmd args"
       echo "asd"
}

# Main script

echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access


        


}
