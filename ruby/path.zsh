ZBAR_LIB_FILE=/opt/homebrew/lib/libzbar.dylib
if [[ "$(uname -sp)" == "Darwin arm" ]] && [[ -f "$ZBAR_LIB_FILE" ]]; then
  export ZBAR_LIB=$ZBAR_LIB_FILE
fi
