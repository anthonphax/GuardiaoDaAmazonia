extends Node2D

var cidades = [
	"Londrina",
	"Curitiba", 
	"Porto Alegre", 
	"Florianópolis", 
	"Natal"
]

var dic = {
	0 : "Homem-Aranha",
	1 : "Duende",
	2 : "JJ Jameson" 
}

func _ready():
	cidades.remove(3)
#	for i in range(0, cidades.size()):
#		print(cidades[i])
#	for i in cidades:
#		print(i) #ARRAY
#	print("\n")
#	for key in dic:
#		print(dic[key]) #DICIONÁRIO
	pass
