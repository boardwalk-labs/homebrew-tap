# Boardwalk Homebrew tap

Install the [`boardwalk` CLI](https://github.com/boardwalk-labs/cli) as a native single-file binary
(Bun-compiled — no Node required):

```sh
brew install boardwalk-labs/tap/boardwalk
```

`Formula/boardwalk.rb` is bumped automatically by the CLI's release workflow (`bump-homebrew`) on
every tagged release, which points each platform's `url` + `sha256` at that release's native
binaries.

The binary covers the control-plane commands (`deploy`, `run`, `runs`, `secrets`, …). `boardwalk
dev` and `boardwalk runner start` embed a local engine and need the Node build instead: `npm i -g
@boardwalk-labs/cli`.
