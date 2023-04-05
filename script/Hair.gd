extends CharacterSprite

class_name HairSprite

# 监听节点的事件，以删除部分数据

func draw(draw_map):
	draw_map = super.draw(draw_map)
	print("after draw hair...")
	return draw_map
