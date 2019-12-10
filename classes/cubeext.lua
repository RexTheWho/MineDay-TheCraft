CubeUnit = CubeUnit or class(UnitBase)

--[[

////Some thoughts/todo!

-Need to look into placing blocks and inventory systems!
	...Oh god UI ;-;

-Instead of deleting a block that is occluded entirely using disable/enable to hide them. Performance is equal to the block not existing at all.
	managers.game_play_central:mission_disable_unit(unit)
	managers.game_play_central:mission_enable_unit(unit)

-Clean up the material/texture names so instead of the names being there for no reason it is just what material to change textures for.

-Stop being dumb, Rex.
	...Im working on it.

-Add plants that grow over time.
	...note, non-solid grass does not update properly!

-Level gen, sync and saving, curious to see how possible it might be to save tiles as block IDs and reload them later (would be more efficient I guess if I make them '046A' IDs or something?)

-Test block limitations, how many can possibly exist.
	...69,632 is my best record.

-Texture pack!
	...also upscale everything to 512px :(
		...also color the grass by hand and/or figure out a way to tint very specific material configs

]]--

function CubeUnit:init(unit)
	self._unit = unit
	self._obj_block_centre = self._unit:get_object(Idstring("a_block_centre"))
	
	self:set_materials(unit)
	self:cast_adjacent(false)
	
end

function CubeUnit:set_materials(unit)
	local block_id = self._block_id

	if self._block_id then
		local block_object = BlockData[block_id].object_type
		
		self._object_directions = {
			x_neg = { "g_x_neg" },
			x_pos = { "g_x_pos" },
			y_neg = { "g_y_neg" },
			y_pos = { "g_y_pos" },
			z_neg = { "g_z_neg" },
			z_pos = { "g_z_pos" }
		}
		
		--Added Returns if it gets the right block because I assume it's less work?
		if block_object == "block_solid" then
			--If I'm a solid 1x1x1m block then give textures
			local tweakmaterial = BlockData[block_id].materials
			local material_texture = {
				[Idstring("mtl_x_neg"):key()] = tweakmaterial.mtl_x_neg,
				[Idstring("mtl_x_pos"):key()] = tweakmaterial.mtl_x_pos,
				[Idstring("mtl_y_neg"):key()] = tweakmaterial.mtl_y_neg,
				[Idstring("mtl_y_pos"):key()] = tweakmaterial.mtl_y_pos,
				[Idstring("mtl_z_neg"):key()] = tweakmaterial.mtl_z_neg,
				[Idstring("mtl_z_pos"):key()] = tweakmaterial.mtl_z_pos
			}
			local materials = unit:get_objects_by_type(Idstring("material"))
			for i = 1, #materials do
				local material = materials[i]
				local material_key = material:name():key()

				local new_texture = material_texture[material_key]
				if new_texture then
					Application:set_material_texture(material, Idstring("diffuse_texture"), new_texture, Idstring("normal"))
				end
			end
			return
		elseif block_object == "block_grow" then
			--If I'm a # shaped grow block (Wheat, Potatas)
			local tweakstagematerial = BlockData[block_id].staged_materials
			local material_texture = {
				[Idstring("mtl_grow"):key()] = tweakstagematerial.mtl_grow
			}
			local materials = unit:get_objects_by_type(Idstring("material"))
			for i = 1, #materials do
				local material = materials[i]
				local material_key = material:name():key()

				local new_texture = material_texture[material_key]
				if new_texture then
					Application:set_material_texture(material, Idstring("diffuse_texture"), new_texture, Idstring("normal"))
				end
			end
			return
		elseif block_object == "block_crossed" then
			--If I'm an X shaped block (Tall grass, Webs)
			local tweakstagematerial = BlockData[block_id].single_material
			local material_texture = {
				[Idstring("mtl_crossed"):key()] = tweakstagematerial.mtl_crossed
			}
			local materials = unit:get_objects_by_type(Idstring("material"))
			for i = 1, #materials do
				local material = materials[i]
				local material_key = material:name():key()

				local new_texture = material_texture[material_key]
				if new_texture then
					Application:set_material_texture(material, Idstring("diffuse_texture"), new_texture, Idstring("normal"))
				end
			end
			return
		end
	end
end

local directions = {
	x_neg = Vector3(-100, 0, 0),
	x_pos = Vector3(100, 0, 0),
	y_neg = Vector3(0, -100, 0),
	y_pos = Vector3(0, 100, 0),
	z_neg = Vector3(0, 0, -100),
	z_pos = Vector3(0, 0, 100)
}

function CubeUnit:set_side(direction, state)
    --log(tostring(direction))

	local objects = self._object_directions[direction]
    if not objects then return end

	for i, object_name in pairs(objects) do
		local object = self._unit:get_object(Idstring(object_name))

		if object then
			object:set_visibility(state)
		end
	end
end

local function invert_direction(direction)
	local posneg = string.sub(direction, -3)
	local axis = string.sub(direction, 1, 1)
	if posneg == "pos" then
		return axis .. "_neg"
	elseif posneg == "neg" then
		return axis .. "_pos"
	end

	return ""
end

function CubeUnit:cast_adjacent(destroying)
	destroying = not not destroying -- Boolean.
	
	for direction, direction_vector in pairs(directions) do
		local from = self._obj_block_centre:position()
		local to = from + direction_vector
		local raycast = self._unit:raycast("ray", from, to)

		if raycast then
			if raycast.unit and raycast.unit.cube_unit then
				local block_id = self._block_id
				if BlockData[block_id].object_type == "block_solid" then
					self:set_side(direction, false)
					local inverted_direction = invert_direction(direction)
					if raycast and raycast.unit and alive(raycast.unit) and raycast.unit.cube_unit then
						raycast.unit:cube_unit():set_side(inverted_direction, destroying)
					end
				end
			end
		else
			self:set_side(direction, true)
		end
	end
end

function CubeUnit:block_grow()
    -- log("Trying to grow!")
	-- Todo actually make plants
end

function CubeUnit:damage_block(unit)
	local block_id = self._block_id
	if self._block_id then
		local isbreakable = BlockData[block_id].breakable
		if isbreakable then
			local doesexplode = BlockData[block_id].explode
			if doesexplode then
				self._unit:damage():run_sequence_simple("explode_block")
			end
			self._unit:damage():run_sequence_simple("crack_block")
		else
			-- nothing
		end
	end
end

function CubeUnit:heal_block(unit)
end

function CubeUnit:update_block(unit)
	local block_id = self._block_id
	if self._block_id then
		local hasgrav = BlockData[block_id].gravity
		if hasgrav then
			-- log('IM FALLING!!')
			self._unit:damage():run_sequence_simple("make_dynamic")
		else
			-- log('I float.')
			self._unit:damage():run_sequence_simple("make_static")
		end
	end
end

function CubeUnit:clean_pos_rot(pos)
	-- log('Cleaning Pos/Rot')
	local pos = Vector3(math.round(pos.x, 100), math.round(pos.y, 100), math.round(pos.z, 100))
	local rot = Vector3(0, 0, 0)
	self._unit:set_position(pos)
	self._unit:set_rotation(rot)
end

function CubeUnit:broke_block()
	--not "destroy" for the sake of not lagging on reload 
	self:cast_adjacent(true)
end

function CubeUnit:destroy()
	--Dont use this for anything heavy.
end

