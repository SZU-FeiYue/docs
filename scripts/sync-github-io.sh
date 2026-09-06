#!/usr/bin/env bash
# Build this handbook and publish site/ to the org Pages repo
# SZU-FeiYue/SZU-FeiYue.github.io → https://szu-feiyue.github.io
#
# Usage:
#   ./scripts/sync-github-io.sh              # build, commit, push
#   ./scripts/sync-github-io.sh --skip-build # reuse existing site/
#   ./scripts/sync-github-io.sh --no-push    # commit only
#   ./scripts/sync-github-io.sh --dry-run    # show the file sync, do not commit
#
# Env:
#   PAGES_REPO    clone URL (default: git@github.com:SZU-FeiYue/SZU-FeiYue.github.io.git)
#   PAGES_BRANCH  target branch (default: main)
#   PAGES_DIR     working clone (default: <repo>/.cache/SZU-FeiYue.github.io)

set -euo pipefail

SKIP_BUILD=0
DO_PUSH=1
DRY_RUN=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --skip-build) SKIP_BUILD=1 ;;
    --no-push) DO_PUSH=0 ;;
    --dry-run) DRY_RUN=1 ;;
    -h|--help)
      sed -n '2,16p' "$0"
      exit 0
      ;;
    *)
      echo "unknown argument: $1" >&2
      exit 2
      ;;
  esac
  shift
done

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SITE_DIR="${ROOT}/site"
PAGES_REPO="${PAGES_REPO:-git@github.com:SZU-FeiYue/SZU-FeiYue.github.io.git}"
PAGES_BRANCH="${PAGES_BRANCH:-main}"
PAGES_DIR="${PAGES_DIR:-${ROOT}/.cache/SZU-FeiYue.github.io}"

cd "$ROOT"

if [[ "$SKIP_BUILD" -eq 0 ]]; then
  echo ">> mkdocs build"
  mkdocs build
fi

if [[ ! -f "${SITE_DIR}/index.html" ]]; then
  echo "site/index.html is missing; run without --skip-build" >&2
  exit 1
fi

# GitHub Pages treats the site as Jekyll unless this file exists.
: > "${SITE_DIR}/.nojekyll"

if [[ ! -d "${PAGES_DIR}/.git" ]]; then
  echo ">> clone ${PAGES_REPO}"
  mkdir -p "$(dirname "$PAGES_DIR")"
  git clone --branch "$PAGES_BRANCH" --single-branch "$PAGES_REPO" "$PAGES_DIR"
else
  echo ">> update ${PAGES_DIR}"
  git -C "$PAGES_DIR" remote set-url origin "$PAGES_REPO"
  git -C "$PAGES_DIR" fetch origin "$PAGES_BRANCH"
  git -C "$PAGES_DIR" checkout "$PAGES_BRANCH"
  git -C "$PAGES_DIR" pull --ff-only origin "$PAGES_BRANCH"
fi

echo ">> rsync site/ → Pages repo"
RSYNC_FLAGS=(-a --delete --human-readable)
if [[ "$DRY_RUN" -eq 1 ]]; then
  RSYNC_FLAGS+=(--dry-run --itemize-changes)
fi

# Keep Pages-only files that MkDocs does not generate.
rsync "${RSYNC_FLAGS[@]}" \
  --exclude '.git/' \
  --exclude '.github/' \
  --exclude 'CNAME' \
  --exclude 'LICENSE' \
  --exclude 'README.md' \
  --exclude 'readme.md' \
  "${SITE_DIR}/" "${PAGES_DIR}/"

if [[ "$DRY_RUN" -eq 1 ]]; then
  echo "dry-run finished; nothing committed"
  exit 0
fi

SOURCE_SHA="$(git -C "$ROOT" rev-parse HEAD)"
SOURCE_SHORT="$(git -C "$ROOT" rev-parse --short HEAD)"
MSG="Sync site from docs@${SOURCE_SHORT}

Source: https://github.com/SZU-FeiYue/docs/commit/${SOURCE_SHA}"

git -C "$PAGES_DIR" add -A
if git -C "$PAGES_DIR" diff --cached --quiet; then
  echo "Pages repo already matches site/; nothing to commit"
  exit 0
fi

git -C "$PAGES_DIR" commit -m "$MSG"
echo ">> committed in ${PAGES_DIR}"

if [[ "$DO_PUSH" -eq 1 ]]; then
  echo ">> push origin ${PAGES_BRANCH}"
  git -C "$PAGES_DIR" push origin "$PAGES_BRANCH"
  echo "live site: https://szu-feiyue.github.io"
else
  echo "commit kept locally; push with: git -C ${PAGES_DIR} push origin ${PAGES_BRANCH}"
fi
