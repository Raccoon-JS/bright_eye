extends Node

onready var g = get_parent().get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	if g.get_name() == "prologue":
		var center = 400
		g.write("BRIGHT EYE", null, Vector2(450,100), Vector2(0.7,0.7))
		g.write("black felien corps", null, Vector2(center,320), Vector2(1,1))
		g.write("\"we cach big fishs\"", null, Vector2(center,320), Vector2(1,1))
		g.write("board meatn topic - we rn out uv money 4 cachn big fishs in n deap s.", null, Vector2(center,760), null)
		g.write("Tom","we nid money 4 teh bigur fish.",Vector2(center,1100),null)
		g.write("Thom","ho dew we dew so?", Vector2(center,1420),null)
		g.write("Tommy","first, we nid 2 build n inteligent eyebol 4 evuri ndroid.", Vector2(center,1840), null)
		g.write("Thomas","fntastic!", Vector2(center, 2200), null)
		g.write("Tom", "i jus hirid an hundrid uv scentists 2 develop dis inteligent eyebol.", Vector2(center, 2600), null)
		g.write("Thom","they r putng dis eyebol in n intense hel.", Vector2(center, 2950), null)
		g.write("Tommy","let sea hao it gos.", Vector2(center, 2950), null)
		g.write("Thomas", "i em grabn mai popcourn.", Vector2(center, 3200), null)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
