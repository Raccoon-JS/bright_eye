extends Node

func _on_start_pressed():
	global.goto_scene("res://scenes/prologue.tscn")
	pass 

func _on_Button_mouse_entered():
	$credit/Label.text = "credit"
	pass # Replace with function body.

func _on_credit_mouse_exited():
	$credit/Label.text = ""
	pass # Replace with function body.

func _on_quit_mouse_entered():
	$quit/Label.text = "quit"
	pass # Replace with function body.

func _on_quit_mouse_exited():
	$quit/Label.text = ""
	pass # Replace with function body.

func _on_credit_pressed():
	global.goto_scene("res://scenes/credit.tscn")
	pass # Replace with function body.

func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
