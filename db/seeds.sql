-- seeds.sql
-- Sample data for fantasy realm management system

-- Clear existing data (in reverse order due to foreign keys)
TRUNCATE TABLE quests, characters, items, realms RESTART IDENTITY CASCADE;

-- Insert Realms
INSERT INTO realms (name, ruler, description) VALUES
('Florida', 'Bobby Johnson', 'A dubious kingdom shrouded in swamp and heat.'),
('The Shire', 'Bilbo', 'A funny little town with people who live in holes'),
('Hawkins', 'Eleven', 'A modest town haunted by an ancient curse'),
('Hyrule', 'Princess Zelda', 'A land of diverse geography under constant attack from evil'),
('Mushroom Kingdom', 'Toad', 'A simple kingdom of mushroom people');

-- Insert Characters
INSERT INTO characters (name, role, realm_id) VALUES
-- Florida
('Cysco', 'Maidenless Beggar', 1),
('Tom', 'Assassin', 1),
('Cleatus', 'Warrior', 1),
('Borg', 'Healer', 1),
-- The Shire
('Pippin', 'Maidenless Beggar', 2),
('Sam', 'Assassin', 2),
('Frodo', 'Warrior', 2),
('Merry', 'Healer', 2),
-- Hawkins
('Steve', 'Maidenless Beggar', 3),
('Joyce', 'Assassin', 3),
('Hopper', 'Warrior', 3),
('Lucas', 'Healer', 3),
-- Hyrule
('Ganondorf', 'Maidenless Beggar', 4),
('Sheik', 'Assassin', 4),
('Link', 'Warrior', 4),
('Navi', 'Healer', 4),
-- Mushroom Kingdom
('Mort', 'Maidenless Beggar', 5),
('Yogurt', 'Assassin', 5),
('Bozo', 'Warrior', 5),
('Frog', 'Healer', 5);

-- Insert Items
INSERT INTO items (name, type, power) VALUES
-- Weapons
('Master Sword', 'Weapon', 100),
('Sting', 'Weapon', 70),
('Pistol', 'Weapon', 100),
('Pool Noodle', 'Weapon', 3),
-- Armor
('Breastplate', 'Armor', 100),
('Greaves', 'Armor', 50),
('Zora Tunic', 'Armor', 100),
('Pool Floaties', 'Armor', 2),
-- Potions
('Lembas Bread', 'Potion', 100),
('Juice', 'Potion', 50),
('Red Potion', 'Potion', 100),
('Pool Water', 'Potion', 1);

-- Insert Quests
INSERT INTO quests (title, realm_id, created_at) VALUES
-- Florida
('Defeat an alligator', 1, CURRENT_TIMESTAMP),
('Climb a palm tree', 1, CURRENT_TIMESTAMP),
('Cleanse the swamp of mosquitos', 1, CURRENT_TIMESTAMP),
('Have a beach day', 1, CURRENT_TIMESTAMP),
-- The Shire
('Defend the shire from orcs', 2, CURRENT_TIMESTAMP),
('Go there and back again', 2, CURRENT_TIMESTAMP),
('Attend a birthday party', 2, CURRENT_TIMESTAMP),
('Destroy the ring', 2, CURRENT_TIMESTAMP),
-- Hawkins
('Find and destroy a demogorgon', 3, CURRENT_TIMESTAMP),
('Defeat the mindflayer', 3, CURRENT_TIMESTAMP),
('Retrieve will from the upside down', 3, CURRENT_TIMESTAMP),
('Go to the arcade', 3, CURRENT_TIMESTAMP),
-- Hyrule
('Save the princess', 4, CURRENT_TIMESTAMP),
('Save the princess again', 4, CURRENT_TIMESTAMP),
('Save the princess, yet again', 4, CURRENT_TIMESTAMP),
('You guessed it, save the princess', 4, CURRENT_TIMESTAMP),
-- Mushroom Kingdom
('Defend the kingdom from evil turtles', 5, CURRENT_TIMESTAMP),
('Stop Bowser from consuming the energy from stars', 5, CURRENT_TIMESTAMP),
('Help Mario learn to use his powers', 5, CURRENT_TIMESTAMP),
('Go to a party', 5, CURRENT_TIMESTAMP);

-- Display summary of inserted data
SELECT 'Data seeding completed successfully!' AS status;
SELECT COUNT(*) AS realm_count FROM realms;
SELECT COUNT(*) AS character_count FROM characters;
SELECT COUNT(*) AS item_count FROM items;
SELECT COUNT(*) AS quest_count FROM quests;