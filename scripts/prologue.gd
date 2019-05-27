extends Node

onready var textbox_dialogue = $prologue_camera/text/textbox/dialogue
onready var textbox_name = $prologue_camera/text/textbox/name
onready var story_en = $prologue_camera/pro_dialogues

var event_queue = []
#var cam_dir = Vector2(0,0)
var prev_dir = Vector2(0,0)
var next_dir = Vector2(0,0)
var prev_scale = Vector2(1,1)
var next_scale = Vector2(1,1)
var clicks = 0
#var no_zoom = false

# Called when the node enters the scene tree for the first time.
func _ready():
	story_en.request_ready()
	#$prologue_camera.position = Vector2(370,100)
	#prev_dir = $prologue_camera.position
	#$prologue_camera.zoom = Vector2(0.5,0.5)
	#prev_scale = $prologue_camera.zoom
	write_component()
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("left_click"):
		clicks += 1
		write_component()
	pass

func write(char_name, text_str = null, cam_dir = null, new_scale = null):
	#print("hello - 1")
	if text_str == null:
		text_str = char_name
		char_name = ""
	if cam_dir == null:
		next_dir = prev_dir
	else:
		prev_dir = next_dir
		next_dir = cam_dir
	if new_scale == null:
		next_scale = prev_scale
		#no_zoom = true
	else:
		#no_zoom = false
		prev_scale = next_scale
		next_scale = new_scale
		
	
	event_queue.push_front({"name": char_name, "text": text_str, 
		"prev_dir": prev_dir, "next_dir": next_dir, "prev_scale": prev_scale, "next_scale": next_scale})
	
	pass

func write_component():
	if clicks >= 12:
		global.goto_scene("res://scenes/tutorial.tscn")
	else:
		$prologue_camera.zoom_camera(event_queue[event_queue.size() - 1]["prev_scale"], event_queue[event_queue.size() - 1]["next_scale"])
		$prologue_camera.move_camera(event_queue[event_queue.size() - 1]["prev_dir"], event_queue[event_queue.size() - 1]["next_dir"])
		textbox_name.clear()
		textbox_dialogue.clear()
		textbox_name.add_text(event_queue[event_queue.size() - 1]["name"])
		textbox_dialogue.add_text(event_queue[event_queue.size() - 1]["text"])
		textbox_dialogue.set_visible_characters(0)
		event_queue.pop_back()
	pass