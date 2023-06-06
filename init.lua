function OnModPostInit()
-- ICONS
    -- All spell icons (sprite overrides)
    ModLuaFileAppend(
        "data/scripts/gun/gun_actions.lua",
        "mods/SpicyTP/files/scripts/gun/gun_actions_sprite_override.lua"
    )

-- PARTICLES
    -- Sea of Alcohol spell (changing shaped emitter)
    local file_path = "data/entities/projectiles/deck/sea_alcohol.xml"
    local file_path_contents = ModTextFileGetContent(file_path)
    file_path_contents = file_path_contents:gsub(
        "data/particles/image_emitters/sea_oil.png",
        "mods/SpicyTP/files/particles/image_emitters/sea_alcohol.png"
    )
    ModTextFileSetContent(file_path, file_path_contents)

    -- Sea of Flammable Gas spell (changing shaped emitter, changing particle material)
    local file_path = "data/entities/projectiles/deck/sea_acid_gas.xml"
    local file_path_contents = ModTextFileGetContent(file_path)
    file_path_contents = file_path_contents:gsub(
        "data/particles/image_emitters/sea_acid.png",
        "mods/SpicyTP/files/particles/image_emitters/sea_acid_gas.png"
    )
    file_path_contents = file_path_contents:gsub(
        'emitted_material_name="acid"',
        'emitted_material_name="acid_gas"'
    )
    ModTextFileSetContent(file_path, file_path_contents)

-- ITEMS
    -- Egg (tentacle) (changing image)
    local file_path = "data/entities/items/pickup/egg_red.xml"
    local file_path_contents = ModTextFileGetContent(file_path)
    file_path_contents = file_path_contents:gsub(
        "data/ui_gfx/items/egg_red.png",
        "mods/SpicyTP/files/ui_gfx/items/egg_tentacle.png"
    )
    ModTextFileSetContent(file_path, file_path_contents)

    -- Hollow Egg (changing image)
    local file_path = "data/entities/items/pickup/egg_hollow.xml"
    local file_path_contents = ModTextFileGetContent(file_path)
    file_path_contents = file_path_contents:gsub(
        "data/ui_gfx/items/egg_slime.png",
        "mods/SpicyTP/files/ui_gfx/items/egg_hollow.png"
    )
    ModTextFileSetContent(file_path, file_path_contents)

-- OBJECTS
    -- Egg (tentacle) (changing image)
    local file_path = "data/entities/items/pickup/egg_red.xml"
    local file_path_contents = ModTextFileGetContent(file_path)
    file_path_contents = file_path_contents:gsub(
        "data/items_gfx/egg_red.png",
        "mods/SpicyTP/files/items_gfx/egg_tentacle.png"
    )
    ModTextFileSetContent(file_path, file_path_contents)

    -- Hollow Egg (changing image)
    local file_path = "data/entities/items/pickup/egg_hollow.xml"
    local file_path_contents = ModTextFileGetContent(file_path)
    file_path_contents = file_path_contents:gsub(
        "data/items_gfx/egg_slime.png",
        "mods/SpicyTP/files/items_gfx/egg_hollow.png"
    )
    ModTextFileSetContent(file_path, file_path_contents)
end