CREATE EXTENSION pg_trgm;

CREATE TABLE cards (
    cid               varchar(32) primary key,
    name              varchar(200) DEFAULT '',
    mana_cost         varchar(45) DEFAULT '',
    toughness         varchar(6) DEFAULT '',
    power             varchar(6) DEFAULT '',
    types             varchar(20)[] DEFAULT '{}',
    rarities          varchar(15)[] DEFAULT '{}',
    sets              varchar(3)[] DEFAULT '{}',
    subtypes          varchar(100)[] DEFAULT '{}',
    supertypes        varchar(100)[] DEFAULT '{}',
    colors            varchar(5)[] DEFAULT '{}',
    rules             text DEFAULT '',
    loyalty           integer DEFAULT 0,
    cmc               integer DEFAULT 0,
    standard          smallint DEFAULT 0,
    modern            smallint DEFAULT 0,
    vintage           smallint DEFAULT 0,
    commander         smallint DEFAULT 0,
    legacy            smallint DEFAULT 0,
    classic           smallint DEFAULT 0
);

CREATE INDEX cards_name_id ON cards(cid);
CREATE INDEX cards_power_index ON cards(power);
CREATE INDEX cards_toughness_index ON cards(toughness);
CREATE INDEX cards_types_index ON cards USING GIN(types);
CREATE INDEX cards_subtypes_index ON cards USING GIN(subtypes);
CREATE INDEX cards_supertypes_index ON cards USING GIN(supertypes);
CREATE INDEX cards_colors_index ON cards USING GIN(colors);
CREATE INDEX cards_sets_index ON cards USING GIN(sets);
CREATE INDEX cards_rarities_index ON cards USING GIN(rarities);
CREATE INDEX cards_names_index ON cards USING GIN(name gin_trgm_ops);
CREATE INDEX cards_rules_index ON cards USING GIN(rules gin_trgm_ops);


CREATE INDEX cards_modern_index ON cards(modern);
CREATE INDEX cards_standard_index ON cards(standard);
CREATE INDEX cards_vintage_index ON cards(vintage);
CREATE INDEX cards_legacy_index ON cards(legacy);
CREATE INDEX cards_classic_index ON cards(classic);
CREATE INDEX cards_commander_index ON cards(commander);

CREATE TABLE sets (
    id                varchar(3) primary key,
    name              varchar(200) DEFAULT '',
    border            varchar(40) DEFAULT '',
    type              varchar(32) DEFAULT ''
);

CREATE TABLE editions (
    eid                integer DEFAULT 0, 
    card_id           varchar(32) DEFAULT '',
    flavor            text DEFAULT '',
    border            varchar(10) DEFAULT '',
    set_number        varchar(10) DEFAULT '',
    layout            varchar(16) DEFAULT '',
    artist            text DEFAULT '',
    set_id            varchar(3) DEFAULT '',
    set_name          varchar(100) DEFAULT '',
    watermark         varchar(20) DEFAULT '',
    rarity            varchar(15) DEFAULT ''
);

CREATE INDEX editions_id_index ON editions(eid);
CREATE INDEX editions_cardid_index ON editions(card_id);
CREATE INDEX editions_rarity_index ON editions(rarity);
CREATE INDEX editions_set_id_index ON editions(set_id);
CREATE INDEX editions_layout_index ON editions(layout);

GRANT ALL PRIVILEGES ON TABLE cards TO urza;
GRANT ALL PRIVILEGES ON TABLE sets TO urza;
GRANT ALL PRIVILEGES ON TABLE editions TO urza;

