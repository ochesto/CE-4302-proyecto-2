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
		pixel2 = newGray[row, colum+1]
		pixel3 = newGray[row, colum+2]
		pixel4 = newGray[row, colum+3]		

		pixel1 = str(hex(pixel1)[2:])
		pixel2 = str(hex(pixel2)[2:])
		pixel3 = str(hex(pixel3)[2:])
		pixel4 = str(hex(pixel4)[2:])

		pixels = pixel1 + pixel2 + pixel3 + pixel4

		f.write(pixels )
		f.write("\n")
		colum += 4
		counter += 1
	row += 1
	colum = 0


f.close()

		