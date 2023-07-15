SetRandomSeed(46957,85999)
local levels = {}
local probs = {}
for i = 1,#actions do
	levels[i] = actions[i].spawn_level
	probs[i] = actions[i].spawn_probability
end
for i = 1,#actions do
	local action = actions[i]
	if action.spawn_probability == "0" or HasFlagPersistent('action_'..string.lower(action.id)) then
		-- do nothing
	else
		local copy = Random(1,#levels)
		action.spawn_level = levels[copy]
		action.spawn_probability = probs[copy]
	end
end
