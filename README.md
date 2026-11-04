# Eternawell-Clinic

Homepage designs for Eternawell Medical. Netlify publishes the `site/` folder (see `netlify.toml`).

| URL | Version |
|---|---|
| `/` | Version picker |
| `/v1-original/` | Original landing page (dark teal, 3D blob) |
| `/v2-glass/` | Glass refraction concept |
| `/v3-particles/` | Scroll-morphing particles, lilac palette |
| `/v4-particles-sage/` | Scroll-morphing particles, sage palette (latest) |

Other folders:
- `concepts/` — editable sources for the v2 and v4 concept pages (artifact format, no `<html>` wrapper)
- `notes/` — site review and redesign suggestions (not published)

Three.js 0.160.0 is vendored in `site/vendor/`, so the site has no runtime CDN dependency besides Google Fonts.
