function OnModPostInit()
    local file_path = "file/path"
    local file_contents = "ModTextFileGetContent(file_path)"
    local nxml = dofile_once("mods/SpicyTP/lib/nxml.lua")
    local xml = nxml.parse(file_contents)

    -- SPELLS, PROJECTILES, AND PROJECTILE PARTICLES
    if ModSettingGet("SpicyTP.change_spells") == "true" then
        -- All spell icons (sprite overrides)
        ModLuaFileAppend(
            "data/scripts/gun/gun_actions.lua",
            "mods/SpicyTP/files/scripts/gun/gun_actions_sprite_override.lua"
        )

        -- Sea of Alcohol spell (changing shaped emitter)
        file_path = "data/entities/projectiles/deck/sea_alcohol.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            "data/particles/image_emitters/sea_oil.png",
            "mods/SpicyTP/files/particles/image_emitters/sea_alcohol.png"
        )
        ModTextFileSetContent(file_path, file_contents)

        -- Sea of Flammable Gas spell (changing shaped emitter, changing particle material)
        file_path = "data/entities/projectiles/deck/sea_acid_gas.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            "data/particles/image_emitters/sea_acid.png",
            "mods/SpicyTP/files/particles/image_emitters/sea_acid_gas.png"
        )
        file_contents = file_contents:gsub(
            'emitted_material_name="acid"',
            'emitted_material_name="acid_gas"'
        )
        ModTextFileSetContent(file_path, file_contents)

        -- Dark Flame (changing frame dimensions to be even)
        file_path = "data/projectiles_gfx/darkflame.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            "12",
            "13"
        )
        file_contents = file_contents:gsub(
            'frame_height="13"',
            'frame_height="15"'
        )
        file_contents = file_contents:gsub(
            'pos_y="1"',
            'pos_y="0"'
        )
        ModTextFileSetContent(file_path, file_contents)
        -- (changing fadeout sprite)
        file_path = "data/particles/darkflame.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            "data/particles/darkflame.png",
            "mods/SpicyTP/files/particles/darkflame.png"
        )
        ModTextFileSetContent(file_path, file_contents)
        -- (changing fadeout frame dimensions to be even)
        file_contents = file_contents:gsub(
            "12",
            "13"
        )
        file_contents = file_contents:gsub(
            'frame_height="13"',
            'frame_height="15"'
        )
        file_contents = file_contents:gsub(
            "7",
            "6"
        )
        ModTextFileSetContent(file_path, file_contents)

        -- Plasma Explosion "016" (changing sprite)
        file_path = "data/particles/explosion_016_plasma.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            "data/particles/explosion_016_plasma.png",
            "mods/SpicyTP/files/particles/explosion_016_plasma.png"
        )
        ModTextFileSetContent(file_path, file_contents)

        -- Plasma Explosion "016_green" (changing sprite)
        file_path = "data/particles/explosion_016_plasma_green.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            "data/particles/explosion_016_plasma_green.png",
            "mods/SpicyTP/files/particles/explosion_016_plasma_green.png"
        )
        ModTextFileSetContent(file_path, file_contents)
        -- (making Magic Arrow use this)
        file_path = "data/entities/projectiles/deck/bullet.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            "data/particles/explosion_016_slime.xml",
            "data/particles/explosion_016_plasma_green.xml"
        )
        ModTextFileSetContent(file_path, file_contents)

        -- Electric Explosion "040" (changing sprite)
        file_path = "data/particles/explosion_040_electric.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            "data/particles/explosion_040_electric.png",
            "mods/SpicyTP/files/particles/explosion_040_electric.png"
        )
        -- (changing animation speed)
        file_path = "data/particles/explosion_040_electric.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            'frame_wait="0.02"',
            'frame_wait="0.04"'
        )
        ModTextFileSetContent(file_path, file_contents)
        -- (making the Thunder Trap's projectile use this)
        file_path = "data/entities/projectiles/thunder_trap.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            "</ProjectileComponent>",
            [[<config_explosion explosion_sprite="data/particles/explosion_040_electric.xml" > </config_explosion> </ProjectileComponent>]]
        )
        ModTextFileSetContent(file_path, file_contents)

        -- Disc Trail (changing sprite)
        file_path = "data/particles/discbullet_trail.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            "data/particles/discbullet_trail.png",
            "mods/SpicyTP/files/particles/discbullet_trail.png"
        )
        ModTextFileSetContent(file_path, file_contents)

        -- Disc Projectile (changing animation speed)
        file_path = "data/projectiles_gfx/disc_bullet.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            "1000",
            "0.05"
        )
        -- (changing location of grounded sprite)
        file_contents = file_contents:gsub(
            [[name="on_ground"
            pos_x="0"
            pos_y="0"]],
            [[name="on_ground"
            pos_x="0"
            pos_y="9"]]
        )
        -- (disabling animation speed scaling)
        file_contents = file_contents:gsub(
            'velocity_updates_animation="1"',
            'velocity_updates_animation="0"'
        )
        ModTextFileSetContent(file_path, file_contents)
        -- (disabling animation speed scaling)
        file_path = "data/entities/projectiles/deck/disc_bullet.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            'velocity_updates_animation="1"',
            'velocity_updates_animation="0"'
        )
        ModTextFileSetContent(file_path, file_contents)
        -- (adding component so it switches to grounded sprite before dying)
        file_contents = ModTextFileGetContent(file_path)
        xml = nxml.parse(file_contents)
        xml:add_child(nxml.parse([[
            <LuaComponent
            _enabled="1"
            script_source_file="mods/SpicyTP/files/scripts/projectiles/disc_bullet_inert.lua"
            execute_every_n_frame="-1"
            execute_on_removed="1"
            />
            ]]))
        ModTextFileSetContent(file_path, tostring(xml))
        print(file_contents)

        -- Giga Disc Projectile (changing animation speed)
        file_path = "data/projectiles_gfx/disc_bullet_big.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            "1000",
            "0.05"
        )
        -- (changing location of grounded sprite)
        file_contents = file_contents:gsub(
            [[name="on_ground"
            pos_x="0"
            pos_y="0"]],
            [[name="on_ground"
            pos_x="0"
            pos_y="17"]]
        )
        ModTextFileSetContent(file_path, file_contents)
        -- (disabling animation speed scaling)
        file_path = "data/entities/projectiles/deck/disc_bullet_big.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            'velocity_updates_animation="1"',
            'velocity_updates_animation="0"'
        )
        ModTextFileSetContent(file_path, file_contents)

        -- Omega Sawblade (changing animation speed)
        file_path = "data/projectiles_gfx/disc_bullet_bigger.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            "0.02",
            "0.05"
        )
        -- (setting frame count to 4)
        file_contents = file_contents:gsub(
            'frames_per_row="3"',
            'frames_per_row="4"'
        )
        file_contents = file_contents:gsub(
            'frame_count="3"',
            'frame_count="4"'
        )
        -- (changing location of grounded sprite)
        file_contents = file_contents:gsub(
            [[name="on_ground"
            pos_x="0"
            pos_y="0"]],
            [[name="on_ground"
            pos_x="0"
            pos_y="25"]]
        )
        ModTextFileSetContent(file_path, file_contents)

        -- Hollow Egg (changing object sprite)
        file_path = "data/entities/items/pickup/egg_hollow.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            "data/ui_gfx/items/egg_slime.png",
            "mods/SpicyTP/files/ui_gfx/items/egg_hollow.png"
        )
        ModTextFileSetContent(file_path, file_contents)
        -- (changing icon)
        file_path = "data/entities/items/pickup/egg_hollow.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            "data/items_gfx/egg_slime.png",
            "mods/SpicyTP/files/items_gfx/egg_hollow.png"
        )
        ModTextFileSetContent(file_path, file_contents)
        
        -- Electric Particle "arc" (changing sprite)
        file_path = "data/particles/arc.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            "data/particles/arc.png",
            "mods/SpicyTP/files/particles/arc.png"
        )
        ModTextFileSetContent(file_path, file_contents)

        -- Electric Particle "spark_electric" (changing sprite)
        file_path = "data/particles/spark_electric.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            "data/particles/spark_electric.png",
            "mods/SpicyTP/files/particles/spark_electric.png"
        )
        ModTextFileSetContent(file_path, file_contents)
        
        -- Temporary Platform (changing emitter sprite)
        file_path = "data/projectiles/deck/temporary_platform.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            "data/particles/image_emitters/temporary_platform.png",
            "mods/SpicyTP/files/particles/image_emitters/temporary_platform.png"
        )
        ModTextFileSetContent(file_path, file_contents)

        -- Temporary Wall (changing emitter sprite)
        file_path = "data/projectiles/deck/temporary_wall.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            "data/particles/image_emitters/temporary_wall.png",
            "mods/SpicyTP/files/particles/image_emitters/temporary_wall.png"
        )
        ModTextFileSetContent(file_path, file_contents)

        -- CROSS-MOD - Pride Glimmers
        if ModIsEnabled("pride_glimmers") then
            -- Polyamorous Pride Glimmer (changing the third possible color)
            file_path = "mods/pride_glimmers/files/materials.xml"
            file_contents = ModTextFileGetContent(file_path)
            file_contents = file_contents:gsub(
                "ff0A1027",
                "ff66118b"
            )
            ModTextFileSetContent(file_path, file_contents)
            -- (changing the filepath for the infinity particle)
            file_path = "mods/pride_glimmers/files/gfx/polyam_infinity.xml"
            file_contents = ModTextFileGetContent(file_path)
            file_contents = file_contents:gsub(
                "mods/pride_glimmers/files/gfx/polyam_infinity.png",
                "mods/SpicyTP/files/particles/pride_glimmers/polyam_infinity.png"
            )
            ModTextFileSetContent(file_path, file_contents)
            -- (changing the filepath for the heart particle)
            file_path = "mods/pride_glimmers/files/gfx/polyam_heart.xml"
            file_contents = ModTextFileGetContent(file_path)
            file_contents = file_contents:gsub(
                "mods/pride_glimmers/files/gfx/polyam_heart.png",
                "mods/SpicyTP/files/particles/pride_glimmers/polyam_heart.png"
            )
            ModTextFileSetContent(file_path, file_contents)
            -- (changing the spawn intervals for the infinity and heart particles)
            file_path = "mods/pride_glimmers/files/card/tinyspark_polyam.xml"
            file_contents = ModTextFileGetContent(file_path)
            file_contents = file_contents:gsub(
                'emission_interval_max_frames="10"',
                'emission_interval_max_frames="20"'
            )
            ModTextFileSetContent(file_path, file_contents)
        end
    end

    -- CREATURES AND CREATURE PARTICLES
    if ModSettingGet("SpicyTP.change_enemies") == "true" then
        -- Skull Rat (adding emissive layer)
        file_path = "data/entities/animals/skullrat.xml"
        file_contents = ModTextFileGetContent(file_path)
        xml = nxml.parse(file_contents)
        xml:add_child(nxml.parse([[
            <SpriteComponent
            _tags="character"
            _enabled="1"
            alpha="0.5"
            image_file="mods/SpicyTP/files/enemies_gfx/skullrat_emissive.xml"
            offset_x="0"
            offset_y="0"
            emissive="1"
            additive="1"
            next_rect_animation=""
            rect_animation="walk"
            >
            </SpriteComponent>
            ]]))
        ModTextFileSetContent(file_path, tostring(xml))

        -- Creep (changing animation speed)
        file_path = "data/enemies_gfx/wraith.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            'frame_wait="0.23"',
            'frame_wait="0.1"'
        )
        ModTextFileSetContent(file_path, file_contents)
        -- (removing arm)
        file_path = "data/entities/animals/wraith.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            "data/enemies_gfx/wraith_arm.xml",
            ""
        )
        ModTextFileSetContent(file_path, file_contents)
        -- (adding emissive layer)
        file_path = "data/entities/animals/wraith.xml"
        file_contents = ModTextFileGetContent(file_path)
        xml = nxml.parse(file_contents)
        xml:add_child(nxml.parse([[
            <SpriteComponent
            _tags="character"
            _enabled="1"
            alpha="1"
            image_file="mods/SpicyTP/files/enemies_gfx/wraith_emissive.xml"
            offset_x="0"
            offset_y="0"
            emissive="1"
            additive="1"
            next_rect_animation=""
            rect_animation="walk"
            >
            </SpriteComponent>
            ]]))
        ModTextFileSetContent(file_path, tostring(xml))
        
        -- Glowing Creep (adding emissive layer)
        file_path = "data/entities/animals/wraith_glowing.xml"
        file_contents = ModTextFileGetContent(file_path)
        xml = nxml.parse(file_contents)
        xml:add_child(nxml.parse([[
            <SpriteComponent
            _tags="character"
            _enabled="1"
            alpha="1"
            image_file="mods/SpicyTP/files/enemies_gfx/wraith_glowing_emissive.xml"
            offset_x="0"
            offset_y="0"
            emissive="1"
            additive="1"
            next_rect_animation=""
            rect_animation="walk"
            >
            </SpriteComponent>
            ]]))
        ModTextFileSetContent(file_path, tostring(xml))

        -- Phantom (changing animation speed)
        file_path = "data/enemies_gfx/ghost.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            'frame_wait="0.16"',
            'frame_wait="0.12"'
        )
        ModTextFileSetContent(file_path, file_contents)

        -- Skull Fly (adding emissive layer)
        file_path = "data/entities/animals/skullfly.xml"
        file_contents = ModTextFileGetContent(file_path)
        xml = nxml.parse(file_contents)
        xml:add_child(nxml.parse([[
            <SpriteComponent
            _tags="character"
            _enabled="1"
            alpha="0.5"
            image_file="mods/SpicyTP/files/enemies_gfx/skullfly_emissive.xml"
            offset_x="0"
            offset_y="0"
            emissive="1"
            additive="1"
            next_rect_animation=""
            rect_animation="walk"
            >
            </SpriteComponent>
            ]]))
        ModTextFileSetContent(file_path, tostring(xml))

        -- Giant Worm (disabling animation speed scaling)
        --[[
        file_path = "data/entities/animals/worm_big.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            'eat_anim_wait_mult="0.05 "',
            'eat_anim_wait_mult="0.5"'
        )
        ModTextFileSetContent(file_path, file_contents)

        -- Worm (disabling animation speed scaling)
        file_path = "data/entities/animals/worm.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            'eat_anim_wait_mult="0.05 "',
            'eat_anim_wait_mult="0.5"'
        )
        ModTextFileSetContent(file_path, file_contents)
        ]]
    end

    -- ITEMS, UNIQUE WANDS, OBJECTS, AND PICKUPS
    if ModSettingGet("SpicyTP.change_items") == "true" then
        -- Egg "tentacle" (changing object sprite)
        file_path = "data/entities/items/pickup/egg_red.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            "data/ui_gfx/items/egg_red.png",
            "mods/SpicyTP/files/ui_gfx/items/egg_tentacle.png"
        )
        ModTextFileSetContent(file_path, file_contents)
        -- (changing icon)
        file_path = "data/entities/items/pickup/egg_red.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            "data/items_gfx/egg_red.png",
            "mods/SpicyTP/files/items_gfx/egg_tentacle.png"
        )
        ModTextFileSetContent(file_path, file_contents)

        -- Spell Refresh Fadeout (adding a particle entity to the object's pickup script)
        file_path = "data/scripts/items/spell_refresh.lua"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            'EntityLoad("data/entities/particles/image_emitters/spell_refresh_effect.xml", x, y-12)',
            [[EntityLoad("data/entities/particles/image_emitters/spell_refresh_effect.xml", x, y-12) EntityLoad("mods/SpicyTP/files/entities/particles/spell_refresh_out.xml", x, y-8)]]
        )
        ModTextFileSetContent(file_path, file_contents)
    end

    -- MATERIALS
    if ModSettingGet("SpicyTP.change_materials") == "true" then
        -- Volcanic Sand (changing texture)
        file_path = "data/materials.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            [[texture_file="data/materials_gfx/lavarock.png" color="ff0A8240"]],
            [[texture_file="mods/SpicyTP/files/materials_gfx/lavasand.png" color="ff0A8240"]]
        )
        ModTextFileSetContent(file_path, file_contents)
    end

    -- PIXEL SCENES AND SCENE PARTICLES
    if ModSettingGet("SpicyTP.change_structures") == "true" then

    end

    -- HOLY MOUNTAINS AND LABORATORY
    if ModSettingGet("SpicyTP.change_holymountain") == "true" then
        -- Holy Mountain (shifting spawn offset of center anger checks)
        file_path = "data/scripts/biomes/temple_altar.lua"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            "x %+ 180, y %- 65 %- 16 %- 20",
            "x %- 150, y %- 101"
        )
        file_contents = file_contents:gsub(
            "x %+ 180, y %+ 140",
            "x %- 150, y %+ 140"
        )
        ModTextFileSetContent(file_path, file_contents)
        -- (changing dimensions of the collapse trigger)
        file_path = "data/entities/buildings/workshop_exit.xml"
        file_contents = ModTextFileGetContent(file_path)
        file_contents = file_contents:gsub(
            'width="52"',
            'width="32"'
        )
        file_contents = file_contents:gsub(
            'height="52"',
            'height="32"'
        )
        ModTextFileSetContent(file_path, file_contents)
    end
end