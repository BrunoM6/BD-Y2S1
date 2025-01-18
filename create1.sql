.headers ON 
.mode column
-- SQLite commands to make the result more readable.
PRAGMA foreign_keys = ON; 
-- Enable the enforcing of foreign key constraints on other tables.
DROP TABLE IF EXISTS Merchant_Item;
DROP TABLE IF EXISTS Merchant;
DROP TABLE IF EXISTS Healer;
DROP TABLE IF EXISTS Villager;
DROP TABLE IF EXISTS Bandit;
DROP TABLE IF EXISTS Monster;
DROP TABLE IF EXISTS Boss;
DROP TABLE IF EXISTS Npc;
DROP TABLE IF EXISTS Passive;
DROP TABLE IF EXISTS Aggressive;
DROP TABLE IF EXISTS Armor;
DROP TABLE IF EXISTS Potion;
DROP TABLE IF EXISTS Weapon;
DROP TABLE IF EXISTS Shield;
DROP TABLE IF EXISTS Item;
DROP TABLE IF EXISTS Character_Quest;
DROP TABLE IF EXISTS Quest;
DROP TABLE IF EXISTS World;
DROP TABLE IF EXISTS World;
DROP TABLE IF EXISTS Characters;
DROP TABLE IF EXISTS Types;
DROP TABLE IF EXISTS Inventory;
DROP TABLE IF EXISTS Player;

CREATE TABLE Player(
    IdPlayer INTEGER PRIMARY KEY,
    Username TEXT NOT NULL UNIQUE,
    Email TEXT NOT NULL UNIQUE,
    Hashed_Password TEXT NOT NULL
);
/* Player table, contains basic information about each player account.*/

CREATE TABLE Inventory(
    IdInventory INTEGER PRIMARY KEY,
    Max_Cap INTEGER NOT NULL CHECK (Max_Cap > 0)
);
/* Inventory table, contains the label of each inventory, and the associated 
capacity of each inventory. */

CREATE TABLE Types (
    IdType INTEGER PRIMARY KEY,
    Type_Name TEXT NOT NULL,
    Ability TEXT NOT NULL,
    UNIQUE(Ability)
);
/* Contains information about each type present on the RPG. */

CREATE TABLE Characters(
    IdCharacter INTEGER PRIMARY KEY,
    IdPlayer INTEGER NOT NULL,
    IdType INTEGER NOT NULL,
    IdInventory INTEGER NOT NULL,
    Character_Name TEXT NOT NULL,
    HP INTEGER CHECK (HP >= 0),
    XP INTEGER CHECK (XP >= 0),
    Gold INTEGER CHECK (Gold >= 0),
    Status_Effect TEXT DEFAULT 'FINE' CHECK (Status_Effect IN ('POISONED', 'BURNED', 'CONFUSED', 'STUNNED', 'FINE')),
    FOREIGN KEY (IdPlayer) REFERENCES Player(IdPlayer) ON UPDATE CASCADE,
    FOREIGN KEY (IdType) REFERENCES Types(IdType) ON UPDATE CASCADE,
    FOREIGN KEY (IdInventory) REFERENCES Inventory(IdInventory) ON UPDATE CASCADE
);

/* Contains information about each character, including the associated player account, the inventory of 
the character and the type of the characters, among other game information. */

CREATE TABLE World(
    IdWorld INTEGER PRIMARY KEY,
    World_name TEXT,
    Region TEXT,
    Environment TEXT,
    IdCharacter INTEGER DEFAULT(NULL),
    UNIQUE(IdCharacter),
    FOREIGN KEY (IdCharacter) REFERENCES Characters(IdCharacter)
);
/* Contains all the available worlds, described trough their name, region, environment type and,
if present (can be NULL if the world is empty), the character present. */

CREATE TABLE Quest(
    IdQuest INTEGER Primary Key,
    Quest_Description TEXT NOT NULL,
    Gold_Reward INTEGER CHECK (Gold_Reward >= 0),
    Xp_Reward INTEGER CHECK (Xp_Reward >= 0),
    IdWorld INTEGER Not NULL,
    FOREIGN KEY (IdWorld) REFERENCES world(IdWorld)
        ON UPDATE CASCADE
);
CREATE TABLE Character_Quest (
    IdQuest INTEGER NOT NULL,
    IdCharacter INTEGER NOT NULL,
    Quest_Status TEXT DEFAULT 'IN PROGRESS' CHECK (Quest_Status IN ('IN PROGRESS', 'COMPLETED', 'SUSPENDED')),
    PRIMARY KEY (IdQuest, IdCharacter),
    FOREIGN KEY (IdCharacter) REFERENCES Characters(IdCharacter) ON UPDATE CASCADE,
    FOREIGN KEY (IdQuest) REFERENCES Quest(IdQuest) ON UPDATE CASCADE
);

/* Contains all quests and their descriptions, including past ones, quests 
are associated to a character. */

CREATE TABLE Item(
    IdItem INTEGER PRIMARY KEY,
    Item_Name TEXT UNIQUE NOT NULL,
    Item_Description TEXT NOT NULL,
    Item_Value INTEGER CHECK (Item_Value > 0),
    IdInventory INTEGER DEFAULT NULL,
    IdQuest INTEGER DEFAULT NULL,
    IdType INTEGER ,
    FOREIGN KEY (IdInventory) REFERENCES Inventory(IdInventory) ON UPDATE CASCADE,
    FOREIGN KEY (IdQuest) REFERENCES Quest(IdQuest) ON UPDATE CASCADE,
    FOREIGN KEY (IdType) REFERENCES Types(IdType) ON UPDATE CASCADE
);
/* Contains information about all items of the game, including the type of character that wields the item,
item value (for eventual trading). If item_quest is NULL, it means the item is
not associated as a reward to a quest, and if item_inventory is NULL, it means it's either a quest
reward item or an item dropped in the world. */



CREATE TABLE Shield(
    IdItem INTEGER PRIMARY KEY,
    Shield_Block INTEGER NOT NULL,
    FOREIGN KEY (IdItem) REFERENCES Item(IdItem) ON UPDATE CASCADE
);
/* Contains the block coeficient (flat damage reduction) about a specific shield item. */

CREATE TABLE Weapon(
    IdItem INTEGER PRIMARY KEY,
    Damage INTEGER NOT NULL,
    Damage_Type TEXT NOT NULL,
    FOREIGN KEY (IdItem) REFERENCES Item(IdItem) ON UPDATE CASCADE
);
/* Contains the weapon damage and damage type informations about a specific weapon item. */

CREATE TABLE Potion(
    IdItem INTEGER PRIMARY KEY,
    Effect TEXT NOT NULL,
    FOREIGN KEY (IdItem) REFERENCES Item(IdItem) ON UPDATE CASCADE
);
/* Contains information about the effects of a potion item. */

CREATE TABLE Armor(
    IdItem INTEGER PRIMARY KEY,
    Protection INTEGER NOT NULL,
    FOREIGN KEY (IdItem) REFERENCES Item(IdItem) ON UPDATE CASCADE
);
/* Contains information about the armor block (percentage based damage block) coefficient of a
spefic armor item. */



CREATE TABLE Npc (
    IdNpc INTEGER PRIMARY KEY,
    Hp INTEGER,
    Npc_Name TEXT,
    IdWorld INTEGER DEFAULT NULL,
    IdAggressive INTEGER DEFAULT NULL,
    IdPassive INTEGER DEFAULT NULL,
    FOREIGN KEY (IdWorld) REFERENCES World(IdWorld) ON UPDATE CASCADE,
    FOREIGN KEY (IdAggressive) REFERENCES Aggressive(IdAggressive) ON UPDATE CASCADE,
    FOREIGN KEY (IdPassive) REFERENCES Passive(IdPassive) ON UPDATE CASCADE
);
/* Contains information for all the npcs on the game, including their name, the world their present in (NULL if
they're not loaded into the game) and hp. */

CREATE TABLE Aggressive (
    IdAggressive INTEGER PRIMARY KEY,
    Damage INTEGER,
    Xp_Drop INTEGER
);
/* Contains information common to the agressive type NPCs, including damage and xp_drop. */

CREATE TABLE Boss(
    IdBoss INTEGER PRIMARY KEY,
    IdAggressive INTEGER NOT NULL,
    weakness TEXT,
    ability TEXT,
    FOREIGN KEY (IdAggressive) REFERENCES Aggressive(IdAggressive) ON UPDATE CASCADE
);
/* Contains additional information pertaining to boss type agressive npcs. */

CREATE TABLE Monster (
    IdMonster INTEGER PRIMARY KEY,
    IdAggressive INTEGER NOT NULL,
    weakness CHAR,
    FOREIGN KEY (IdAggressive) REFERENCES Aggressive(IdAggressive) ON UPDATE CASCADE
);
/* Contains the weakness of each monster. */

CREATE TABLE Bandit (
    IdBandit INTEGER PRIMARY KEY,
    IdAggressive INTEGER NOT NULL,
    Gold_Drop INTEGER,
    FOREIGN KEY (IdAggressive) REFERENCES Aggressive(IdAggressive) ON UPDATE CASCADE
);
/* Contains information on the gold drop of each bandit. */

CREATE TABLE Passive (
    IdPassive INTEGER PRIMARY KEY,
    Interactable INTEGER CHECK (Interactable IN (0, 1))
);
/* Contains each passive character and an identifier that marks characters as 
interactible (1) if the player can begin dialogue/interact with the character
and not-interactible (0) if the character cannot be interacted with. */

CREATE TABLE Villager(
    IdVillager INTEGER PRIMARY KEY,
    IdPassive INTEGER NOT NULL,
    FOREIGN KEY (IdPassive) REFERENCES Passive(IdPassive) ON UPDATE CASCADE
);
/* Contains the id of each villager. */

CREATE TABLE Healer(
    IdHealer INTEGER PRIMARY KEY,
    Heal INTEGER NOT NULL,
    IdPassive INTEGER NOT NULL,
    FOREIGN KEY (IdPassive) REFERENCES Passive(IdPassive) ON UPDATE CASCADE
);
/* Contains information about the heal coefficient of each healer. */

CREATE TABLE Merchant(
    IdMerchant INTEGER PRIMARY KEY,
    Store TEXT,
    IdPassive INTEGER NOT NULL,
    FOREIGN KEY (IdPassive) REFERENCES Passive(IdPassive) ON UPDATE CASCADE
);
/* Contains each merchant. */

CREATE TABLE Merchant_Item(
    IdItem INTEGER NOT NULL,
    IdMerchant INTEGER NOT NULL,
    PRIMARY KEY (IdItem,IdMerchant),
    FOREIGN KEY (IdItem) REFERENCES Item(IdItem) ON UPDATE CASCADE,
    FOREIGN KEY (IdMerchant) REFERENCES Merchant(IdMerchant) ON UPDATE CASCADE
);
/* Contains information about items that belong to merchants, identifying 
the specific merchant they belong to. */