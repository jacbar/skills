#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$SCRIPT_DIR/skills"

usage() {
    echo "Usage: $0 <target>"
    echo ""
    echo "Targets:"
    echo "  all       Install to all supported platforms"
    echo "  claude    Install to ~/.claude/skills/"
    echo "  codex     Install to ~/.codex/skills/"
    echo "  opencode  Install to ~/.config/opencode/skills/"
    echo ""
    echo "Examples:"
    echo "  $0 all"
    echo "  $0 claude"
    exit 1
}

install_to() {
    local target="$1"
    local dest="$2"

    echo "Installing skills to $target ($dest)..."

    mkdir -p "$dest"

    for skill_dir in "$SKILLS_DIR"/*/; do
        [ -d "$skill_dir" ] || continue
        skill_name="$(basename "$skill_dir")"
        echo "  Copying $skill_name..."
        cp -R "$skill_dir" "$dest/$skill_name"
    done

    echo "  Done."
}

[ -z "$1" ] && usage

TARGET="$1"

case "$TARGET" in
    claude)
        install_to "Claude Code" "$HOME/.claude/skills"
        ;;
    codex)
        install_to "Codex" "$HOME/.codex/skills"
        ;;
    opencode)
        install_to "OpenCode" "$HOME/.config/opencode/skills"
        ;;
    all)
        install_to "Claude Code" "$HOME/.claude/skills"
        install_to "Codex" "$HOME/.codex/skills"
        install_to "OpenCode" "$HOME/.config/opencode/skills"
        ;;
    *)
        echo "Error: Unknown target '$TARGET'"
        usage
        ;;
esac

echo ""
echo "Installation complete."
