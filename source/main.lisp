(defun get-factorial (num)
  (cond
    ((< num 1) 1)
    ((*
      num
      (get-factorial (- num 1))
    ))
  )
)

(defun get-fibonacci (num)
  (cond
    ((< num 3) 1)
    ((+
      (get-fibonacci (- num 1))
      (get-fibonacci (- num 2))
    ))
  )
)

(defun get-file-content-length (path)
  (with-open-file (stream path)
    (file-length stream))
)

(defvar arg
  (parse-integer
    (car *args*)
  )
)

(if (< arg 0)
  (error
    (concatenate 'string
      "Negative number: "
      (write-to-string arg)
    )
    1
  )
)

(write-line
  (concatenate 'string
    "fac(" (write-to-string arg) ") = "
    (write-to-string (get-factorial arg))
  )
)
(write-line
  (concatenate 'string
    "fib(" (write-to-string arg) ") = "
    (write-to-string (get-fibonacci arg))
  )
)
(write-line
  (concatenate 'string
    "read() = "
    (write-to-string (get-file-content-length "data/file.txt"))
  )
)
