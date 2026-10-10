# Pulsewave Media — Starter prototype

Independent React/Vite app, with no LAYAA data or integration.

## Run locally

```bash
npm install
npm run dev
```

## Deploy demo to Cloudflare Pages

1. Push this folder to a new GitHub repository.
2. Cloudflare > Workers & Pages > Create > Pages > Connect Git.
3. Framework: Vite; build command `npm run build`; output directory `dist`.
4. Deploy. Do not use this demo for real agency operations: it uses browser-local storage.

## Already working in the demo

- Overview and client target cards
- Five dummy clients and sample reels
- Monthly English calendar, Nepali BS label where browser supports Intl calendar
- Add reels, assign demo team members, update status
- Manual posting confirmation, pending posts, approval queue
- Local browser persistence and responsive layout

## Required before production use

- Cloudflare D1 database and authenticated Worker APIs (schema in `worker/schema.sql`)
- Secure authentication, authorization, admin approval of users
- Persistent multi-user clients/posts/team CRUD
- Cron reminder scheduling, deduplication, time zone conversions
- In-app notification center backed by D1
- Browser push VAPID keys, subscription handling and delivery
- Email provider credentials and verified sender domain
- Post edit/reschedule, posting links, status audit, platform-specific posting status
- Reliable Nepali BS calendar conversion library for all browsers
- Drag-and-drop calendar, analytics, secure Drive link permissions
- Scheduled automatic posting integration in a future phase

Never expose private API keys in Vite frontend environment variables.
