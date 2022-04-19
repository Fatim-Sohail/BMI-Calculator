Include Irvine32.inc

.data


bmi DWORD ?
con DWORD ?
weight DWORD ?
height DWORD ?

cc dword 1000000
n byte " Enter you name: ",0
w BYTE " Enter your weight in pounds: ", 0
h BYTE " Enter your height in Inches: ", 0
bmii BYTE " BMI is: ", 0

over BYTE "	Overweight = 25 - 29.9", 0
under BYTE "	Underwight = <18.5", 0
norm BYTE "	Normal Weight = 18.5 - 24.9", 0
obes BYTE "	Obesity = BMI of 30 or greater", 0

typ   BYTE"	Underweight   = < 19.9", 0ah,0dh
		BYTE "	Normal Weight = 20 - 24.9", 0ah,0dh
		BYTE "	Overweight    = 25 - 29.9", 0ah,0dh
		BYTE "	Obesity       = 30 <", 0
nam dword 40 dup (?)

.code

main PROC
	mov eax, 0
		mov con, 703


		mov edx, offset n				;input name
		call WriteString
		mov edx, offset nam
		mov ecx, 50
		call ReadString
		mov nam, eax
	
		mov edx, offset w				;input weight
		call WriteString
		call ReadDec
		mov weight, eax
			
		mov edx, offset h				; input height
		call WriteString
		call ReadDec
		mov height, eax

		mov eax, weight				;calc BMI
		mul con								; bmi = (w*703)/(h*h)
		mov ecx, eax

		mov eax, height
		mul height
			;call WriteInt
			;call DumpRegs
		mov ebx, eax							; ebx = (h*h)
		mov eax, ecx							; eax = (w*703)
		div ebx

		mov edx, OFFSET bmii
		call WriteString
		call WriteDec

		mov eax, '.'
		call WriteChar
		mov eax, edx
		mul cc
		mov edx, 0
		div ebx
		mov bmi, eax	
		call WriteDec
		call CRLF
		call CRLF
			
		mov edx, OFFSET typ
		call WriteString
		call CRLF
	

	exit
main ENDP
END main
