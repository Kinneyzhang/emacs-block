;; -*- lexical-binding: t -*-
;; Minimal s library substitute with only needed functions

(defun s-wrap (string prefix suffix)
  "Wrap STRING with PREFIX and SUFFIX."
  (concat prefix string suffix))

;; Minimal dash library substitutes
(defun -max (list)
  "Return the max value in LIST."
  (apply 'max list))

(defun -map (fn list)
  "Map FN over LIST."
  (mapcar fn list))

(defmacro --map (form list)
  "Map FORM over LIST, using 'it' as the current element."
  `(mapcar (lambda (it) ,form) ,list))

(provide 's)