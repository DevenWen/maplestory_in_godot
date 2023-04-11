# maplestory_in_godot

godot is powerful game engine. It's nice to create 2D platform game, such as MapleStory. I am going to write some GDscript for the Maplestory Role\Mod\BGM etc, so we can use the asset for our own demo games. 


## TODO

- [x]  将 xml 文件转化为 json 文件
	
	因为 godot 对 xml 文件的支持不是很好。
	
- [x]  编写 Godot MapleStory 资源库
	- [x]  该资源库可以通过路径直接访问数据。
	- [x]  初始化数据，构建一个树形结构，双向数据。
	- [ ]  对于 Object 对象，应该如何在 Godot 编辑呢？
		- [ ]  可以编写一个 properties ，记录资源库的 path，并且标记它的 Type 为 Object
		- [ ]  通过 Tileset 将对象先贴到编辑界面中。（最好可以做到对象的隐含数据就是 path）
- [ ]  编写 MapleStory 动画库
	- [x]  人物动画库
		- [x]  json 数据转动画调研。需要调研清楚 Godot 的动画模块，能不能通过数据定义动画。
		- [x]  人物拼接算法移植
			- [x]  Godot 的节点粘贴调研
			- [x]  body、head、arm
			- [x]  face、hair
			- [x]  items
		- [x]  人物动作播放
	- [ ]  怪物动画库
	- [ ]  场景动画库
		- [ ]  背景（可复用）
		- [ ]  地图（可编辑）
		- [ ]  Object 编辑
		- [ ]  BGM
	- [ ]  UI 动画库
		- [ ]  对话聊天
		- [ ]  NPC
- [ ]  编写网络模块
	- [ ]  状态同步
		- [ ]  人物
			- [ ]  状态机
		- [ ]  怪物
			- [ ]  状态机
			- [ ]  怪物可以通过状态机控制，由服务端选取一个客户端进行运算。


## Tips

1. 使用 Maker2D 可以完成 Flip 操作
