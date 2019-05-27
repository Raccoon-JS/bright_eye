extends Camera2D

onready var tween = $Tween

func move_camera(prev_dir, next_dir):
	tween.interpolate_property(self, "position", prev_dir, next_dir, .5, Tween.TRANS_SINE, Tween.EASE_OUT)
	tween.start()
	pass
	
func zoom_camera(prev_scale, next_scale):
	tween.interpolate_property(self, "zoom", prev_scale, next_scale, .5, Tween.TRANS_SINE, Tween.EASE_OUT )
	tween.start()
	pass