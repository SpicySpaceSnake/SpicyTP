local eid = GetUpdatedEntityID()
local scs = EntityGetComponent(eid, "SpriteComponent") or {}
for i=1, #scs do
    if ComponentGetValue2(scs[i], "image_file") == "data/projectiles_gfx/disc_bullet.xml" then
        ComponentSetValue2(scs[i], "rect_animation", "on_ground")
    end
end