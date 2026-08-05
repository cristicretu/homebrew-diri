# homebrew-diri

Homebrew tap for [diri](https://github.com/cristicretu/diri) — a native macOS
orchestrator for coding agents.

```sh
brew install --cask cristicretu/diri/diri
```

The tap has to be named in full. A bare `diri` only resolves against Homebrew's
default taps, and on Homebrew 6 a bare name also trips the third-party trust
gate — naming the tap explicitly is what counts as intent:

```
Error: Refusing to load cask cristicretu/diri/diri from untrusted tap cristicretu/diri.
```

If you would rather type `brew install --cask diri`, trust the tap once:

```sh
brew tap cristicretu/diri
brew trust cristicretu/diri
brew install --cask diri
```

## Updating

The cask is a tap rather than a submission to `homebrew-cask` because that
requires a notability threshold diri does not meet yet.

diri updates itself, so the cask declares `auto_updates true`: Homebrew installs
it once and then stays out of the way. `brew upgrade` will not clobber a build
the app updated itself to, and `brew outdated` will not report a version skew
that is not really stale. Reinstalling explicitly still works:

```sh
brew reinstall --cask diri
```

`diri/scripts/release.sh` in the main repo bumps the version and sha256 here on
every release, so this tap should never be edited by hand.

## Uninstalling

```sh
brew uninstall --cask diri
```

`brew uninstall --zap --cask diri` also removes diri's own preferences and
caches. It deliberately leaves `~/Library/Application Support/Dirijor` alone:
that is the daemon's state — session records, hosts, live holder specs — and it
is shared with the legacy Dirijor.app. Removing the client should not destroy
your sessions.
