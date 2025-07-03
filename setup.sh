#!/usr/bin/env bash

echo "🚀 Starting dotfiles setup..."
echo ""

TMPDIR=$(mktemp -d)
CURRENT=$PWD

cd $TMPDIR

echo "📁 Executing setup scripts from ~/.dotfiles/scripts/"
echo ""

for script in ~/.dotfiles/scripts/*; do
  if [ -f "$script" ]; then
    script_name=$(basename "$script")
    echo "▶️  Running: $script_name"
    echo "----------------------------------------"
    bash "$script"
    echo "✅ Completed: $script_name"
    echo ""
  fi
done

cd $CURRENT
rm -rf $TMPDIR

echo "🎉 Dotfiles setup complete!"
echo ""