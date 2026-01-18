DROP TABLE IF EXISTS realms
DROP TABLE IF EXISTS characters
DROP TABLE IF EXISTS items
DROP TABLE IF EXISTS quests

CREATE TABLE realms (
    id SERIAL PRIMARY KEY, 
    name VARCHAR(100) NOT NULL, 
    ruler VARCHAR(100), 
    description TEXT
);

CREATE TABLE characters (
    id SERIAL PRIMARY KEY, 
    name VARCHAR(100) NOT NULL, 
    ruler VARCHAR(100), 
    description TEXT
);

CREATE TABLE items (
    id SERIAL PRIMARY KEY, 
    name VARCHAR(100) NOT NULL, 
    type VARCHAR(100),
    power INTEGER
);

CREATE TABLE quests (
    id SERIAL PRIMARY KEY, 
    title VARCHAR(150) NOT NULL,
    realm_id INTEGER REFERENCES realms(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_characters_realm_id ON characters(realm_id);
CREATE INDEX idx_quests_realm_id ON quests(realm_id);
CREATE INDEX idx_quests_created_at ON quests(created_at);