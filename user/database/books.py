
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
	],

	"book_of_the_end": [
		[{"text":"Le demi-dieu nous a retrouvé. Il est arrivé sans prévenir, surgissant des ombres. Ses cornes semblaient plus grandes, plus menaçantes qu'avant.\n\nSon regard... ce n'était plus celui de mon ami. Ses yeux brillaient d'une lueur maléfique que je n'avais jamais vue auparavant."}],
		[{"text":"Il nous a attaqué avec une violence inouïe. Mes compagnons... ils n'ont eu aucune chance. J'entends encore leurs cris résonner dans ma tête.\n\nJ'ai réussi à m'échapper, mais son épée m'a transpercé. L'hémorragie ne s'arrête pas, je sens mes forces m'abandonner."}],
		[{"text":"Avant de partir, il parlait tout seul, murmurant des choses à propos de la créature. Il disait qu'elle l'appelait, qu'elle avait besoin de lui.\n\nJe l'ai vu partir vers le sud-est, en direction de l'île maudite."}],
		[{"text":"Cette île... impossible de la manquer. Coupée en deux par la corruption de la créature, et sa forme particulière la rend reconnaissable entre mille.\n\nC'est là que la créature est scellée, et c'est là qu'il se dirige."}],
		[{"text":"Je... je dois prévenir les autres... mais ma vision se trouble déjà. Le sang... il y en a tellement...\n\nSi quelqu'un trouve ce livre... arrêtez-le... avant qu'il ne soit trop... Je... Je n'ai plus..."}]
	],
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

