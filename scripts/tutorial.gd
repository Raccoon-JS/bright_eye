extends Node

onready var hud = $eyeball/camera/HUD
#var electricity = preload("res://scenes/items/electricity.tscn")

func _ready():
	hud.time_option(name)
	pass
