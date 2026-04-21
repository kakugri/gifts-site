#!/usr/bin/env bash

set -euo pipefail

site_dir="$(cd "$(dirname "$0")" && pwd)"

required_files=(
  "$site_dir/index.html"
  "$site_dir/technology.html"
  "$site_dir/publications.html"
  "$site_dir/prototype.html"
  "$site_dir/contact.html"
  "$site_dir/404.html"
  "$site_dir/styles.css"
  "$site_dir/robots.txt"
  "$site_dir/sitemap.xml"
  "$site_dir/.nojekyll"
  "$site_dir/assets/WJARR-2026-0212.pdf"
  "$site_dir/assets/MD.pdf"
  "$site_dir/assets/GIFTS.pdf"
  "$site_dir/assets/GIFTS.py"
)

for path in "${required_files[@]}"; do
  if [[ ! -e "$path" ]]; then
    echo "Missing required site file: $path" >&2
    exit 1
  fi
done

status=0

for html in "$site_dir"/*.html; do
  while IFS= read -r href; do
    case "$href" in
      "" | \#* | http://* | https://* | mailto:* | tel:*)
        continue
        ;;
    esac

    target="$site_dir/$href"
    if [[ ! -e "$target" ]]; then
      echo "Broken local reference in $(basename "$html"): $href" >&2
      status=1
    fi
  done < <(grep -oE 'href="[^"]+"' "$html" | sed 's/^href="//; s/"$//')
done

if [[ "$status" -eq 0 ]]; then
  echo "GIFTS site preflight check passed."
fi

exit "$status"
