const inquirer = require('inquirer');
const db = require('./db');
const q = require('./queries');

async function start() {
  const realms = (await db.query(q.listRealms)).rows;
  const realmChoice = await inquirer.prompt([{ name: 'realm', type: 'list', choices: realms.map(r => ({ name: r.name, value: r.id })) }]);

  const characters = (await db.query(q.charactersByRealm, [realmChoice.realm])).rows;
  const charChoice = await inquirer.prompt([{ name: 'chars', type: 'list', choices: characters.map(c => ({ name: `${c.name} (${c.role})`, value: c.id })), validate: (a) => a.length > 0 || 'Select at least one character' }]);

  // items, quest title, confirm, and insert logic follow similar pattern
  const items = (await db.query(q.listItems)).rows;
  const itemChoice = await inquirer.prompt([{ name: 'items', type: 'checkbox', choices: items.map(i => ({ name: `${i.name} [${i.type}]`, value: i.id })), validate: (a) => a.length > 0 || 'Select at least one item' }]);

  const quests = (await db.query(q.getAllQuests)).rows;
  const questChoice = await inquirer.prompt([{ name: 'quest', type: 'list', choices: quests.map(q => ({ name: q.title, value: q.id })) }]);

  const confirm = await inquirer.prompt([{ name: 'confirm', type: 'confirm', message: `Assign ${itemChoice.items.length} items to ${charChoice.chars.length} characters for quest "${quests.find(q => q.id === questChoice.quest).title}"?` }]);

  if (confirm.confirm) {
  // Only run this code if they said yes
  for (const itemId of itemChoice.items) {
    await db.query(q.createQuestAssignment, [questChoice.quest, charChoice.char, itemId]);
      }
      console.log('Quest assignments created successfully!');
    } else {
      console.log('Quest assignment cancelled.');
    }
  
}

start();

