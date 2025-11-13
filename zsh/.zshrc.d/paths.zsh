# Path configuration
path=(
  $HOME/.local/bin
  $path
)

# Remove duplicates from paths
# Note: Use lowercase (fpath/path) because they're arrays tied to uppercase env vars (FPATH/PATH)
# typeset -U works on arrays, and changes automatically sync to the uppercase versions
typeset -U fpath
typeset -U path
