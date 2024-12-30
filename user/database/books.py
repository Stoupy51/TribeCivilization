
# Import database helper and setup constants
from python_datapack.utils.database_helper import *
from python_datapack.utils.ingredients import *
from python_datapack.constants import *

# Book IDs
BOOKS: dict[str, list[list[dict]]] = {
	"book_of_the_beginning": [
		[{"text":"Cette année, en l'an "},{"text":"XXXX","obfuscated":True},{"text":". Nos dieux ont tenté d'exploiter une créature maléfique qu'ils auraient ramené d'un monde parallèle.\n\nSa puissance avait pour but d'augmenter nos extractions de ressources pour que l'on puisse construire de plus en plus de structures."}],
		[{"text":"Grâce à aux pouvoirs de la créature, les dieux ont pu élire des demi-dieux, ils étaient reconnaissables grâce à leur deux cornes.\n\nL'un d'eux était un ami proche, mais plus le temps passait, moins je reconnaissais mon ami. Il avait changé."}],
		[{"text":"Un jour, cette créature s'est avérée incontrôlable, les demi-dieux ont été pris d'une folie meurtrière et démarra une bataille qui restera gravé à jamais dans ma mémoire."}],
		[{"text":"Les dieux ont été contraints de sceller la créature.\nLes demi-dieux, eux, ont tous été tués lors de cette tragédie.\n\nCependant, il n'y en avait qu'un seul à qui nous n'avons pas retrouvé le corps, nous devons rester vigilants."}],
		[{"text":"Aujourd'hui, cette créature est toujours scellée, mais les dieux ont constaté que son influence est trop forte, elle altère actuellement le monde négativement, l'apparition de monstres et de malédictions sont de plus en plus fréquentes."}],
		[{"text":"Ils ont donc décidé de visiter un autre monde parallèle afin de trouver une solution pour renvoyer la créature dans son monde, ou dans un autre."}],
		[{"text":"Nous ne sommes plus que 7 nébuliens, j'ai vraiment peur de ce qui pourrait arriver si le demi-dieu manquant venait à revenir pour continuer sa folie."}],
		[{"text":"J'ai décidé pour le groupe de répartir ces écrits dans le monde et de se regrouper vers le temple des dieux, ainsi nous avons un visuel sur l'île où la créature a été scellée.\n\nD'autres personnes pourraient aussi nous retrouver !"}],
	]

	# TODO: Book that says "Le demi-dieu nous a attaqué, il nous a tous tués mais j'ai réussi à échapper, j'arriverais pas à survivre car je l'hémorragie ne s'arrête pas, blablabla"
}

# Main function should return a database
def main(config: dict, database: dict[str, dict]) -> list[str]:
	ns: str = config["namespace"]

	# Books
	for book_id, pages in BOOKS.items():
		database[book_id] = {
			"id": "minecraft:written_book",
			"written_book_content": {
				"title": book_id.replace("_", " ").title(),
				"author": "Edward",
				"generation": 3,
				"pages": [json.dumps(page) for page in pages],
			}
		}

	# Return black list (all books)
	return list(BOOKS.keys())

