# glebchek's dotfiles

Personal configs, managed with [dotbot](https://github.com/anishathalye/dotbot) and deployed with symlinks. Intended for work machines; nothing here is executed by the install script beyond linking files and the optional prompts described below.

## What's here

| Path | Deploys to | What it is |
|---|---|---|
| `gitconfig` | `~/.gitconfig` | git settings |
| `config/fish/` | `~/.config/fish/` | fish shell: [fisher](https://github.com/jorgebucaran/fisher) plugins, [starship](https://starship.rs) prompt, [mise](https://mise.jdx.dev) activation |
| `config/environment.d/` | `~/.config/environment.d/` | systemd user env (`SSH_AUTH_SOCK` for the ssh-agent unit) |
| `config/systemd/user/` | `~/.config/systemd/user/` | ssh-agent user unit |
| `config/mise/config.toml` | `~/.config/mise/config.toml` | global tools: node + global npm CLIs |
| `config/pi/` | `~/.pi/agent/`, `~/.agents/` | [pi](https://github.com/badlogic/pi-mono) coding agent config |

## Install

```bash
./install
```

Optional prompts along the way:

- **Local LLM server base URL** — if you have one (e.g. `http://10.0.0.2:8080/v1`), `~/.pi/agent/models.json` is generated from `config/pi/models.json.example`. Enter to skip: the machine stays on cloud providers only. The real `models.json` is machine-specific and gitignored.
- **mise install** — installs node and the global npm CLIs listed in `config/mise/config.toml`.
- **fisher update** — installs the fish plugins from `config/fish/fish_plugins`.

After ssh-agent changes: `systemctl --user enable --now ssh-agent`.

## pi coding agent

What's tracked:

- `settings.json` — **this file is the package sync**. `pi install <pkg>` writes the package list here; commit and the same packages appear on every machine. Packages are pinned to npm releases, not git HEAD — deliberately a step behind the bleeding edge. Updating a package = `pi install npm:<name>` (or bump the version yourself).
- `mcp.json` — MCP servers. Handled by `pi-mcp-adapter` (which replaces pi's built-in MCP support, hence `"-builtin:mcp"` in settings extensions).
- `AGENTS.md` — global agent instructions.
- `gemma-helper.md` — local subagent definition, linked to `~/.agents/`. Only usable where the local LLM server is reachable.
- `models.json.example` — template for local LLM providers; see the install prompt above.

Not tracked (per-machine): `auth.json` (log in with `pi` on each machine), `models.json`, sessions, caches. Skills are not tracked either — they are installed by the `bigpowers` and `skills` CLIs (both in the mise globals).

Note: if a machine already has pi installed via the standalone installer (`~/node`), remove that directory from PATH — node and pi should come from mise.

## Version managers

[mise](https://mise.jdx.dev) manages node and global npm CLIs (`mise use -g npm:<pkg>` survives node version switches, unlike plain `npm i -g`). `mise up` updates everything. It replaced asdf and covers what the old `npmrc` global-prefix hack did.
