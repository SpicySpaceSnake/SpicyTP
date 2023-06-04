dofile("data/scripts/lib/mod_settings.lua") -- see this file for documentation on some of the features.
dofile("data/scripts/lib/utilities.lua")
local mod_id = "SpicyTP"
mod_settings_version = 1

mod_settings =
{
    {
        id = "do_actions",
        ui_name = "Replace Spell Icons",
        ui_description = "If enabled, all supported spell icons will be replaced.",
        value_default = true,
        scope = MOD_SETTING_SCOPE_RUNTIME_RESTART,
        ui_fn = function( mod_id, gui, in_main_menu, im_id, setting )

            GuiLayoutBeginHorizontal(gui, 0, 0, false, 0, 0)
                GuiColorSetForNextWidget(gui, 1.0, 1.0, 1.0, 0.5)
                GuiText(gui, mod_setting_group_x_offset, 0, "Replace Spell Icons: ")
                local value = ModSettingGetNextValue( mod_setting_get_id(mod_id,setting) )
                local lmb, rmb = GuiButton(gui, im_id, 0, 0, value and "[Yes]" or "[No]")
                if lmb then
                    ModSettingSetNextValue( mod_setting_get_id(mod_id,setting), not value, false )
                    mod_setting_handle_change_callback( mod_id, gui, in_main_menu, setting, value, not value )
                end
                if rmb then
                    local new_value = setting.value_default or false
                    ModSettingSetNextValue( mod_setting_get_id(mod_id,setting), new_value, false )
                    mod_setting_handle_change_callback( mod_id, gui, in_main_menu, setting, value, new_value )
                end
                mod_setting_tooltip( mod_id, gui, in_main_menu, setting )
            GuiLayoutEnd(gui)

        end
    },
}

function ModSettingsUpdate( init_scope )
    local old_version = mod_settings_get_version( mod_id ) -- This can be used to migrate some settings between mod versions.
    mod_settings_update( mod_id, mod_settings, init_scope )
end

function ModSettingsGuiCount()
    return mod_settings_gui_count(mod_id, mod_settings)
end

function ModSettingsGui( gui, in_main_menu )
    mod_settings_gui( mod_id, mod_settings, gui, in_main_menu )
end