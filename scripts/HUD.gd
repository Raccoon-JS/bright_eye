extends CanvasLayer

var watts = 0
onready var score = $score

func time_option(stage_name):
	if stage_name == "testing":
		hide_time()
	pass

func _add_score():
	watts += 10
	score.set_text(str(watts))
	pass

func hide_time():
	$time.visible = !$time.visible
	pass