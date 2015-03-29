;;;; dims.lisp

(in-package #:dims)

;;; "dims" goes here. Hacks and glory await!

(defun K->C(K)
  "Перевод градусов значения, заданного в градусах Кельвина, в градусы Цельсия."
  (- K 273.15))

(defun C->K(C)
  "Перевод градусов значения, заданного в градусах Цельсия, в градусы Кельвина."
  (+ C 273.15))

(defun k->M (k)
"Перевод значения с приставкой кило в число с приставкой мега"
(* 0.001 k))

(defun M->k (M)
  "Перевод значения с приставкой мега в число с приставкой кило"
  (* 1000.0 M))

(defun kgs/cm2->Pa (kgs/cm2)
  "Переводит значение давления, заданное в kgs/cm2, в Pa."
  (* 9.8065 10000.0 kgs/cm2))

(defun Pa->kgs/cm2 (Pa)
  "Переводит значение давления, заданное в Pa, в kgs/cm2."
  (/ Pa 9.8065 10000.0))

(defparameter *muti-prefix-data*
  '((1 	 "дека"  "deca"  "да" "da")
    (2 	 "гекто" "hecto" "г"  "h")
    (3 	 "кило"  "kilo"  "к"  "k")
    (6 	 "мега"  "Mega"  "М"  "M")
    (9 	 "гига"  "Giga"  "Г"  "G")
    (12  "тера"  "Tera"  "Т"  "T")
    (15  "пета"  "Peta"  "П"  "P")
    (18  "экса"  "Exa"   "Э"  "E")
    (21  "зетта" "Zetta" "З"  "Z")
    (24  "иотта" "Yotta" "И"  "Y")
    (-1  "деци"  "deci"  "д"  "d")
    (-2  "санти" "centi" "с"  "c")
    (-3  "милли" "milli" "м"  "m")
    (-6  "микро" "micro" "мк" "μ")
    (-9  "нано"  "nano"  "н"  "n")
    (-12 "пико"  "pico"  "п"  "p")
    (-15 "фемто" "femto" "ф"  "f")
    (-18 "атто"  "atto"  "а"  "a")
    (-21 "зепто" "zepto" "з"  "z")
    (-24 "иокто" "yocto" "и"  "y")))

(defparameter *muti-prefix* (make-hash-table :test 'equal))

(mapc #'(lambda (el)
	    (setf (gethash (fifth el) *muti-prefix*)
		(expt 10 (first el)))
	    )
      *muti-prefix-data*)

(mapcar #'(lambda (el)
	  (eql (gethash (fifth el) *muti-prefix*) (expt 10 (first el))))
      *muti-prefix-data*)

;;;;(gethash "μ" *muti-prefix*)

(defun prefix-from->to(x str-prefix-from str-prefix-to)
  "Перевод значения с приставкой str-prefix-from в число с приставкой str-prefix-to.
Пример использования:
5.5 ΜPa -> 5500 kPa.
(prefix-from->to 5.5 \"M\" \k\)
"
  (* x (/ (gethash str-prefix-from *muti-prefix*)
	  (gethash str-prefix-to *muti-prefix*))))

;;;;(prefix-from->to 5.5 "M" "k")


