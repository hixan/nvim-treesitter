
; fold function definitions if they are members of a class, or decorated definitions if they are members of the class (but both)
;(class_definition (block [(function_definition) (decorated_definition) (class_definition)]@fold))

; fold class, function or decorator definition if they are prepended by something indicating code or class level
(
[(import_from_statement) (import_from_statement) (expression_statement) (function_definition) (class_definition) (decorated_definition)] ; check for root level or code level
[
(class_definition)
(decorated_definition)
(function_definition)
] @fold
)
; fold class, function or decorator definition if they are postpended by something indicating code or class level
(
[
(class_definition)
(decorated_definition)
(function_definition)
] @fold
[(import_from_statement) (import_from_statement) (expression_statement) (function_definition) (class_definition) (decorated_definition)] ; check for root level or code level
)

; code blocks folding
(while_statement (block)) @fold
(for_statement (block)) @fold
(if_statement (block)) @fold
(with_statement (block)) @fold
(try_statement (block)) @fold

; fold dict()
(
(identifier) @ident
(argument_list) @fold
(#match? @ident "^dict$")
)

[
  (import_from_statement)
  (parameters)

  (parenthesized_expression)
  (generator_expression)
  (list_comprehension)
  (set_comprehension)
  (dictionary_comprehension)

  (tuple)
  (list)
  (set)
  (dictionary)

  (string)
  (concatenated_string)
] @fold
