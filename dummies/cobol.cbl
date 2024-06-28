       IDENTIFICATION DIVISION.
       PROGRAM-ID. BasicCobolExample.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT input-file ASSIGN TO 'input.txt'
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT output-file ASSIGN TO 'output.txt'
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  input-file.
       01  input-record.
           05  input-data      PIC X(80).

       FD  output-file.
       01  output-record.
           05  output-data     PIC X(80).

       WORKING-STORAGE SECTION.
       01  ws-end-of-file      PIC X VALUE 'N'.

       PROCEDURE DIVISION.
       BEGIN.
           OPEN INPUT input-file
           OPEN OUTPUT output-file
           PERFORM UNTIL ws-end-of-file = 'Y'
               READ input-file
                   AT END
                       MOVE 'Y' TO ws-end-of-file
                   NOT AT END
                       MOVE input-record TO output-record
                       WRITE output-record
               END-READ
           END-PERFORM
           CLOSE input-file
           CLOSE output-file
           STOP RUN.
