
# Imports
from python_datapack.constants import *
from python_datapack.utils.print import *
from python_datapack.utils.io import *
from PIL import Image

# Generates font things in the datapack
def main(config: dict) -> None:
	namespace: str = config["namespace"]
	build_resource_pack: str = config["build_resource_pack"]
	assets_folder: str = config["assets_folder"]

	# Constants
	BLACK_TEXT: str = "S"

	# Make a font
	font_providers: dict[str, list[dict]] = {
		"providers": [
			{"type":"bitmap","file":f"{namespace}:font/black.png","ascent":80,"height":160,"chars":[BLACK_TEXT]}
		]
	}
	write_to_file(f"{build_resource_pack}/assets/{namespace}/font/main.json", super_json_dump(font_providers))

	# Create a black pixel image
	image: Image.Image = Image.new("RGB", (2, 1), color="black")
	image.save(f"{build_resource_pack}/assets/{namespace}/textures/font/black.png")

	# Make a function to make the black screamer
	write_to_function(config, f"{namespace}:utils/black_screen_default", f"""
title @s title {{"text":"{BLACK_TEXT}","font":"{namespace}:main"}}
""")
	write_to_function(config, f"{namespace}:utils/black_screen_20_40_0", f"""
title @s times 20 40 0
function {namespace}:utils/black_screen_default
""")
	write_to_function(config, f"{namespace}:utils/black_screen_0_40_20", f"""
title @s times 0 40 20
function {namespace}:utils/black_screen_default
""")
	write_to_function(config, f"{namespace}:utils/black_screen_0_100_0", f"""
title @s times 0 100 0
function {namespace}:utils/black_screen_default
""")

	pass

