WorldChunkGen = WorldChunkGen or class(UnitBase)

function WorldChunkGen:init()
	self._unit = unit
	self._units = {}
	self._chunkdata = {1,2,'steve',4,'bo',6,7,69}
	
	local chunksize = 16
	local chunksizetotal = chunksize*chunksize*chunksize
	log(chunksizetotal)
	
	
	for idx, chunksizetotal in ipairs(self._chunkdata) do
		local unit = Idstring("units/pd2_mod_java/blocks/block_stone")
		local pos = Vector3(idx*100-100, 0, 0)
		local rot = Vector3(0, 0, 0)
		local spawn_unit = CoreUnit.safe_spawn_unit(unit, pos, rot)
	end
	
	
	table.insert(self._units, spawn_unit) -- Spawned units list
end

function WorldChunkGen:destroy()
	log("WorldChunkGen: Cleaning up")
	for _, spawn_unit in ipairs(self._units) do
		spawn_unit:set_slot(0)
	end
	self._units = {}
end