#!/usr/bin/env bash
# Builds site/v5 from src/v5 (shared head, header, booking band and footer around each page).
# Change clinic details below, then run:  bash tools/build-v5.sh
set -euo pipefail
cd "$(dirname "$0")/.."

export BASE="/v5"

# ---- Clinic details (placeholders from the original site; replace with real ones) ----
export PHONE_DISPLAY="(555) 123-4567"
export PHONE_TEL="+15551234567"
export EMAIL="hello@eternawell.example"
export ADDRESS_1="123 Wellness Way, Suite 200"
export ADDRESS_2="Austin, TX 78701"
export PORTAL_URL="https://www.optimantra.com/optimus/om/patient/login"
export SHOP_SKIN_URL="https://your-clinic-shop.example/skin-hair"
export SHOP_SUPP_URL="https://your-clinic-shop.example/hormone-supplements"

# ---- Shared icons ----
export ARROW='<svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.8" aria-hidden="true"><path d="M2 8h11M9 4l4 4-4 4"/></svg>'
export CHECK='<svg viewBox="0 0 20 20" fill="none" stroke="currentColor" stroke-width="1.8" aria-hidden="true"><circle cx="10" cy="10" r="8.2"/><path d="M6.4 10.2l2.4 2.4 4.8-5"/></svg>'
export EXT='<svg class="ext-ic" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.8" aria-hidden="true"><path d="M6 3h7v7M13 3L4 12"/></svg>'

SRC=src/v5
OUT=site/v5

for page in "$SRC"/pages/*.html; do
  name=$(basename "$page" .html)
  export PAGE="$name"
  export TITLE="$(sed -n 's/^@title //p' "$page")"
  export DESC="$(sed -n 's/^@desc //p' "$page")"
  export SHAPE="$(sed -n 's/^@shape //p' "$page")"
  export CLASS="$(sed -n 's/^@class //p' "$page")"

  if [ "$name" = home ]; then
    dest="$OUT/index.html"
  else
    mkdir -p "$OUT/$name"
    dest="$OUT/$name/index.html"
  fi

  {
    cat "$SRC/partials/head.html" "$SRC/partials/header.html"
    grep -v '^@[a-z]' "$page"
    cat "$SRC/partials/footer.html"
  } | perl -pe 'if (/^\s*\@\@CTA\@\@\s*$/) { local $/; open my $f, "<", "src/v5/partials/cta.html" or die "missing cta.html\n"; $_ = <$f>; }' \
    | perl -pe 's/\{\{(\w+)\}\}/exists $ENV{$1} ? $ENV{$1} : die "unknown placeholder {{$1}}\n"/ge; s/data-page="\Q$ENV{PAGE}\E"/data-page="$ENV{PAGE}" aria-current="page"/g' \
    > "$dest"
  echo "built $dest"
done
