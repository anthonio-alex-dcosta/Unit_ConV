.MODEL SMALL
.STACK 100H
.DATA     

menu db "your code here$"
invalid db "Your Input is invalid try again$"
menu_group db "|                                 GROUP 10                                     |$"

;Menu Variables 
menu_a db "|                                                                              |$" ;
menu00 db " ______________________________________________________________________________ $" 
menu000 db "|______________________________________________________________________________|$"
menu01 db "|                               Unit Converter                                 |$"
menu02 db "|        In this programme you can do the following type of conversions        |$"
menu03 db "|                Choose the number of conversion you want to do:               |$"
menu04 db "|                                1 : Length                                     |$"
menu05 db "|                                2 : Volume                                     |$"
menu06 db "|                                3 : Tempreature                                |$"
menu06_2 db "|                                4 : Weight                                     |$"
menu07 db "|This programme is enginered by:                                               |$"
menu08 db "|    * Annesha Das Priti (21201799)                                            |$"
menu09 db "|    * Tasnim Sultana (19301173)                                               |$" 
menu010 db "|    * Anthonio Alex D Costa (22101749)                                        |$"
menu011 db "|press (E) to exit.                                                            |$"
menu012 db "|If you think you have inputed wrong press (C) to start again,                 |$"
menu0 db "Now what do you want to see?  $"
menu0_1 db "Do you want to do another calculation?(y/n)  $" 

;For Length
menu11 db "|                         Welcome to LENGTH CONVERTER                          |$"
menu11_1 db "|                  This is created by Anthonio Alex D Costa                    |$"
menu12 db "|                   Here we can do the following conversions                   |$"
menu13 db "|            You have to choose the number of conversion you want to do:       |$"
menu14 db "|                             1 : m -> inch                                     |$"
menu15 db "|                             2 : m -> ft                                       |$"
menu16 db "|                             3 : yard -> cm                                    |$"   
menu16_2 db "|                             4 : mile -> km                                    |$"
menu17 db "|                    Please enter a valid value  :  $"
menu18 db "|                   Your converted output will be  :  $"
menu18_2 db "|                 Your converted output will be  : -$" 
menu19 db "|                         converting  m -> inch                                |$"  
menu110 db "|                         converting  m -> ft                                  |$"
menu111 db "|                         converting  yard -> cm                               |$"
menu112 db "|                         converting  mile -> km                               |$"
inch dw 27H
feet dw 3H 
yard dw 5BH 


;For VOLUME                                                           
menu21 db "|                          Welcome to VOLUME CONVERTER                         |$"
menu21_1 db "|                        This is created by Tasnim Promi                       |$"
menu22 db "|                   Here we can do the following conversions                   |$"
menu23 db "|            You have to choose the number of conversion you want to do:       |$"
menu24 db "|                             1 : gallon -> litter                              |$"
menu25 db "|                             2 : litter -> gallon                              |$"
menu26 db "|                       converting  gallon -> litter                           |$"  
menu27 db "|                       converting  litter -> gallon                           |$"



;For Tempreature
menu31 db "|                       Welcome to TEMPREATURE CONVERTER                       |$" 
menu31_1 db "|                     This is created by Annesha Das Priti                     |$"
menu32 db "|                   Here we can do the following conversions                   |$"
menu33 db "|            You have to choose the number of conversion you want to do:       |$"
menu34 db "|                                  1 : C -> F                                   |$"
menu35 db "|                                  2 : F -> C                                   |$"
menu36 db "|                    converting  Celsius -> Fahrenheit                         |$"  
menu37 db "|                    converting  Fahrenheit -> Celsius                         |$"


;For Weight                                                           
menu41 db "|                         Welcome to WEIGHT CONVERTER                          |$"
menu41_1 db "|                         This is created by Everyone                          |$"
menu42 db "|                   Here we can do the following conversions                   |$"
menu43 db "|            You have to choose the number of conversion you want to do:       |$"
menu44 db "|                             1 : kg -> pound                                   |$"
menu45 db "|                             2 : kg -> ounce                                   |$"
menu46 db "|                       converting  kg -> pound                                |$"  
menu47 db "|                       converting  kg -> ounce                                |$"



;User Inputs
input_1 db ? 
input_2 db ? 
input_3 db ? 
input_4 db ? 
check db 0
value dw ?
rem dw ?

;end

ending2 db "                                  Bye Bye                                         $" 
                    

.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX  

    
    jmp Print_Main_Menu
      
    Print_Main_Menu: 
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H 
    MOV AH,9
    LEA DX,menu00
    INT 21H   
    LEA DX,menu_group
    INT 21H
    MOV AH,9  
    LEA DX,menu000
    INT 21H
    LEA DX,menu_a
    INT 21H  
    LEA DX,menu_a
    INT 21H
    LEA DX,menu01
    INT 21H
    LEA DX,menu_a
    INT 21H  
    LEA DX,menu02
    INT 21H
    LEA DX,menu03
    INT 21H
    LEA DX,menu04
    INT 21H
    LEA DX,menu05
    INT 21H
    LEA DX,menu06
    INT 21H     
    LEA DX,menu06_2
    INT 21H
    LEA DX,menu_a
    INT 21H 
    LEA DX,menu_a
    INT 21H 
    LEA DX,menu07
    INT 21H
    LEA DX,menu08
    INT 21H
    LEA DX,menu09
    INT 21H    
    LEA DX,menu010
    INT 21H 
    LEA DX,menu_a
    INT 21H  
    LEA DX,menu011
    INT 21H
    LEA DX,menu012
    INT 21H     
    LEA DX,menu000
    INT 21H        
    
    clear_all:
    MOV AX,0
    MOV BX,0
    MOV CX,0
    MOV DX,0 
    
    user_input: 
    MOV AH,9  
    LEA DX,menu0
    INT 21H
    MOV AH,1
    INT 21H 
    MOV input_1,AL 
    JMP input_checker
       
    input_checker:
    CMP input_1, 31H
    JE Print_Length_Menu
    CMP input_1, 32H 
    JE Print_Volume_Menu
    CMP input_1, 33H 
    JE Print_Tempreature_Menu
    CMP input_1, 34H 
    JE Print_Weight_Menu     
    CMP input_1, 45H 
    JE EXIT 
    CMP input_1, 65H 
    JE EXIT    
    CMP input_1, 43H 
    JE Print_Main_Menu 
    CMP input_1, 63H 
    JE Print_Main_Menu
    JMP Print_Main_Menu    
    
Print_Length_Menu: ;CREATED BY - ANTHONIO ALEX D COSTA
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H 
     
    MOV AH,9  
    LEA DX,menu00
    INT 21H
    LEA DX,menu_a
    INT 21H  
    LEA DX,menu_a
    INT 21H
    LEA DX,menu11
    INT 21H
    LEA DX,menu11_1
    INT 21H
    LEA DX,menu_a
    INT 21H  
    LEA DX,menu12
    INT 21H
    LEA DX,menu13
    INT 21H
    LEA DX,menu14
    INT 21H
    LEA DX,menu15
    INT 21H
    LEA DX,menu16
    INT 21H 
    LEA DX,menu16_2
    INT 21H 
    LEA DX,menu_a
    INT 21H  
    LEA DX,menu_a
    INT 21H 
    LEA DX,menu011
    INT 21H
    LEA DX,menu012
    INT 21H    
    LEA DX,menu000
    INT 21H 
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H        
    MOV AH,9  
    LEA DX,menu0
    INT 21H
    MOV AH,1
    INT 21H 
    MOV input_2,AL    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H 
    
    CMP input_2,31h
    Je take_input_length
    CMP input_2,32h
    Je take_input_length     
    CMP input_2,33h
    Je take_input_length
    CMP input_2,34h
    Je take_input_length      
    CMP input_2, 45H 
    JE EXIT 
    CMP input_2, 65H 
    JE EXIT  
    CMP input_2, 43H 
    JE Print_Main_Menu 
    CMP input_2, 63H 
    JE Print_Main_Menu 
    JMP Print_Invalid_value
     

    take_input_length: 
        MOV AH,9
        LEA DX,menu00
        INT 21H 
        LEA DX,menu_a
        INT 21H  
        LEA DX,menu_a
        INT 21H 
        LEA DX,menu_a
        INT 21H  
        LEA DX,menu_a
        INT 21H 
        LEA DX,menu_a
        INT 21H      
        LEA DX,menu17
        INT 21H 
        MOV AH,2
        MOV AH,1
        INT 21H
        SUB AL,30H 
        MOV input_3,AL   
        MOV AH,1
        INT 21H  
        SUB AL,30H  
        MOV input_4,AL     
        MOV AH,2
        MOV DL,0AH
        INT 21H  
        MOV DL,0DH
        INT 21H               
        CMP input_4,0F0H
        je type1
        jmp type2 
       
        type1:
        MOV DL,input_3
        MOV input_4,DL        
        jmp claculate_caller   
        
        type2:
        MOV AL,input_3
        MOV BL,10
        MUL BL 
        MOV BL,AL
        ADD BL, input_4
        MOV input_4,BL        
        jmp claculate_caller


    claculate_caller:
        CMP input_2,31h
        Je calculate_m_to_inch
        CMP input_2,32h
        Je calculate_m_to_ft     
        CMP input_2,33h
        Je calculate_yard_to_cm     
        CMP input_2,34h
        Je calculate_mile_to_km 

        
    calculate_m_to_inch:
        MOV AX,0
        MOV BX,inch
        MOV AL,input_4   
        MUL BX
        MOV value, AX 
        
        MOV AH,9
        LEA DX,menu_a
        INT 21H         
        LEA DX,menu19
        INT 21H  
        LEA DX,menu_a
        INT 21H
                    
        JMP print_value_length
         
    calculate_m_to_ft:
        MOV AX,0
        MOV BX,feet
        MOV AL,input_4   
        MUL BX
        MOV value, AX 
        
        MOV AH,9
        LEA DX,menu_a
        INT 21H         
        LEA DX,menu110
        INT 21H  
        LEA DX,menu_a
        INT 21H
              
        JMP print_value_length    
         
    calculate_yard_to_cm:    
        MOV AX,0
        MOV BX,yard
        MOV AL,input_4   
        MUL BX
        MOV value, AX
        MOV AH,9
        LEA DX,menu_a
        INT 21H         
        LEA DX,menu111
        INT 21H  
        LEA DX,menu_a
        INT 21H           
        JMP print_value_length 
           
    calculate_mile_to_km:
        MOV AX,0
        MOV AL,input_4
        MOV BL,8           
        MUL BL
        MOV BL,5
        DIV BL
        MOV AH,0 
        MOV value, AX  
        
        
        MOV AH,9
        LEA DX,menu_a
        INT 21H         
        LEA DX,menu112
        INT 21H  
        LEA DX,menu_a
        INT 21H           
        JMP print_value_length 
               
    print_value_length: 
    
        MOV AH,9 
        LEA DX,menu18
        INT 21H
        MOV AX,value    
        MOV DX, 0
        MOV CX, 1000
        DIV CX
        MOV rem, dx
        MOV AH,2
        MOV DL,al
        ADD DL, 30h
        INT 21h

        MOV AX, rem
        MOV DX, 0
        MOV CX, 100
        DIV CX
        MOV rem, dx
        MOV AH,2
        MOV DL,al
        ADD DL, 30h
        INT 21h

        MOV AX, rem
        MOV DX, 0
        MOV CX, 10
        DIV CX
        MOV rem, dx
        MOV AH,2
        MOV DL,al
        ADD DL, 30h
        INT 21h

        MOV AX, rem
        MOV DX, 0
        MOV CX, 1
        DIV CX
        MOV rem, DX
        MOV AH,2
        MOV DL,AL
        ADD DL, 30h
        INT 21h
     
        MOV AH,2
        MOV DL,0AH
        INT 21H  
        MOV DL,0DH
        INT 21H 
     
        MOV AH,9 
        LEA DX,menu_a
        INT 21H  
        LEA DX,menu_a
        INT 21H 
        LEA DX,menu_a
        INT 21H  
        LEA DX,menu_a
        INT 21H 
        LEA DX,menu_a
        INT 21H 
        LEA DX,menu000
        INT 21H 
        
        MOV AH,9 
        LEA DX,menu0_1 
        INT 21H
        MOV AH,1
        INT 21H 
        
        MOV BL,AL
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H 
        CMP BL,59H
        JE Print_Length_Menu  
        CMP BL,79H
        JE Print_Length_Menu
        JMP Print_Main_Menu
         
    
Print_Volume_Menu:  ;CREATED BY - TASNIM SULTANA
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H 
     
    MOV AH,9  
    LEA DX,menu00
    INT 21H
    LEA DX,menu_a
    INT 21H  
    LEA DX,menu_a
    INT 21H
    LEA DX,menu21
    INT 21H 
    LEA DX,menu21_1
    INT 21H
    LEA DX,menu_a
    INT 21H  
    LEA DX,menu22
    INT 21H
    LEA DX,menu23
    INT 21H
    LEA DX,menu24
    INT 21H
    LEA DX,menu25
    INT 21H 
    LEA DX,menu_a
    INT 21H  
    LEA DX,menu_a
    INT 21H 
    LEA DX,menu011
    INT 21H 
    LEA DX,menu012
    INT 21H   
    LEA DX,menu000
    INT 21H  

  
    MOV AH,9  
    LEA DX,menu0
    INT 21H
    MOV AH,1
    INT 21H 
    MOV input_2,AL    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H 
    
    CMP input_2,31h
    Je take_input_vollume
    CMP input_2,32h
    Je take_input_vollume        
    CMP input_2, 45H 
    JE EXIT 
    CMP input_2, 65H 
    JE EXIT  
    CMP input_2, 43H 
    JE Print_Main_Menu 
    CMP input_2, 63H 
    JE Print_Main_Menu
    JMP Print_Invalid_value  
    
    take_input_vollume: 
        MOV AH,9
        LEA DX,menu00
        INT 21H 
        LEA DX,menu_a
        INT 21H  
        LEA DX,menu_a
        INT 21H 
        LEA DX,menu_a
        INT 21H  
        LEA DX,menu_a
        INT 21H 
        LEA DX,menu_a
        INT 21H      
        LEA DX,menu17
        INT 21H 
        MOV AH,2
        MOV AH,1
        INT 21H
        SUB AL,30H 
        MOV input_3,AL   
        MOV AH,1
        INT 21H  
        SUB AL,30H  
        MOV input_4,AL     
        MOV AH,2
        MOV DL,0AH
        INT 21H  
        MOV DL,0DH
        INT 21H               
        CMP input_4,0F0H
        je type01
        jmp type02 
       
        type01:
        MOV DL,input_3
        MOV input_4,DL        
        jmp claculate_caller   
        
        type02:
        MOV AL,input_3
        MOV BL,10
        MUL BL 
        MOV BL,AL
        ADD BL, input_4
        MOV input_4,BL        
        jmp volume_claculate_caller


    volume_claculate_caller:
        CMP input_2,31h
        Je calculate_gal_to_lit
        CMP input_2,32h
        Je calculate_lit_to_gal         
        
    calculate_gal_to_lit:      
        MOV AX,0
        MOV BX,379
        MOV AL,input_4   
        MUL BX
        MOV BX,100
        DIV BX
        MOV value, AX 
                 
        MOV AH,9
        LEA DX,menu_a
        INT 21H         
        LEA DX,menu26
        INT 21H  
        LEA DX,menu_a
        INT 21H
        JMP print_value_volume   
    
    calculate_lit_to_gal:      
        MOV AX,0
        MOV BX,200
        MOV AL,input_4   
        MUL BX
        MOV BX,757
        DIV BX
        MOV value, AX 
                 
        MOV AH,9
        LEA DX,menu_a
        INT 21H         
        LEA DX,menu27
        INT 21H  
        LEA DX,menu_a
        INT 21H
        JMP print_value_volume 
     
    print_value_volume: 
    
        MOV AH,9 
        LEA DX,menu18
        INT 21H
        MOV AX,value    
        MOV DX, 0
        MOV CX, 1000
        DIV CX
        MOV rem, dx
        MOV AH,2
        MOV DL,al
        ADD DL, 30h
        INT 21h

        MOV AX, rem
        MOV DX, 0
        MOV CX, 100
        DIV CX
        MOV rem, dx
        MOV AH,2
        MOV DL,al
        ADD DL, 30h
        INT 21h

        MOV AX, rem
        MOV DX, 0
        MOV CX, 10
        DIV CX
        MOV rem, dx
        MOV AH,2
        MOV DL,al
        ADD DL, 30h
        INT 21h

        MOV AX, rem
        MOV DX, 0
        MOV CX, 1
        DIV CX
        MOV rem, DX
        MOV AH,2
        MOV DL,AL
        ADD DL, 30h
        INT 21h
     
        MOV AH,2
        MOV DL,0AH
        INT 21H  
        MOV DL,0DH
        INT 21H 
     
        MOV AH,9 
        LEA DX,menu_a
        INT 21H  
        LEA DX,menu_a
        INT 21H 
        LEA DX,menu_a
        INT 21H  
        LEA DX,menu_a
        INT 21H 
        LEA DX,menu_a
        INT 21H 
        LEA DX,menu000
        INT 21H 
        
        MOV AH,9 
        LEA DX,menu0_1 
        INT 21H
        MOV AH,1
        INT 21H
        MOV BL,AL
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H  
        CMP BL,59H
        JE Print_Volume_Menu  
        CMP BL,79H
        JE Print_Volume_Menu
        JMP Print_Main_Menu
             
    
    
Print_Tempreature_Menu: ;CREATED BY - ANNESHA DAS PRITI
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H 
     
    MOV AH,9  
    LEA DX,menu00
    INT 21H
    LEA DX,menu_a
    INT 21H  
    LEA DX,menu_a
    INT 21H
    LEA DX,menu31
    INT 21H 
    LEA DX,menu31_1
    INT 21H
    LEA DX,menu_a
    INT 21H  
    LEA DX,menu32
    INT 21H
    LEA DX,menu33
    INT 21H
    LEA DX,menu34
    INT 21H
    LEA DX,menu35
    INT 21H 
    LEA DX,menu_a
    INT 21H  
    LEA DX,menu_a
    INT 21H 
    LEA DX,menu011
    INT 21H
    LEA DX,menu012
    INT 21H    
    LEA DX,menu000
    INT 21H          
    
    MOV AH,9  
    LEA DX,menu0
    INT 21H
    MOV AH,1
    INT 21H 
    MOV input_2,AL    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H 
    
    CMP input_2,31h
    Je take_input_temp
    CMP input_2,32h
    Je take_input_temp         
    CMP input_2, 45H 
    JE EXIT 
    CMP input_2, 65H 
    JE EXIT  
    CMP input_2, 43H 
    JE Print_Main_Menu 
    CMP input_2, 63H 
    JE Print_Main_Menu 
    JMP Print_Invalid_value 
             
   take_input_temp: 
        MOV AH,9
        LEA DX,menu00
        INT 21H 
        LEA DX,menu_a
        INT 21H  
        LEA DX,menu_a
        INT 21H 
        LEA DX,menu_a
        INT 21H  
        LEA DX,menu_a
        INT 21H 
        LEA DX,menu_a
        INT 21H      
        LEA DX,menu17
        INT 21H 
        MOV AH,2
        MOV AH,1
        INT 21H
        SUB AL,30H 
        MOV input_3,AL   
        MOV AH,1
        INT 21H  
        SUB AL,30H  
        MOV input_4,AL     
        MOV AH,2
        MOV DL,0AH
        INT 21H  
        MOV DL,0DH
        INT 21H               
        CMP input_4,0F0H
        je type001
        jmp type002 
       
        type001:
        MOV DL,input_3
        MOV input_4,DL        
        jmp Temp_claculate_caller   
              
        type002:
        MOV AL,input_3
        MOV BL,10
        MUL BL 
        MOV BL,AL
        ADD BL, input_4
        MOV input_4,BL        
        jmp Temp_claculate_caller


    Temp_claculate_caller:
        CMP input_2,31h
        Je calculate_C_to_F
        CMP input_2,32h
        Je calculate_F_to_C     
        jmp Print_Invalid_value    
    
    calculate_C_to_F:
        MOV AX,0
        MOV BX,0
        MOV CX,0
        MOV DX,0
        MOV AL, input_4
        MOV BL,9
        MUL BL
        MOV CX,5
        DIV CX
        ADD AL,32
        MOV check, 30H
        MOV value,AX 
         
        MOV AH,9
        LEA DX,menu_a
        INT 21H         
        LEA DX,menu36
        INT 21H  
        LEA DX,menu_a
        INT 21H   
        
        JMP print_value_temp
         
    calculate_F_to_C:
        MOV AX,0
        MOV BX,0
        MOV CX,0
        MOV DX,0
        MOV AL, input_4 
        CMP AL,20H
        JLE NORMAL_1
        
        CMP AL,20H
        JE NORMAL_2
        
        JMP NORMAL_2 
        
        
        NORMAL_1:
        MOV AL,32
        SUB AL,input_4
        MOV BL,5
        MUL BL
        MOV CL,9
        DIV CL
        MOV AH,0
        MOV value,AX 
        MOV check, 1
        
        MOV AH,9
        LEA DX,menu_a
        INT 21H         
        LEA DX,menu37
        INT 21H  
        LEA DX,menu_a
        INT 21H 
        
        JMP print_value_temp
        
        NORMAL_2:
        MOV AL,input_4
        SUB AL,32
        MOV BL,5
        MUL BL
        MOV CL,9
        DIV CL
        MOV AH,0
        MOV value,AX 
        MOV check, 30H
                       
        MOV AH,9
        LEA DX,menu_a
        INT 21H         
        LEA DX,menu37
        INT 21H  
        LEA DX,menu_a
        INT 21H

    print_value_temp: 
        CMP check, 30H
        JE PRINT_1
        JMP PRINT_2
        
        PRINT_1:     
        MOV AH,9 
        LEA DX,menu18
        INT 21H 
        JMP MAIN_PRINT
        
        PRINT_2:
        MOV AH,9 
        LEA DX,menu18_2
        INT 21H 
        
        MAIN_PRINT:
        MOV AX,value    
        MOV DX, 0
        MOV CX, 1000
        DIV CX
        MOV rem, dx
        MOV AH,2
        MOV DL,al
        ADD DL, 30h
        INT 21h

        MOV AX, rem
        MOV DX, 0
        MOV CX, 100
        DIV CX
        MOV rem, dx
        MOV AH,2
        MOV DL,al
        ADD DL, 30h
        INT 21h

        MOV AX, rem
        MOV DX, 0
        MOV CX, 10
        DIV CX
        MOV rem, dx
        MOV AH,2
        MOV DL,al
        ADD DL, 30h
        INT 21h

        MOV AX, rem
        MOV DX, 0
        MOV CX, 1
        DIV CX
        MOV rem, DX
        MOV AH,2
        MOV DL,AL
        ADD DL, 30h
        INT 21h
     
        MOV AH,2
        MOV DL,0AH
        INT 21H  
        MOV DL,0DH
        INT 21H 
     
        MOV AH,9 
        LEA DX,menu_a
        INT 21H  
        LEA DX,menu_a
        INT 21H 
        LEA DX,menu_a
        INT 21H  
        LEA DX,menu_a
        INT 21H 
        LEA DX,menu_a
        INT 21H 
        LEA DX,menu000
        INT 21H 
        
        MOV AH,9 
        LEA DX,menu0_1 
        INT 21H
        MOV AH,1
        INT 21H
        MOV BL,AL
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H 
        CMP BL,59H
        JE Print_Tempreature_Menu  
        CMP BL,79H
        JE Print_Tempreature_Menu
        JMP Print_Main_Menu

Print_Weight_Menu:   ;CREATED BY - EVERYONE

    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H 
     
    MOV AH,9  
    LEA DX,menu00
    INT 21H
    LEA DX,menu_a
    INT 21H  
    LEA DX,menu_a
    INT 21H
    LEA DX,menu41
    INT 21H 
    LEA DX,menu41_1
    INT 21H
    LEA DX,menu_a
    INT 21H  
    LEA DX,menu42
    INT 21H
    LEA DX,menu43
    INT 21H
    LEA DX,menu44
    INT 21H
    LEA DX,menu45
    INT 21H 
    LEA DX,menu_a
    INT 21H  
    LEA DX,menu_a
    INT 21H 
    LEA DX,menu011
    INT 21H 
    LEA DX,menu012
    INT 21H   
    LEA DX,menu000
    INT 21H  

  
    MOV AH,9  
    LEA DX,menu0
    INT 21H
    MOV AH,1
    INT 21H 
    MOV input_2,AL    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H 
    
    CMP input_2,31h
    Je take_input_weight
    CMP input_2,32h
    Je take_input_weight        
    CMP input_2, 45H 
    JE EXIT 
    CMP input_2, 65H 
    JE EXIT  
    CMP input_2, 43H 
    JE Print_Main_Menu 
    CMP input_2, 63H 
    JE Print_Main_Menu
    JMP Print_Invalid_value  
    
    take_input_weight: 
        MOV AH,9
        LEA DX,menu00
        INT 21H 
        LEA DX,menu_a
        INT 21H  
        LEA DX,menu_a
        INT 21H 
        LEA DX,menu_a
        INT 21H  
        LEA DX,menu_a
        INT 21H 
        LEA DX,menu_a
        INT 21H      
        LEA DX,menu17
        INT 21H 
        MOV AH,2
        MOV AH,1
        INT 21H
        SUB AL,30H 
        MOV input_3,AL   
        MOV AH,1
        INT 21H  
        SUB AL,30H  
        MOV input_4,AL     
        MOV AH,2
        MOV DL,0AH
        INT 21H  
        MOV DL,0DH
        INT 21H               
        CMP input_4,0F0H
        je type0001
        jmp type0002 
       
        type0001:
        MOV DL,input_3
        MOV input_4,DL        
        jmp weight_claculate_caller   
        
        type0002:
        MOV AL,input_3
        MOV BL,10
        MUL BL 
        MOV BL,AL
        ADD BL, input_4
        MOV input_4,BL        
        jmp weight_claculate_caller


    weight_claculate_caller:
        CMP input_2,31h
        Je calculate_kg_to_lb
        CMP input_2,32h
        Je calculate_kg_to_oz         
        
    calculate_kg_to_lb:      
        MOV AX,0
        MOV BX,441
        MOV AL,input_4   
        MUL BX
        MOV BX,200
        DIV BX
        MOV value, AX 
                 
        MOV AH,9
        LEA DX,menu_a
        INT 21H         
        LEA DX,menu46
        INT 21H  
        LEA DX,menu_a
        INT 21H
        JMP print_value_weight   
    
    calculate_kg_to_oz:      
        MOV AX,0
        MOV BX,353
        MOV AL,input_4   
        MUL BX
        MOV BX,10
        DIV BX
        MOV value, AX 
                 
        MOV AH,9
        LEA DX,menu_a
        INT 21H         
        LEA DX,menu47
        INT 21H  
        LEA DX,menu_a
        INT 21H
        JMP print_value_weight 
     
    print_value_weight: 
    
        MOV AH,9 
        LEA DX,menu18
        INT 21H
        MOV AX,value    
        MOV DX, 0
        MOV CX, 1000
        DIV CX
        MOV rem, dx
        MOV AH,2
        MOV DL,al
        ADD DL, 30h
        INT 21h

        MOV AX, rem
        MOV DX, 0
        MOV CX, 100
        DIV CX
        MOV rem, dx
        MOV AH,2
        MOV DL,al
        ADD DL, 30h
        INT 21h

        MOV AX, rem
        MOV DX, 0
        MOV CX, 10
        DIV CX
        MOV rem, dx
        MOV AH,2
        MOV DL,al
        ADD DL, 30h
        INT 21h

        MOV AX, rem
        MOV DX, 0
        MOV CX, 1
        DIV CX
        MOV rem, DX
        MOV AH,2
        MOV DL,AL
        ADD DL, 30h
        INT 21h
     
        MOV AH,2
        MOV DL,0AH
        INT 21H  
        MOV DL,0DH
        INT 21H 
     
        MOV AH,9 
        LEA DX,menu_a
        INT 21H  
        LEA DX,menu_a
        INT 21H 
        LEA DX,menu_a
        INT 21H  
        LEA DX,menu_a
        INT 21H 
        LEA DX,menu_a
        INT 21H 
        LEA DX,menu000
        INT 21H 
        
        MOV AH,9 
        LEA DX,menu0_1 
        INT 21H
        MOV AH,1
        INT 21H
        MOV BL,AL
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H 
        CMP BL,59H
        JE Print_Weight_Menu  
        CMP BL,79H
        JE Print_Weight_Menu
        JMP Print_Main_Menu
                      


Print_Invalid_value:
    MOV AH,9  
    LEA DX,invalid  
    INT 21H
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H 
    CMP input_1, 31H
    JE Print_Length_Menu
    CMP input_1, 32H 
    JE Print_Volume_Menu
    CMP input_1, 33H 
    JE Print_Tempreature_Menu 
    CMP input_1, 34H 
    JE Print_Weight_Menu 
        
EXIT:
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H  
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H   
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H   
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    MOV DL,0DH
    INT 21H  
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H   
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H   
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H        
    MOV AH,9   
    LEA DX,ending2  
    INT 21H 
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H  
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H   
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H   
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    MOV DL,0DH
    INT 21H  
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H   
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H   
    MOV DL,0AH
    INT 21H   
       
    MOV AX,0
    MOV BX,0
    MOV CX,0
    MOV DX,0 
           
    MAIN ENDP
END MAIN