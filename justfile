target := "$HOME"

stow dir:
    @stow {{dir}} --target {{target}} --verbose

unstow dir:
    @stow --delete {{dir}} --target {{target}} --verbose
