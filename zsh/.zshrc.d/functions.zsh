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

git_refs() {
  git for-each-ref --format="%(refname:short)" --sort=-committerdate refs/heads refs/tags
}

git_ref_fzf() {
  # --query: Pre-fill search with first argument
  # --select-1: Auto-select if only one match
  git_refs | fzf --query="$1" --select-1
}

git_fzf() {
  local cmd="$1"
  local refname="$2"
  local ref=$(git_ref_fzf "$refname")
  # Avoid error message if fzf is cancelled
  if [ -n "$ref" ]; then
    git "$cmd" "$ref" "${@:3}"
  fi
}

git_checkout_fzf() {
  git_fzf checkout "$@"
}

git_push_origin_fzf() {
  git_fzf "push origin" "$@"
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
