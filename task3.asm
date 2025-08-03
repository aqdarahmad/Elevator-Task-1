CODE SEGMENT
            ASSUME CS:CODE,DS:CODE,SS:CODE,ES:CODE
            
     PPI EQU  26H
     CPORT EQU 24H
     BPORT  EQU 22H
     APORT EQU 20H
     ORG 1000H
     
     MOV AL,90H
     OUT PPI,AL
     
     MOV AL,0FFH
     OUT BPORT,AL

     MOV AL,0FFH
     OUT CPORT,AL
     
     MOV AL,0FH
     OUT APORT,AL
     
     START:
     IN AL,APORT
     AND AL,0FH
     CMP AL,0EH
     JE START
     CMP AL,0DH
     JE L2
     CMP AL,0BH
     JE L3
     CMP AL,07H
     JE L4
     JMP START
        L2:
        MOV AL,0F6H
        OUT CPORT,AL
        IN AL,APORT
        AND AL,0F0H
        CMP  AL,20H
        JE STOP
        JMP L2

           L3:
              MOV AL,0F6H
        OUT CPORT,AL
        IN AL,APORT
           AND AL,0F0H
           CMP AL,40H
           JE STOP
           JMP L3

                L4:   MOV AL,0F6H
        OUT CPORT,AL
         IN AL,APORT
           AND AL,0F0H
           CMP AL,80H
           JE STOP
           JMP L4

              
       STOP: MOV AL,0FFH
        OUT CPORT,AL
           JMP START
         INT 3

        CODE ENDS
        END

