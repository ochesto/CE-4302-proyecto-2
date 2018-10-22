import numpy as np
import cv2
from bitstring import BitArray

img ="greymon.jpg"
image = cv2.imread("/home/geovanny/Desktop/Ram-imagenes/greymon.jpg")
image_gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
newGray = cv2.resize(image_gray, (48, 48))

cv2.imwrite('newGrayPicture.jpg', newGray)

#header
f = open("Data_Image.di", "w+")
row, colum, counter = 0, 0, 0
height, width = newGray.shape[:2]


while(row < height):
	while(colum < width):
		pixel1 = newGray[row, colum]
		pixel1 = str(hex(pixel1)[2:])
		f.write(pixel1 )
		f.write("\n")
		colum += 1
		counter += 1
	row += 1
	colum = 0


f.close()

		