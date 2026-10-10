-- Cloudflare D1 schema for production implementation (not connected to demo UI)
CREATE TABLE users (id TEXT PRIMARY KEY,email TEXT NOT NULL UNIQUE,display_name TEXT NOT NULL,role TEXT NOT NULL CHECK(role IN ('admin','member')),active INTEGER NOT NULL DEFAULT 1,created_at TEXT NOT NULL);
CREATE TABLE clients (id TEXT PRIMARY KEY,name TEXT NOT NULL,monthly_target INTEGER NOT NULL DEFAULT 0,active INTEGER NOT NULL DEFAULT 1,created_at TEXT NOT NULL);
CREATE TABLE posts (id TEXT PRIMARY KEY,client_id TEXT NOT NULL REFERENCES clients(id),title TEXT NOT NULL,status TEXT NOT NULL,assignee_id TEXT REFERENCES users(id),scheduled_at_utc TEXT,posted_at_utc TEXT,platforms_json TEXT NOT NULL DEFAULT '[]',published_links_json TEXT NOT NULL DEFAULT '{}',drive_url TEXT,created_at TEXT NOT NULL,updated_at TEXT NOT NULL);
CREATE TABLE notifications (id TEXT PRIMARY KEY,user_id TEXT NOT NULL REFERENCES users(id),post_id TEXT REFERENCES posts(id),channel TEXT NOT NULL,kind TEXT NOT NULL,due_at_utc TEXT NOT NULL,sent_at_utc TEXT,read_at_utc TEXT,unique_key TEXT NOT NULL UNIQUE);
CREATE TABLE push_subscriptions (id TEXT PRIMARY KEY,user_id TEXT NOT NULL REFERENCES users(id),endpoint TEXT NOT NULL UNIQUE,p256dh TEXT NOT NULL,auth TEXT NOT NULL,created_at TEXT NOT NULL);
CREATE TABLE activity_log (id TEXT PRIMARY KEY,actor_id TEXT REFERENCES users(id),post_id TEXT REFERENCES posts(id),action TEXT NOT NULL,details_json TEXT,created_at TEXT NOT NULL);
CREATE INDEX idx_posts_scheduled ON posts(scheduled_at_utc,status);
CREATE INDEX idx_notifications_due ON notifications(due_at_utc,sent_at_utc);
