
from PIL import Image
import os

def turn_red(image_path):
	# Open the image
	img = Image.open(image_path)
	
	# Convert to RGBA if not already
	if img.mode != 'RGBA':
		img = img.convert('RGBA')
	
	# Get image data
	data = img.getdata()
	
	# Create new data with red tint
	new_data = []
	for r, g, b, a in data:
		# Turn red
		new_data.append((max(g,b), r, r, a))
	
	# Update image with new data
	img.putdata(new_data)
	
	# Save the modified image, overwriting original
	img.save(image_path)

def main():
	# Get current directory
	current_dir = os.path.dirname(os.path.abspath(__file__))
	
	# Process all images in current directory
	for filename in os.listdir(current_dir):
		if filename.lower().endswith(('.png', '.jpg', '.jpeg', '.gif')):
			image_path = os.path.join(current_dir, filename)
			try:
				turn_red(image_path)
				print(f"Processed {filename}")
			except Exception as e:
				print(f"Error processing {filename}: {e}")

if __name__ == "__main__":
	main()

