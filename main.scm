(define (member x set)
(cond
((null? set) #F )
((equal? x (car set)) #T)
(else (member x (cdr set)))
))

(define (subset set1 set2)
(cond
((null? set1) #t)
((member (car set1) set2) (subset (cdr set1) set2))
(else #f)
))


(define (union set1 set2)
(cond
((null? set1) set2)
((member (car set1) set2) (union (cdr set1) set2))
(else (cons (car set1) (union (cdr set1) set2)))
))


(define (intersection set1 set2)
(cond
((null? set1) '())
((member (car set1) set2) (cons (car set1) (intersection (cdr set1) set2)))
(else (intersection (cdr set1) set2))
))


(define (difference set1 set2)
(cond
((null? set1) '())
((not (member (car set1) set2)) (cons (car set1) (difference (cdr set1) set2)))
(else (difference (cdr set1) set2))
))
