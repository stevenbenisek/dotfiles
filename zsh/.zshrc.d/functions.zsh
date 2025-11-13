# Git

git_branch_exists() {
  if git show-ref --quiet "refs/heads/$1"; then
    return 0
  else
    return 1
  fi
}

git_tag_exists() {
  if git show-ref --quiet "refs/tags/$1"; then
    return 0
  else
    return 1
  fi
}

git_ref_exists() {
  git_branch_exists "$1" || git_tag_exists "$1"
}

git_local_refs() {
  git for-each-ref --format="%(refname:short)" --sort=-committerdate refs/heads refs/tags
}

git_remote_refs() {
  git for-each-ref --format="%(refname:short)" --sort=-committerdate refs/remotes
}

git_strip_remote_prefix() {
  local remotes=$(git remote)

  while read -r ref; do
    local stripped="$ref"
    for remote in ${(f)remotes}; do
      stripped="${stripped#$remote/}"
    done
    if [[ "$ref" == */* ]]; then
      echo "$stripped"
    fi
  done
}

git_remote_refs_stripped() {
  git_remote_refs | git_strip_remote_prefix
}

git_checkout_branch_fzf() {
  # --query: Pre-fill search with first argument
  # --select-1: Auto-select if only one match
  local selected=$(git_local_refs | fzf --query="$1" --select-1)
  # Avoid error message if fzf is cancelled
  if [ -n "$selected" ]; then
    git checkout "$selected" "${@:2}"
  fi
}

git_checkout_new_branch_fzf() {
  # --query: Pre-fill search with first argument
  # --select-1: Auto-select if only one match
  local selected=$(git_remote_refs_stripped | fzf --query="$1" --select-1)
  # Avoid error message if fzf is cancelled
  if [ -n "$selected" ]; then
    git checkout "$selected" "${@:2}"
  fi
}

git_push_origin_fzf() {
  # --query: Pre-fill search with first argument
  # --select-1: Auto-select if only one match
  local selected=$(git_local_refs | fzf --query="$1" --select-1)
  # Avoid error message if fzf is cancelled
  if [ -n "$selected" ]; then
    git push origin "$selected" "${@:2}"
  fi
}

git_show_current_branch() {
  git branch --show-current
}

git_show_main_branch() {
  if git_branch_exists main; then
    echo main
  else
    echo master
  fi
}

# History

history_fzf() {
  # --tac: Reverse order (most recent first)
  # --no-sort: Keep chronological order, don't sort by relevance
  # --select-1: Auto-select if only one match
  # --query: Pre-fill search with all arguments as a single string
  local selected=$(history -n 0 | fzf --tac --no-sort --select-1 --query="$*")
  if [ -n "$selected" ]; then
    print -z "$selected"
  fi
}
