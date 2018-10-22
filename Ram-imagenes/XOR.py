#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  untitled.py
#  
#  Copyright 2018 Geovanny A. Espinoza Quiros <geovanny@geovanny-VirtualBox>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#  

import numpy as np
import cv2
from bitstring import BitArray


def main(args):
	return 0

if __name__ == '__main__':
	import sys
	image = cv2.imread("/home/geovanny/Desktop/Arqui2-Proyecto2-RamCreator-master/output_greymon.jpg")
	image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
	XOR=[0,0,1,1,1,1,1,1]
	XOR1=[0,1,0,1,0,1,0,1]
	#XOR=[0,0,0,0,0,0,0,0]
	resultAux=[0,0,0,0,0,0,0,0]

	#print(image[0,0])
	for x in xrange(0, 100):
		for y in xrange(0, 100):
			for z in xrange(0, 8):
				resultAux[z]=bin(image[x,y])[2:].zfill(8)[z] != XOR[z]
			print(str(resultAux))
	cv2.imwrite('filtros/output_xor.jpg', image)
	#sys.exit(main(sys.argv))