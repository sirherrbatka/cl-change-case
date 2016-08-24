;;; no-case.lisp

(in-package :cl-change-case-test)
(in-suite :cl-change-case)

(defparameter *no-case-tests*
  '(
    ;; single words
    ("test" "test")
    ("TEST" "test")

    ;; camel case
    ("testString" "test string")
    ("testString123" "test string123")
    ("testString_1_2_3" "test string 1 2 3")
    ("x_256" "x 256")
    ("anHTMLTag" "an html tag")
    ("ID123String" "id123 string")
    ("Id123String" "id123 string")
    ("foo bar123" "foo bar123")
    ("a1bStar" "a1b star")

    ;; Constant case
    ("CONSTANT_CASE" "constant case")
    ("CONST123_FOO" "const123 foo")

    ;; Random case
    ("FOO_bar" "foo bar")

    ;; non-alphanumeric separators
    ("dot.case" "dot case")
    ("path/case" "path case")
    ("snake_case" "snake case")
    ("snake_case123" "snake case123")
    ("snake_case_123" "snake case 123")

    ;; Punctuation
    ("\"quotes\"" "quotes")

    ;; Space between number parts
    ("version 0.45.0" "version 0 45 0")
    ("version 0..78..9" "version 0 78 9")
    ("version 4_99/4" "version 4 99 4")

    ;; Odd input
    (nil "")
    (10 "10")

    ;; Whitespace
    ("   test   " "test")

    ;; number string
    ("something_2014_other" "something 2014 other")
    ("amazon s3 data" "amazon s3 data")
    ("foo_13_bar" "foo 13 bar")))

(test no-case
  (loop for (input expected) in *no-case-tests*
        do (is-string (no-case input) expected))
  ;; test with custom replacement character
  (is-string (no-case "HELLO WORLD!" :replacement "_") "hello_world"))
