from PIL import Image
import os, os.path
from PIL import Image, ImageEnhance,ImageOps

img_path = "./parakeet/"

list = os.listdir(img_path)

print(len(list))

for img in list:
    process = Image.open(img_path+img)
    new_image_add = ImageEnhance.Contrast(process).enhance(0.6)
    new_image_sub = ImageEnhance.Contrast(process).enhance(3)
    new_image_flip = ImageOps.flip(process)

    new_image_add.save("output/"+img+"_add.jpg")
    new_image_sub.save("output/"+img+"_sub.jpg")
    new_image_flip.save("output/"+img+"_flip.jpg")