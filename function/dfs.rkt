#lang racket

(define visited '())

(define (dfs graph node)
  (if (member node visited)
      visited
      (let* ((entry (assoc node graph))
         (neighbors (if entry (second entry) '()))
         (new-visited (append (list node) visited)))
        (set! visited new-visited)
        (for-each (lambda (neighbor)
              (dfs graph neighbor))
            neighbors)
        visited)))

(define (print-dfs-result graph start-node)
    (set! visited '())
    (dfs graph start-node)
    (set! visited (reverse visited))
    (display visited)
    (newline))

(define (main)
  (define graph (read))
  (define start-node (read))
  (print-dfs-result graph start-node))

(main)
