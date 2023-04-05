extends CharacterSprite

class_name CapSprite


func draw(draw_map):
	draw_map = super.draw(draw_map)
	print("after draw cap...")
	var wznode = WZLib.get_by_path("Character/%s/info"%[self.img])
	print("wznode: ", wznode.data.vslot)
	var hairNode = get_parent().find_child("Hair") as HairSprite
	var faceNode = get_parent().find_child("Hair") as FaceSprite
	match wznode.data.vslot:
		"CpH5":
			pass
		"CpH1H5":
			hairNode.free_sprite_by_part("hairOverHead")
			hairNode.free_sprite_by_part("backHair")
		_:
			hairNode.free_sprite_by_part("hair")
			hairNode.free_sprite_by_part("hairOverHead")
			hairNode.free_sprite_by_part("backHair")
			faceNode.reset()
		
	return draw_map
