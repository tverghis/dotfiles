set -Ua SSH_KEYS_TO_AUTOLOAD ~/.ssh/id_ed25519

if status --is-interactive
    set -l keychain_output (keychain --eval $SSH_KEYS_TO_AUTOLOAD 2>/dev/null)
    eval $keychain_output
end
