# homebrew-gdgrep

Homebrew tap for [gdgrep](https://github.com/jeffscottbrown/gdgrep) — a fast,
friendly grep written in the [Jerry](https://github.com/jeffscottbrown/jerry-lang) language.

## Install

```sh
brew tap jeffscottbrown/gdgrep
brew install gdgrep
```

## Usage

```sh
gdgrep [-i] [-n] <pattern> [file ...]
```

| Flag | Description |
|------|-------------|
| `-i` | Case-insensitive matching |
| `-n` | Prefix each matching line with its line number |

## Update

```sh
brew update
brew upgrade gdgrep
```

## Formula maintenance

The formula in `Formula/gdgrep.rb` is updated automatically by the
[gdgrep release workflow](https://github.com/jeffscottbrown/gdgrep/blob/main/.github/workflows/release.yml)
whenever a new `v*.*.*` tag is pushed to the gdgrep repo. No manual edits
to this repository are needed for routine releases.
