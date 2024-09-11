dofile("data/scripts/lib/mod_settings.lua")

function mod_setting_bool_custom( mod_id, gui, in_main_menu, im_id, setting )
	local value = ModSettingGetNextValue( mod_setting_get_id(mod_id,setting) )
	local text = setting.ui_name .. " - " .. GameTextGet( value and "$option_on" or "$option_off" )

	if GuiButton( gui, im_id, mod_setting_group_x_offset, 0, text, 1, "data/fonts/font_pixel_runes.xml", true ) then
		ModSettingSetNextValue( mod_setting_get_id(mod_id,setting), not value, false )
	end

	mod_setting_tooltip( mod_id, gui, in_main_menu, setting )
end

function mod_setting_change_callback( mod_id, gui, in_main_menu, setting, old_value, new_value  )
	print( tostring(new_value) )
end

local mod_id = "SpicyTP"
mod_settings_version = 1
mod_settings =
{
    {
        id = "change_spells",
        ui_name = "Spells and Projectiles",
        ui_description = "If enabled, all supported spell icons and projectiles will have their appearance altered.",
        value_default = "true",
        values = {{"true", "SpicyTP"}, {"false", "vanilla"}},
        scope = MOD_SETTING_SCOPE_RUNTIME_RESTART
    },
    {
        id = "change_enemies",
        ui_name = "Creatures",
        ui_description = "If enabled, all supported creatures and all boss health bars will have their appearance altered.",
        value_default = "true",
        values = {{"true", "SpicyTP"}, {"false", "vanilla"}},
        scope = MOD_SETTING_SCOPE_RUNTIME_RESTART
    },
    {
        id = "change_items",
        ui_name = "Items and Objects",
        ui_description = "If enabled, all supported items, objects, and pickups will have their appearance altered.",
        value_default = "true",
        values = {{"true", "SpicyTP"}, {"false", "vanilla"}},
        scope = MOD_SETTING_SCOPE_RUNTIME_RESTART
    },
    {
        id = "change_materials",
        ui_name = "Materials",
        ui_description = "If enabled, all supported materials will have their appearance altered.",
        value_default = "true",
        values = {{"true", "SpicyTP"}, {"false", "vanilla"}},
        scope = MOD_SETTING_SCOPE_RUNTIME_RESTART
    },
    {
        id = "change_structures",
        ui_name = "Pixel Scenes",
        ui_description = "If enabled, all supported pixel scenes will be restructured, and structure-related particles will be enabled.\nHoly Mountains aren't affected by this option; see the option below for that.",
        value_default = "true",
        values = {{"true", "SpicyTP"}, {"false", "vanilla"}},
        scope = MOD_SETTING_SCOPE_RUNTIME_RESTART
    },
    {
        id = "change_holymountain",
        ui_name = "Holy Mountains",
        ui_description = "If enabled, all Holy Mountains and the Laboratory will be restructured.",
        value_default = "true",
        values = {{"true", "SpicyTP"}, {"false", "vanilla"}},
        scope = MOD_SETTING_SCOPE_RUNTIME_RESTART
    }
}

function ModSettingsUpdate( init_scope )
	local old_version = mod_settings_get_version( mod_id )
	mod_settings_update( mod_id, mod_settings, init_scope )
end

function ModSettingsGuiCount()
	return mod_settings_gui_count( mod_id, mod_settings )
end

function ModSettingsGui( gui, in_main_menu )
	mod_settings_gui( mod_id, mod_settings, gui, in_main_menu )
end