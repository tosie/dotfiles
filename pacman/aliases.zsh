# On recent ArchLinux systems, helix is not available via the `hx` command anymore.
if test "$(uname)" = "Linux"; then
  alias hx='helix'
fi
