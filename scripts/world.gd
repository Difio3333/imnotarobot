extends Node2D

var loaded_levels: Array[PackedScene]
var loading_screen = preload("res://scenes/loading.tscn")
var current_level_index: int = 0
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _ready():
	
	Messenger.connect("LEVEL_WIN",display_loading_screen)
	Messenger.connect("LOADING_FINISHED",next_level)
	Messenger.connect("LEVEL_LOSE",last_level)
	load_levels()
	load_current_level()
	audio_stream_player.play()
	
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

func display_loading_screen():
	clear_level_assets()
	var current_level = loading_screen.instantiate()
	call_deferred("add_child",current_level)
	
func load_current_level():		
	clear_level_assets()
	var current_level = loaded_levels[current_level_index].instantiate()
	call_deferred("add_child",current_level)

func next_level():
	current_level_index += 1
	load_current_level()
	
func last_level():
	current_level_index -= 1
	load_current_level()

func clear_level_assets():
	for child in get_children():
		if child.is_in_group("Level"):
			child.call_deferred("queue_free")


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Exit"):
		get_tree().quit()
