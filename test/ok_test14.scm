
(define x (%object-new 42 16))
(%object-setq x 0 287454020) ;; 287454020 = 0x0000000011223344
(%object-setq x 1 2864434397) ;; 2864434397 = 0x00000000aabbccdd
(print (%object-getb x 0)) ;;@ 68
(print (%object-getb x 1)) ;;@ 51
(print (%object-getb x 2)) ;;@ 34
(print (%object-getb x 3)) ;;@ 17
(print (%object-getb x 4)) ;;@ 0
(print (%object-getb x 5)) ;;@ 0
(print (%object-getb x 8)) ;;@ 221
(print (%object-getb x 10)) ;;@ 187
(print (%object-getb x 15)) ;;@ 0
(print (%object-getq x 1)) ;;@ 2864434397
