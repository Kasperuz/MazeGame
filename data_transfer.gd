extends Node

var custom: bool
var size: int
var turnChance: float
var level: int

func setValue(generator: Node):
	generator.Size = Vector2i(size,size)
	generator.TurnChance = turnChance
