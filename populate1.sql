PRAGMA foreign_keys = ON;

INSERT INTO Player (IdPlayer, Username, Email, Hashed_Password) VALUES
(1, 'PeterPan1', 'peter1pan@gmail.com', 'QWrfwqrqwd'),
(2, 'EdwardGamer1', 'edwardg1@gmail.com', 'powOiwndN'),
(3, 'JamesWeston88', 'jwest88@gmail.com', 'po1NWISNN'),
(4, 'HannahB32', 'ab2345_@gmail.com', 'PEndqoir134@'),
(5, 'XicoFrancis22', 'franciscodpfsousa@hotmail.com', 'QP_.3123cG'),
(6, 'MopinsP1', 'eduamope221@gmail.com', 'qowiej23WW'),
(7, 'Pruenca13', 'pruencaiscool1@gmail.com', 'Po21PQWEda'),
(8, 'user1', 'user1@hotmail.com', 'Plufu#'),
(9, 'Darkguest', 'darkgues@gmail.com', 'LPnjads'),
(10, 'LunaStar42', 'lunastar@gmail.com', 'qwP12uZq!');

INSERT INTO Inventory (IdInventory, Max_Cap) VALUES
(1, 200),
(2, 100),
(3, 125),
(4, 170),
(5, 135),
(6, 185),
(7, 200),
(8, 120),
(9, 150),
(10, 152),
(11, 105),
(12, 150);

INSERT INTO Types (IdType, Type_Name, Ability) VALUES
(1, 'Paladin', 'Healers will heal 25% more.'),
(2, 'Mage', 'Magical abilities deal 15% true damage.'),
(3, 'Fiend', 'Abiity to pick locks.'),
(4, 'Warlock', 'Gain 30% more xp when killing monsters.'),
(5, 'Priest', 'Immune to confused.'),
(6, 'Barbarian', 'Deal 30% more damage with slashing and blunt types.'),
(7, 'Druid', 'Friendly mob presence provides 10% hp boost.'),
(8, 'Ranger', 'Deals 10% more damage with ranged non-magical weapons.');

INSERT INTO Characters (IdCharacter, IdPlayer, IdType, IdInventory, Character_Name, HP, XP, Gold, Status_Effect) VALUES
(1, 1, 1, 1, 'Garen', 150, 25, 560, 'FINE'),
(2, 2, 2, 2, 'Feron', 100, 22, 890, 'CONFUSED'),
(3, 3, 5, 3, 'Henry', 125, 24, 200, 'FINE'),
(4, 3, 6, 4, 'Gote', 170, 26, 40, 'BURNED'),
(5, 4, 8, 5, 'Arrowhead', 100, 13, 240, 'FINE'),
(6, 5, 4, 6, 'Poko', 85, 10, 670, 'POISONED'),
(7, 6, 3, 7, 'Yaru', 120, 29, 900, 'FINE'),
(8, 6, 2, 8, 'Dumbledore', 95, 8, 110, 'FINE'),
(9, 7, 7, 9, 'Loros', 150, 31, 1007, 'STUNNED'),
(10, 8, 3, 10, 'Aldric', 110, 18, 400, 'FINE'),
(11, 9, 5, 11, 'Serena', 135, 27, 750, 'BURNED'),
(12, 10, 1, 12, 'Aria', 155, 30, 890, 'FINE');

INSERT INTO World (IdWorld, World_Name, Region, Environment, IdCharacter) VALUES 
(1, 'Emerald Forest', 'Northern Realm', 'Forest', 1),
(2, 'Crystal Lake', 'Eastern Valley', 'Lake', 2),
(3, 'Shadow Mountains', 'Western Highlands', 'Mountain', NULL),
(4, 'Mystic Desert', 'Southern Sands', 'Desert', 3),
(5, 'Frozen Wasteland', 'Arctic Zone', 'Tundra', 9),
(6, 'Sunken City', 'Underwater Depths', 'Aquatic', 12),
(7, 'Sky Isles', 'Celestial Region', 'Floating Islands', 8);

INSERT INTO Quest (IdQuest, Quest_Description, Gold_Reward, Xp_Reward, IdWorld) VALUES
(1, 'Protect the Emerald Forest from the Darkling Invasion', 300, 600, 1),
(2, 'Retrieve the Crystal Artefact from the Depths of Crystal Lake', 400, 800, 2),
(3, 'Conquer the Shadowy Beasts lurking in the Shadow Mountains', 500, 1000, 3),
(4, 'Find the Lost Oasis in the Mystic Desert', 250, 500, 4),
(5, 'Survive the Frigid Challenges of the Frozen Wasteland', 450, 900, 5),
(6, 'Discover the Sunken Mysteries of the Sunken City', 350, 700, 6),
(7, 'Ascend to the Sky Isles and Uncover the Celestial Secrets', 600, 1200, 7),
(8, 'Navigate the Treacherous Volcanic Fields and Forge a Legendary Weapon', 700, 1400, 2),
(9, 'Explore the Ancient Ruins to Reveal Forgotten Truths', 300, 600, 4),
(10, 'Guard the Enchanted Woods against the Dark Forces', 400, 800, 5);


INSERT INTO Character_Quest (IdQuest, IdCharacter, Quest_Status) VALUES
(1, 1, 'IN PROGRESS'),
(2, 2, 'SUSPENDED'),
(3, 4, 'COMPLETED'),
(4, 5, 'SUSPENDED'),
(5, 3, 'IN PROGRESS'),
(6, 4, 'SUSPENDED'),
(7, 7, 'COMPLETED'),
(8, 7, 'IN PROGRESS'),
(9, 9, 'SUSPENDED'),
(10, 10, 'COMPLETED');

INSERT INTO Item (IdItem, Item_Name, Item_Description, Item_Value, IdInventory, IdQuest, IdType) VALUES
(1, 'Sword of Light', 'A legendary sword imbued with light magic.', 500, NULL, 1, 1),
(2, 'Shadow Dagger', 'A small dagger that thrives in darkness.', 300, NULL, 4, 2),
(3, 'Healing Potion', 'Restores 50 HP.', 50, 2, 3, 3),
(4, 'Mystic Robe', 'A robe that enhances magical abilities.', 450, 3, 4, 4),
(5, 'Fire Scroll', 'A scroll that casts a powerful fire spell.', 200, NULL, 2, 5),
(6, 'Dragon Armor', 'Armor made from dragon scales.', 800, NULL, NULL, 6),
(7, 'Silver Bow', 'A bow crafted from fine silver.', 350, NULL, 6, 7),
(8, 'Crystal Shield', 'A shield made from enchanted crystal.', 400, 5, 7, 8),
(9, 'Invisibility Cloak', 'A cloak that renders the wearer invisible.', 600, NULL, 7, 1),
(10, 'Thunder Axe', 'An axe that summons thunder.', 550, NULL, NULL, 2),
(11, 'Golden Apple', 'A rare apple that boosts health.', 250, NULL, 9, 3),
(12, 'Phoenix Feather', 'A feather from a mythical phoenix.', 300, 7, 10, 4),
(13, 'Wizard Staff', 'A staff used by powerful wizards.', 700, NULL, 10, 5),
(14, 'Vampire Fangs', 'Fangs that grant vampiric powers.', 450, 8, 10, 6);

INSERT INTO shield (IdItem, Shield_Block) 
VALUES
(8, 15);

INSERT INTO weapon (IdItem, Damage, Damage_Type) 
VALUES
(1, 15, 'slashing light'),
(2, 10, 'slashing shadow'),
(5, 45, 'magical fire'),
(7, 25, 'piercing silver'),
(10, 15, 'slashing thunder'),
(13, 35, 'magical elemental'),
(14, 20, 'magical blood');

INSERT INTO potion (IdItem, Effect) 
VALUES
(3, 'heals 50 hp'),
(11, 'temporary boosts hp by 25%'),
(12, 'makes all your damage deal fire damage as well');

INSERT INTO armor (IdItem, Protection) 
VALUES
(4, 20),
(6, 5),
(9, 10);

INSERT INTO Aggressive (IdAggressive, Damage, Xp_Drop) VALUES
(1, 20, 50), 
(2, 30, 70), 
(3, 25, 60), 
(4, 35, 80), 
(5, 22, 55);

INSERT INTO Passive (IdPassive, Interactable) VALUES
(1, 0),
(2, 1),
(3, 0),
(4, 1),
(5, 1);

INSERT INTO Npc (IdNpc, Hp, Npc_Name, IdAggressive, IdPassive, IdWorld) VALUES
(1, 100, 'Emerald Zombie', 1, NULL, 1), 
(2, 120, 'Forest Citizen', NULL, 3, 6),
(3, 300, 'Hydra Boss', 2, NULL, 2),
(4, 105, 'Aquatic Merchant', NULL, 2, 2),
(5, 115, 'Shadow Bandits', 5, NULL, 3),
(6, 125, 'God Healer', NULL, 4, 3),
(8, 100, 'Desert Villagers', NULL, 1, 4),
(9, 95, 'Frozen Skeletons', 4, NULL, 5),
(10, 90, 'Cold Minks', NULL, 5, 7);


INSERT INTO boss (IdBoss, Weakness, Ability,IdAggressive) VALUES
(1,'Fire','Water Jet',2);
INSERT INTO bandit (IdBandit, Gold_Drop,IdAggressive) VALUES
(1,70,5);
INSERT INTO monster (IdMonster, Weakness,IdAggressive) VALUES
(1,'Light',1),
(2, 'Fire', 3),
(3, 'Fire', 4);
INSERT INTO villager (IdVillager,IdPassive) VALUES
(1,1),
(2,2),
(3,3);
INSERT INTO healer (IdHealer, Heal,IdPassive) VALUES
(1,50,4);
INSERT INTO merchant (IdMerchant,Store,IdPassive) VALUES
(2,'Sky Shop',5);
INSERT INTO merchant_item (IdItem,IdMerchant) VALUES
(6,2);