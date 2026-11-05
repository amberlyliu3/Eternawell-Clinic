# Eternawell-Clinic

Homepage designs for Eternawell Medical. Netlify publishes the `site/` folder (see `netlify.toml`).

| URL | Version |
|---|---|
| `/` | Version picker |
| `/v1-original/` | Original landing page (dark teal, 3D blob) |
| `/v2-glass/` | Glass refraction concept |
| `/v3-particles/` | Scroll-morphing particles, lilac palette |
| `/v4-particles-sage/` | Scroll-morphing particles, sage palette |
| `/v5/` | Full multi-page site (Home, Services, About Us, Membership, Products, FAQ, Book) |
| `/v6/` | Editorial refinement of v5 with photography placeholders, latest |

Other folders:
- `src/v5/`, `src/v6/` + `tools/build.sh` — v5 and v6 are generated from shared templates. Edit pages or the clinic details at the top of the script, then run `bash tools/build.sh v6`
- Photos: each placeholder is a `<figure class="ph">` in `src/v6/pages/`. Put an `<img src="..." alt="...">` inside it and the placeholder styling hides itself
- `concepts/` — editable sources for the v2 and v4 concept pages (artifact format, no `<html>` wrapper)
- `notes/` — site review and redesign suggestions (not published)

Three.js 0.160.0 is vendored in `site/vendor/`, so the site has no runtime CDN dependency besides Google Fonts.
