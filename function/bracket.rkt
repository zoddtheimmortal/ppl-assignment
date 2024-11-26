#lang racket

(define(length lst)
  (let loop ((lst lst) (len 0))
    (if (null? lst)
        len
        (loop (cdr lst) (+ len 1)))))

(define (checkshort x lst n)
  (if (null? lst)
      '()
      (let ((firstelem (car lst)) (remelems (cdr lst)))
        (if (list? firstelem)
            (let ((sublist (checkshort x firstelem n))
                  (rest (checkshort x remelems n)))
              (if (< (length firstelem) n)
                  (append (list (cons x sublist)) rest)
                  (append (list sublist) rest)))       
            (append (list firstelem) (checkshort x remelems n))))))


(define (print-insert-result x lst n)
  (display (checkshort x lst n)))

(define (main)
  (define x (read))     
  (define lst (read))   
  (define n (read))     
  (print-insert-result x lst n)) 

(main)