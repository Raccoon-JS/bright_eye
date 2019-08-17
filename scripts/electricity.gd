extends Area2D

signal charged

func _ready():
	add_to_group("electric")
	$movement.play("movement")
	pass # Replace with function body.

func _on_electricity_body_entered(body):
	if body.name == "eyeball":
		emit_signal("charged")
		$movement.play("gone")
	pass # Replace with function body.

func _on_movement_animation_finished(anim_name):
	if anim_name == "gone":
		queue_free()
	pass # Replace with function body.
