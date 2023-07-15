
function report_card(item, level)
	for i = 1,#actions do
		local action = actions[i]
		if action.id == item then
			print(action.id, level, action.spawn_level)
			print(action.spawn_probability)
		end
	end
end

function make_card( x, y, level )
	LoadPixelScene( "data/biome_impl/temple/shop_second_row.png", "data/biome_impl/temple/shop_second_row_visual.png", x - 8, y + 8, "", true )
	local item = GetRandomAction( x, y, level, 0 )
	if item == '' then
		return nil
	end
	report_card(item, level)
	local card = CreateItemActionEntity( item, x, y )
	return card
end

function rrp_test( player_entity )
	dofile_once("data/scripts/gun/gun_actions.lua")
	--EntitySetTransform( player_entity, 1540, 6050 )
	--local px, py = EntityGetTransform( player_entity )
	local startx = 0
	local starty = 0
	for level = 0,6 do
		local y = starty + level * -30
		for i = 1,18 do
			local x = startx + i * 20 
			make_card(x, y, level)
		end
	end
	local level = 10
	local y = starty + 7 * -30
	for i = 1,18 do
		local x = startx + i * 20
		make_card(x, y, level)
	end
end
