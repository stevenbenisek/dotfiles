# Git

git_checkout_fzf() {
  if [ $# -eq 0 ]; then
    local branch=$(git_refs | fzf)
    # Avoid error message if fzf is cancelled
    if [ -n "$branch" ]; then
      git checkout "$branch"
    fi
  else
    git checkout "$@"
  fi
}

git_push_origin_fzf() {
  if [ $# -eq 0 ]; then
    local branch=$(git_refs | fzf)
    # Avoid error message if fzf is cancelled
    if [ -n "$branch" ]; then
      git push origin "$branch"
    fi
  else
    git push origin "$@"
  fi
}

git_refs() {
  git for-each-ref --format="%(refname:short)" --sort=-committerdate refs/heads refs/tags
}

git_show_current_branch() {
  git branch --show-current
}

git_show_main_branch() {
  if git show-ref --quiet refs/heads/main; then
    echo main
  else
    echo master
  fi
}



