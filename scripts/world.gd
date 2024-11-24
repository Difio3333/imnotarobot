extends Node2D

var loaded_levels: Array[PackedScene]
var current_level_index: int = 0

func _ready():
	
	Messenger.connect("LEVEL_WIN",next_level)
	Messenger.connect("LEVEL_LOSE",last_level)
	load_levels()
	load_current_level()
	
func load_levels():
	var folder_path = "res://levels/"
	var dir = DirAccess.open(folder_path)
	
	if not dir:
		print("Failed to open directory")
		return
	dir.list_dir_begin()
		
	var file_name = dir.get_next()
		
	while file_name != "":
	
		if dir.current_is_dir():
			file_name = dir.get_next()
			continue
			
		if file_name.ends_with(".tscn"):
			var scene_path = folder_path + "/" + file_name
			var packed_scene = load(scene_path)
			if packed_scene:
				loaded_levels.append(packed_scene)
			
		file_name = dir.get_next()
		
	dir.list_dir_end()

func load_current_level():
	for child in get_children():
		if not child.is_in_group("Level"):
			continue
		child.queue_free()
	
	var current_level = loaded_levels[current_level_index].instantiate()
	call_deferred("add_child",current_level)

func next_level():
	current_level_index += 1
	load_current_level()
func last_level():
	current_level_index -= 1
	load_current_level()
