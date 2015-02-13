;;;; dims.lisp

(in-package #:dims)

;;; "dims" goes here. Hacks and glory await!

(defun K->C(K) (- K 273.15))
(defun C->K(C) (+ C 273.15))

(defun k->M (k) (* 0.001 k))
(defun M->k (M) (* 1000.0 M))

(defun kgs/cm2->Pa (kgs/cm2) (* 9.8065 10000.0 kgs/cm2))
(defun Pa->kgs/cm2 (Pa) (/ Pa 9.8065 10000.0))
