DROP TABLE IF EXISTS quest_assignments CASCADE;
DROP TABLE IF EXISTS quests CASCADE;
DROP TABLE IF EXISTS items CASCADE;
DROP TABLE IF EXISTS characters CASCADE;
DROP TABLE IF EXISTS realms CASCADE;

CREATE TABLE realms (
    id SERIAL PRIMARY KEY, 
    name VARCHAR(100) NOT NULL, 
    ruler VARCHAR(100), 
    description TEXT
);

CREATE TABLE characters (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(50),  -- e.g., Knight, Mage, Rogue
    realm_id INTEGER REFERENCES realms(id) ON DELETE SET NULL
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

CREATE TABLE quest_assignments (
    id SERIAL PRIMARY KEY,
    quest_id INTEGER REFERENCES quests(id) ON DELETE CASCADE,
    character_id INTEGER REFERENCES characters(id) ON DELETE CASCADE,
    item_id INTEGER REFERENCES items(id) ON DELETE SET NULL
);

CREATE INDEX idx_characters_realm_id ON characters(realm_id);
CREATE INDEX idx_quests_realm_id ON quests(realm_id);
CREATE INDEX idx_quests_created_at ON quests(created_at);
CREATE INDEX idx_quest_assignments_quest_id ON quest_assignments(quest_id);
CREATE INDEX idx_quest_assignments_character_id ON quest_assignments(character_id);