# Correction options
setopt CORRECT              # Enable command correction
setopt CORRECT_ALL          # Enable correction for all arguments

# Directory navigation options
setopt AUTO_CD              # Change directory by just typing the directory name
setopt AUTO_PUSHD           # Automatically push directories to the stack
setopt PUSHD_IGNORE_DUPS    # Don't add duplicate directories to the stack
setopt PUSHDMINUS           # Make cd -1 go to most recent directory (reverse numbering)

# Globbing options
setopt NO_CASE_GLOB         # Disable case-insensitive globbing

# History options
setopt APPEND_HISTORY       # Append history to the history file, don't overwrite
setopt EXTENDED_HISTORY     # Save timestamped history entries
setopt HIST_EXPIRE_DUPS_FIRST  # Expire duplicate entries first when trimming history
setopt HIST_FIND_NO_DUPS    # Do not display duplicates during history search
setopt HIST_IGNORE_DUPS     # Ignore duplicate entries in history
setopt HIST_IGNORE_SPACE    # Don't record commands starting with a space (like HISTCONTROL=ignorespace)
setopt HIST_REDUCE_BLANKS   # Remove superfluous blanks from history entries
setopt HIST_SAVE_NO_DUPS    # Don't save duplicate entries to history file (like HISTCONTROL=erasedups)
setopt INC_APPEND_HISTORY   # Append to history file incrementally
setopt SHARE_HISTORY        # Share history across multiple sessions 