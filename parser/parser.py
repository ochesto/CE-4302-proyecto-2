#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  parser.py
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


def main(args):
    return 0

def operandos(operando):
	if operando == "t0":	
		return "00000"
	elif operando == "t1":
		return "00001"
	elif operando == "t2":
		return "00010"
	elif operando == "t3":
		return "00011"
	elif operando == "t4":
		return "00100"
	elif operando == "t5":
		return "00101"
	elif operando == "t6":
		return "00110"
	elif operando == "t7":
		return "00111"
	elif operando == "s0":	
		return "01000"
	elif operando == "s1":
		return "01001"
	elif operando == "s2":
		return "01010"
	elif operando == "s3":
		return "01011"
	elif operando == "s4":
		return "01100"
	elif operando == "s5":
		return "01101"
	elif operando == "s6":
		return "01110"
	elif operando == "s7":
		return "01111"


def opCode(opC):
	if opC == "add" or opC == "addv" :	
		return "000000"
	elif opC == "sub" or opC == "subv":
		return "000010"
	elif opC == "xor" or opC == "xorv":
		return "000100"
	elif opC == "lw"  or opC == "lwv":
		return "001011"
	elif opC == "sw"  or opC == "swv":
		return "001100"
	elif opC == "j":
		return "001101"
	elif opC == "addi":
		return "000001"
	elif opC == "xori":
		return "000101"
	elif opC == "subi":
		return "000011"
	elif opC == "mult":
		return "000110"
	elif opC == "slv":
		return "000111"
	elif opC == "srv":
		return "001000"
	elif opC == "sclv":
		return "001001"
	elif opC == "scrv":
		return "001010"
	elif opC == "beq":
		return "010000"
	elif opC == "nop":
		return "111111"


def inmediato(inm):
	return str(bin(inm)[2:].zfill(16))

def direccion(inm):
	return str(bin(inm)[2:].zfill(26))

def shift(inm):
	return str(bin(inm)[2:].zfill(3))
def nop():
	return str("").zfill(26)
	

if __name__ == '__main__':
    import sys
    aux=''
    splitInst='--'
   
    with open("config.in") as f:
    	while True:
    		c = f.read(1)
    		aux+=c
    		if not c:
    			#print "End of file"
    			break
    	
    	array1=aux.split("\n")
    	array1=aux.split(",")
    	array1=aux.split("\n")
    	i=0
    	for x in array1:
    		array1[i]=array1[i].replace(' ', '')
    		array1[i]=array1[i].split(",")
    		i+=1
    	i=j=0
    	array2=[]
    	for x in array1:
    		aux1=array1[i][0].split("$")
    		array1[i]=aux1+array1[i][1:]
    		i+=1
    	i=j=0
    	for x in array1:
    		for y in x:
    			if j!=0:
    				array1[i][j]=array1[i][j].replace('$', '')
    			j+=1
    		i+=1
    		j=0;
    	j=0;
    	i=0
    	program = file("program.txt", 'w')
    	binario=""
    	print array1
    	for x in array1:
    		opCod=array1[i][0];

    		if opCod=="add" or opCod=="addv" or opCod=="sub" or opCod=="subv" or opCod=="xor" or opCod=="xorv" or opCod=="lw" or opCod=="sw" or opCod=="mult" or opCod=="lwv " :
    			binario=opCode(opCod)+splitInst
    			binario+=operandos(array1[i][1])+splitInst#operando destino
    			binario+=operandos(array1[i][2])+splitInst#operando 1
    			binario+=operandos(array1[i][3])+splitInst#operando 2
    			binario+="0000000"+splitInst#relleno
    			binario+="000"+splitInst#shift
    			if opCod.find('v')!=(-1):
    				binario+="1"
    			else:
    				binario+="0"
    			binario+='\n'
    			program = file("program.txt", 'a')
    			program.write(binario)
    			i+=1
    		elif opCod=="addi" or opCod=="subi" or opCod=="xori" or opCod=="beq" :
    			binario=opCode(opCod)+splitInst
    			binario+=operandos(array1[i][1])+splitInst#operando destino
    			binario+=operandos(array1[i][2])+splitInst#operando 1
    			binario+=inmediato(int(array1[i][3]))#inmediato
    			binario+='\n'
    			program = file("program.txt", 'a')
    			program.write(binario)
    			i+=1
    		elif opCod=="j":
    			binario=opCode(opCod)+splitInst
    			binario+=direccion(int(array1[i][1]))+splitInst#inmediato
    			binario+='\n'
    			program = file("program.txt", 'a')
    			program.write(binario)
    			i+=1
    		elif opCod=="slv" or opCod=="srv" or opCod=="sclv" or opCod=="scrv":
    			binario=opCode(opCod)+splitInst
    			binario+=operandos(array1[i][1])+splitInst#operando destino
    			binario+=operandos(array1[i][2])+splitInst#operando 2
    			binario+="00000"+splitInst#operando b
    			binario+="0000000"+splitInst#operando 
    			binario+=shift(int(array1[i][3]))+splitInst#shift
    			if opCod.find('v')!=(-1):
    				binario+="1"
    			else:
    				binario+="0"
    			binario+='\n'
    			program = file("program.txt", 'a')
    			program.write(binario)
    			i+=1
    		elif opCod=="nop":
    			binario=opCode(opCod)+splitInst
    			binario+=nop()
    			binario+='\n'
    			program = file("program.txt", 'a')
    			program.write(binario)
    			i+=1

    	#print(array1)
    	
    sys.exit(main(sys.argv))
