# Boardwalk Homebrew tap

Install the [`boardwalk` CLI](https://github.com/boardwalk-labs/cli) (`@boardwalk-labs/cli`):

```sh
brew install boardwalk-labs/tap/boardwalk
```

`Formula/boardwalk.rb` is bumped automatically by the CLI's release workflow (`bump-homebrew`) on
every tagged release, which rewrites the npm tarball `url` + `sha256` to the new version.
