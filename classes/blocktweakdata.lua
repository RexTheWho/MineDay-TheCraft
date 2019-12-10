BlockData = BlockData or {}

BlockData.default = {
	id = "0000",
	gravity = false,
	breakable = false,
	object_type = "block_solid",
    materials = {
        mtl_z_pos = Idstring("units/pd2_mod_java/blocks/textures/missing"),
        mtl_z_neg = Idstring("units/pd2_mod_java/blocks/textures/missing"),
        mtl_x_pos = Idstring("units/pd2_mod_java/blocks/textures/missing"),
        mtl_x_neg = Idstring("units/pd2_mod_java/blocks/textures/missing"),
        mtl_y_pos = Idstring("units/pd2_mod_java/blocks/textures/missing"),
        mtl_y_neg = Idstring("units/pd2_mod_java/blocks/textures/missing")
    }
}
BlockData.bedrock = {
	gravity = false,
	breakable = false,
	object_type = "block_solid",
    materials = {
        mtl_z_pos = Idstring("units/pd2_mod_java/blocks/textures/bedrock"),
        mtl_z_neg = Idstring("units/pd2_mod_java/blocks/textures/bedrock"),
        mtl_x_pos = Idstring("units/pd2_mod_java/blocks/textures/bedrock"),
        mtl_x_neg = Idstring("units/pd2_mod_java/blocks/textures/bedrock"),
        mtl_y_pos = Idstring("units/pd2_mod_java/blocks/textures/bedrock"),
        mtl_y_neg = Idstring("units/pd2_mod_java/blocks/textures/bedrock")
    }
}
BlockData.dirt = {
	gravity = false,
	breakable = true,
	object_type = "block_solid",
	decal_material = "dirt",
    materials = {
        mtl_z_pos = Idstring("units/pd2_mod_java/blocks/textures/dirt"),
        mtl_z_neg = Idstring("units/pd2_mod_java/blocks/textures/dirt"),
        mtl_x_pos = Idstring("units/pd2_mod_java/blocks/textures/dirt"),
        mtl_x_neg = Idstring("units/pd2_mod_java/blocks/textures/dirt"),
        mtl_y_pos = Idstring("units/pd2_mod_java/blocks/textures/dirt"),
        mtl_y_neg = Idstring("units/pd2_mod_java/blocks/textures/dirt")
    }
}
BlockData.grass = {
	gravity = false,
	breakable = true,
	object_type = "block_solid",
    materials = {
        mtl_z_pos = Idstring("units/pd2_mod_java/blocks/textures/grass_block_top"),
        mtl_z_neg = Idstring("units/pd2_mod_java/blocks/textures/dirt"),
        mtl_x_pos = Idstring("units/pd2_mod_java/blocks/textures/grass_block_side"),
        mtl_x_neg = Idstring("units/pd2_mod_java/blocks/textures/grass_block_side"),
        mtl_y_pos = Idstring("units/pd2_mod_java/blocks/textures/grass_block_side"),
        mtl_y_neg = Idstring("units/pd2_mod_java/blocks/textures/grass_block_side")
    }
}
BlockData.sand = {
	gravity = true,
	breakable = true,
	object_type = "block_solid",
    materials = {
        mtl_z_pos = Idstring("units/pd2_mod_java/blocks/textures/sand"),
        mtl_z_neg = Idstring("units/pd2_mod_java/blocks/textures/sand"),
        mtl_x_pos = Idstring("units/pd2_mod_java/blocks/textures/sand"),
        mtl_x_neg = Idstring("units/pd2_mod_java/blocks/textures/sand"),
        mtl_y_pos = Idstring("units/pd2_mod_java/blocks/textures/sand"),
        mtl_y_neg = Idstring("units/pd2_mod_java/blocks/textures/sand")
    }
}
BlockData.tnt = {
	gravity = false,
	breakable = true,
	object_type = "block_solid",
	explode = true,
    materials = {
        mtl_z_pos = Idstring("units/pd2_mod_java/blocks/textures/tnt_top"),
        mtl_z_neg = Idstring("units/pd2_mod_java/blocks/textures/tnt_bottom"),
        mtl_x_pos = Idstring("units/pd2_mod_java/blocks/textures/tnt_side"),
        mtl_x_neg = Idstring("units/pd2_mod_java/blocks/textures/tnt_side"),
        mtl_y_pos = Idstring("units/pd2_mod_java/blocks/textures/tnt_side"),
        mtl_y_neg = Idstring("units/pd2_mod_java/blocks/textures/tnt_side")
    }
}
BlockData.stone = {
	gravity = false,
	breakable = true,
	object_type = "block_solid",
    materials = {
        mtl_z_pos = Idstring("units/pd2_mod_java/blocks/textures/stone"),
        mtl_z_neg = Idstring("units/pd2_mod_java/blocks/textures/stone"),
        mtl_x_pos = Idstring("units/pd2_mod_java/blocks/textures/stone"),
        mtl_x_neg = Idstring("units/pd2_mod_java/blocks/textures/stone"),
        mtl_y_pos = Idstring("units/pd2_mod_java/blocks/textures/stone"),
        mtl_y_neg = Idstring("units/pd2_mod_java/blocks/textures/stone")
    }
}
BlockData.obsidian = {
	gravity = false,
	breakable = true,
	object_type = "block_solid",
    materials = {
        mtl_z_pos = Idstring("units/pd2_mod_java/blocks/textures/obsidian"),
        mtl_z_neg = Idstring("units/pd2_mod_java/blocks/textures/obsidian"),
        mtl_x_pos = Idstring("units/pd2_mod_java/blocks/textures/obsidian"),
        mtl_x_neg = Idstring("units/pd2_mod_java/blocks/textures/obsidian"),
        mtl_y_pos = Idstring("units/pd2_mod_java/blocks/textures/obsidian"),
        mtl_y_neg = Idstring("units/pd2_mod_java/blocks/textures/obsidian")
    }
}
BlockData.wheat = {
	gravity = false,
	breakable = true,
	object_type = "block_grow",
	staged = true,
    staged_materials = {
        mtl_grow = Idstring("units/pd2_mod_java/blocks/textures/wheat_stage0"),
        mtl_grow = Idstring("units/pd2_mod_java/blocks/textures/wheat_stage1"),
        mtl_grow = Idstring("units/pd2_mod_java/blocks/textures/wheat_stage2"),
        mtl_grow = Idstring("units/pd2_mod_java/blocks/textures/wheat_stage3"),
        mtl_grow = Idstring("units/pd2_mod_java/blocks/textures/wheat_stage4"),
        mtl_grow = Idstring("units/pd2_mod_java/blocks/textures/wheat_stage5"),
        mtl_grow = Idstring("units/pd2_mod_java/blocks/textures/wheat_stage6"),
        mtl_grow = Idstring("units/pd2_mod_java/blocks/textures/wheat_stage7")
    }
}
BlockData.grass_plant = {
	gravity = false,
	breakable = true,
	object_type = "block_crossed",
    single_material = {
        mtl_crossed = Idstring("units/pd2_mod_java/blocks/textures/grass")
    }
}