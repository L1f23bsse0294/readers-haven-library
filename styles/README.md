# Readers' Haven Public Library

Static informational website for the (fictional) Readers' Haven Public Library, containerized with Docker.
DevOps Fundamentals (SEST4663) - Assignment 02.

- Plain HTML + CSS (no JavaScript)
- Built with [Parcel](https://parceljs.org/) into `dist/`
- Served by Nginx from a multi-stage Docker image

## Pages

| Page | File | Owner |
|------|------|-------|
| Home | `src/index.html` | Team Lead |
| Collections | `src/collections.html` | Member 1 |
| Membership | `src/membership.html` | Member 2 |
| Digital Services | `src/services.html` | Member 3 |
| Contact & Feedback | `src/contact.html` | Member 4 |

All pages link the shared `styles/style.css` (colours, fonts, header, nav, footer),
plus their own page stylesheet:

| Page | Stylesheet |
|------|-----------|
| Home | `styles/home.css` |
| Collections | `styles/collections.css` |
| Membership | `styles/membership.css` |
| Digital Services | `styles/services.css` |
| Contact | `styles/contact.css` |

## Build locally

```bash
npm ci
npm run build      # output goes to dist/
```

## Run with Docker

```bash
docker image build -t <dockerhub-username>/readers-haven:v1 .
docker container run -d --name readers-haven -p 8080:80 <dockerhub-username>/readers-haven:v1
```

Then open http://localhost:8080

## Final image

```bash
docker image pull <tl-username>/readers-haven-final:v2.0
docker container run -d --name haven-final -p 8090:80 <tl-username>/readers-haven-final:v2.0
```

## Branches

- `main` - production-ready code (3 approvals to merge)
- `develop` - integration branch (2 approvals to merge)
- `feature/<page-name>` - one per member
- `release/v2.0` - final testing before main

## Image credits

Book covers: Open Library Covers API. Photos: Lorem Picsum.
