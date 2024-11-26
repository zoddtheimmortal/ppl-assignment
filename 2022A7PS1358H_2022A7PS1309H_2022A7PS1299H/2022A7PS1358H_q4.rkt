#lang racket

(define(length lst)
  (let loop ((lst lst) (len 0))
    (if (null? lst)
        len
        (loop (cdr lst) (+ len 1)))))

(define (append_list lst1 lst2)
  (if (null? lst1) lst2
      (cons (car lst1) (append_list (cdr lst1) lst2))))

(define (checkshort x lst n)
  (cond
    ((null? lst) '())
    ((list? (car lst)) 
     (let ((first (car lst)) (rest (cdr lst)))
       (let ((processed-first (checkshort x first n))
             (processed-rest (checkshort x rest n)))
         (if (< (length first) n)
             (append_list (list (append_list (list x) processed-first)) processed-rest)
             (append_list (list processed-first) processed-rest)))))
    (else 
     (let ((first (car lst)) (rest (cdr lst)))
       (append_list (list first) (checkshort x rest n))))))

(define (print-insert-result x lst n)
  (display (checkshort x lst n)))

(define (main)
  (define x (read))     
  (define lst (read))   
  (define n (read))     
  (print-insert-result x lst n)) 

(main)
