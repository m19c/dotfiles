github_clone_organization() {
  local organization=$1

  mkdir -p ~/Development/${organization}

  gh repo list ${organization} --limit 4000 | while read -r repository _; do
    echo $repository
    if test -d ~/Development/${repository}; then
      echo "${repository} already cloned"
    else
      echo "cloning ${repository}"
      gh repo clone "$repository" ~/Development/${repository}
      echo "${repository} cloned"
    fi
  done
}
