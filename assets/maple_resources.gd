extends Node

enum {LOAD_OK, LOAD_FAIL}

# Member variable
var WZ = WZNode.new(null, "", {})

# Called when the node enters the scene tree for the first time.
func _ready():
	# test code
	print("ready for MapleResources.")
	var result = get_wz_path("Charactor/00002000.img/heal/0")
	print(result.data)
	
func get_wz_path(path):
	# path example: Character/00002000.img/motion/index
	# 判断缓存是否有，有则直接索引返回；
	# 缓存上没有，则加载文件，并初始化；
	var ss = path.split(".img")
	var file_path = ss[0]
	var sub_path = ss[1]
	if WZ.children.has(file_path):
		var data = WZ.children.get(file_path) as WZNode
		return find_for_sub_path(data, sub_path)
	else:
		if (load_wz_file(file_path) == LOAD_OK):
			return get_wz_path(path)
		else:
			printerr("get wz path fail: ", path)
			return {}
	
func load_wz_file(file_path):
	var path = "res://assets/"+ file_path + ".img.xml.json"
	var file = FileAccess.open(path, FileAccess.READ)
	var error = FileAccess.get_open_error()
	if error != OK:
		printerr("Load wz file fail ", file_path, " reason: ", error)
		return LOAD_FAIL
	var data = JSON.parse_string(file.get_as_text())
	WZ.children[file_path] = createWzNode(WZ, data)
	print("Load wz file success ", path)
	return OK
	
static func find_for_sub_path(data: WZNode, sub_path: String):
	# TODO
	# 拆解 sub_path
	# 循环获取 sub_path 的数据
	var path = sub_path.split("/", false)
	return data.find(path)
	
static func init_wz_data(json_data):
	# TODO
	# 递归便利对象
	# 发现 image 数据，都直接转化成 Image 对象
	# 发现 音频 数据，TODO 处理
	# 构建一个回溯指针，指向父节点
	return json_data

static func createWzNode(parent, data):
	# if data["type"] != 'object'
	if typeof(data) != TYPE_DICTIONARY:
		return null;
		
	var name = data["name"]
	if data.get("type") == "uol":
		var path = data["path"]
		return UOLWZNode.new(parent, name, data, path)
	
	var result = WZNode.new(parent, name, data)	
	for sub_name in data.get("_keys", {}):
		result.children[sub_name] = createWzNode(result, data[sub_name])
		
	return result
	
class WZNode:
	var parent = null
	var name = null
	var data = {}
	var children = {}
	
	func _init(parent, name, data):
		# 递归构建 WZNode 对象
		self.parent = parent
		self.name = name
		self.data = data
	
	func find(path: Array):
		# 索引查找数据
		var next = path.pop_front()
		match next:
			"..": 
				return parent.find(path)
			".": 
				return self
			null: 
				return self
			_:
				return children[next].find(path) 
		
		printerr("can not find wznode path: ", path, " current node: ", self)
		return null
		
class UOLWZNode extends WZNode:
	var uol_path: String
	
	func _init(parent, name, data, path):
		self.name = name
		self.parent = parent
		self.data = data
		self.uol_path = path
	
	func find(path: Array):
		path.append_array(self.uol_path.split("/", false))
		return self.parent.find(path)
	
