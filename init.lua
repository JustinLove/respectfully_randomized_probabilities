
function OnPlayerSpawned( player_entity ) -- This runs when player entity has been created
	local init_check_flag = "respectfully_randomized_probabilities_init_done"
	if GameHasFlagRun( init_check_flag ) then
		return
	end
	GameAddFlagRun( init_check_flag )

	--dofile_once( "mods/respectfully_randomized_probabilities/files/test.lua" )
	--rrp_test( player_entity )
end

function OnMagicNumbersAndWorldSeedInitialized() -- this is the last point where the Mod* API is available. after this materials.xml will be loaded.
	ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/respectfully_randomized_probabilities/files/gun_actions.lua" )
end
