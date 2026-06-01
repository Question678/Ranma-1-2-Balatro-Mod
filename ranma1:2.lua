--- STEAMODDED HEADER
--- MOD_NAME: Ranma 1/2 Deck
--- MOD_ID: ranma1/2
--- PREFIX: ranma1/2
--- MOD_AUTHOR: [Secto]
--- MOD_DESCRIPTION: Ranma 1/2 Deck Skin!

local atlas_key = 'ranma_atlas' -- Format: PREFIX_KEY
-- See end of file for notes
local atlas_path = 'ranma_lc.png' -- Filename for the image in the asset folder
local atlas_path_hc = 'ranma_hc.png' -- Filename for the high-contrast version of the texture, if existing

local suits = {'Hearts', 'Clubs', 'Diamonds', 'Spades'} -- Which suits to replace
local ranks_to_use = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', "King", "Ace" } -- Which ranks to replace

--local suit_colors_lc = {HEX("")} -- Optional, comment out if not used
-- local suit_colors_hc = {HEX("")} -- Optional, comment out if not used

--local atlas_icon_lc = '' -- Optional, comment out if not used
-- local atlas_icon_hc = '' -- Optional, comment out if not used

local description = 'Ranma 1/2' -- English-language description, also used as default. Can also be a table for each suit.

-----------------------------------------------------------
-- You should only need to change things above this line --
-----------------------------------------------------------

-- Atlases
SMODS.Atlas{  
    key = atlas_key..'_lc',
    px = 71,
    py = 95,
    path = atlas_path,
    prefix_config = {key = false},
}

if atlas_path_hc then
    SMODS.Atlas{  
        key = atlas_key..'_hc',
        px = 71,
        py = 95,
        path = atlas_path_hc,
        prefix_config = {key = false},
    }
end

for _, suit in ipairs(suits) do
    SMODS.DeckSkin{
        key = suit.."_skin",
        suit = suit:gsub("^%l", string.upper),
        ranks = ranks,
        lc_atlas = atlas_key..'_lc',
        hc_atlas = (atlas_path_hc and atlas_key..'_hc') or atlas_key..'_lc',
        loc_txt = {
            ['en-us'] = description
        },
        posStyle = 'deck'
    }
end
