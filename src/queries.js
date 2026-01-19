const listRealms = `
SELECT id, name, ruler, description
FROM realms
ORDER BY name
`;

const getRealmById = `
SELECT id, name, ruler, description
FROM realms
WHERE id = $1
`;

const charactersByRealm = `
SELECT id, name, role 
FROM characters
WHERE realm_id = $1
ORDER BY name
`;

const getAllCharacters = `
SELECT id, name, role, realm_id
FROM characters
ORDER BY name
`;

const listItems =`
SELECT id, name, type, power
FROM items
ORDER BY name
`;

const getItemById = `
SELECT id, name, type, power
FROM items
WHERE id = $1
`;

// Quest queries
const createQuest = `
  INSERT INTO quests (title, realm_id, created_at) 
  VALUES ($1, $2, CURRENT_TIMESTAMP) 
  RETURNING id, title, realm_id, created_at
`;

const getAllQuests = `
  SELECT q.id, q.title, r.name as realm_name, q.created_at
  FROM quests q
  LEFT JOIN realms r ON q.realm_id = r.id
  ORDER BY q.created_at DESC
`;

// Quest assignment queries
const createQuestAssignment = `
  INSERT INTO quest_assignments (quest_id, character_id, item_id) 
  VALUES ($1, $2, $3) 
  RETURNING id
`;

const getQuestAssignments = `
  SELECT 
    qa.id,
    c.name as character_name,
    c.role as character_role,
    i.name as item_name,
    i.type as item_type,
    i.power as item_power
  FROM quest_assignments qa
  LEFT JOIN characters c ON qa.character_id = c.id
  LEFT JOIN items i ON qa.item_id = i.id
  WHERE qa.quest_id = $1
`;

module.exports = {
  listRealms,
  getRealmById,
  charactersByRealm,
  getAllCharacters,
  listItems,
  getItemById,
  createQuest,
  getAllQuests,
  createQuestAssignment,
  getQuestAssignments,
};