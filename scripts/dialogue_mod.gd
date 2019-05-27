extends RichTextLabel

func _ready():
	set_visible_characters(0)
	pass # Replace with function body.

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)
	pass # Replace with function body.
