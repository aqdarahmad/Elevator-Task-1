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
       L1: IN AL,APORT
     AND AL,0FH
     CMP AL,0DH
     JNE L1
      MOV AL,0F9H
      OUT CPORT,AL
     L3: IN AL,APORT
       AND AL,0F0H
      CMP AL,20H
        JNE L3

        MOV AL,0DFH
        OUT CPORT,AL
        MOV AL,0A4H
        OUT BPORT,AL
         INT 3
       RET
        CODE ENDS
        END
