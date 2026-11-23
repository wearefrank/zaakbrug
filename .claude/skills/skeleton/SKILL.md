---
name: skeleton
description: Way of working for projects based on the wearefrank/skeleton project template - docker compose file naming and structure, the 'frank' service name, merging skeleton updates, ADRs and commit conventions. Use when creating or changing compose files or other project template files, when aligning the project with the skeleton, or when asked how things are done in a skeleton based project.
---

# Skeleton way of working

Projects at WeAreFrank! are created from the project template [wearefrank/skeleton](https://github.com/wearefrank/skeleton).
The skeleton is the baseline: it stays up to date with the latest best practices, and projects merge its changes regularly.
Before creating or changing a template-type file, read the current version in the skeleton instead of relying on memory:

```
gh api repos/wearefrank/skeleton/contents/<path> --jq .content   # base64 encoded
```

Useful files: `compose.yaml`, `compose.frank.loc.yaml`, `.env.example`, `CONTRIBUTING.md`, `.github/workflows/`, `docs/decisions/`.
When the project deviates from the skeleton, prefer moving the project towards the skeleton. Record a deliberate deviation as an ADR when the project has `docs/decisions/` (see the `write-adr` skill of the skeleton).

## Docker Compose files

* **Naming:** `compose.<application/function>.yaml`, e.g. `compose.frank.loc.yaml` (local development) and `compose.openzaak.loc.yaml`.
* **Overrides:** a file that overrides or adds to another compose file gets a `.<override application/function>` suffix after the name of the file it builds on, e.g. `compose.frank.metrics.yaml` or `compose.frank.postgres.yaml`.
  An override only declares what it changes or adds, and has a header comment with the `docker compose -f ... up` command to use it.
  Project specific overrides live in `contrib/`.
* **Service name:** the Frank!Framework application service is called `frank`. This lets overrides be reused across projects.
  When a project still uses another name (e.g. the project name), rename the service to `frank` and keep the old hostname as a network alias, because a compose service key cannot be aliased.
* **No `container_name`:** let Docker Compose name containers so several copies of a stack can run side by side (e.g. in Git worktrees).
  Use service names (`docker compose exec frank ...`) and `docker compose up --wait` instead of container names.
* **Network:** the instance is on a network named `frank` with an alias `frank.localtest.me`. Publish ports with `"${PORT:-8080}:8080"`.
  Use `frank.localtest.me` instead of `localhost` when a component requires a canonical domain name.
* **Configuration through the environment:** `TZ`, `dtap.stage`, `VERSION`, `IMAGE_TAG` and `PORT` use `${VAR:-default}`. Document variables in `.env.example`.
* **Local development file** (`compose.frank.loc.yaml`): `build` with `pull: true`, `dtap.stage: LOC`, `ScanningDirectoryClassLoader`, and a `develop.watch` section that syncs, restarts or rebuilds on changes.
  Recommended command: `docker compose -f ./compose.frank.loc.yaml up --build --force-recreate --watch`.
* **Keep overrides independent:** an override only depends on services of the file it overrides, usually `frank`.
  A dependency on a project specific service (a database, an API under test) belongs in the compose file of that service.
* Pin versions of third-party images.
* Always validate with `docker compose <all -f files> config --quiet`, and check an override also works with `compose.yaml` when it is meant to be reusable.

## Merging changes from the skeleton

Merge the skeleton every one or two months, so the project does not drift away.
Add it as `upstream` (`https://github.com/wearefrank/skeleton.git`), fetch, create a branch and merge `upstream/main`.
The first time this needs `--allow-unrelated-histories`; the skeleton `CONTRIBUTING.md` explains why a one-time rebase onto the skeleton makes later merges easy.
Resolve conflicts by keeping project specific values (instance name, configuration name, images) and taking the skeleton for structure.

## Other conventions

* **Commits:** conventional commits. Releases are created automatically by CI, so write meaningful messages. A breaking change has `BREAKING: <description>` on the last line of the commit message.
* **ADRs:** record architecturally significant decisions in `docs/decisions/` with the `write-adr` skill. Projects that predate this (no `docs/decisions/`) pick it up by merging the skeleton.
* **Skills:** skills exist both in `.github/skills/` (GitHub Copilot) and `.claude/skills/` (Claude Code). Keep the two copies identical.
* **Documentation:** write conventions down in `CONTRIBUTING.md` and keep this skill in line with it.
