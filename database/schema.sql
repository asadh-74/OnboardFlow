-- OnboardFlow keeps its tables in their own schema so it can share one PostgreSQL database with other projects.
CREATE SCHEMA IF NOT EXISTS onboardflow;
SET search_path TO onboardflow;

CREATE TABLE IF NOT EXISTS customers(
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(140) NOT NULL,
  email VARCHAR(180) UNIQUE,
  company VARCHAR(160),
  status VARCHAR(40) DEFAULT 'Active',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS workflow_executions(
  id BIGSERIAL PRIMARY KEY,
  run_id VARCHAR(80) UNIQUE NOT NULL,
  workflow VARCHAR(180) NOT NULL,
  status VARCHAR(30) NOT NULL,
  duration_ms BIGINT,
  started_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_exec_started ON workflow_executions(started_at DESC);
