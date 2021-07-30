from PIL import Image
import numpy as np
import matplotlib.pyplot as plt

img = Image.open('./1.jpg')
img = np.fliplr(img)
plt.axis('off')
plt.imshow(img)

plt.savefig("save/1.jpg",bbox_inches='tight')