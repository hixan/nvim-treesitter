(decorated_definition [(function_definition) (class_definition)]) @fold
(
 [
  (import_from_statement)
  (import_statement)
  (decorated_definition)
  (function_definition)
  (class_definition)
 ] [
  (function_definition)
  (class_definition)
 ] @fold
)

(while_statement (block)) @fold
(for_statement (block)) @fold
(if_statement (block)) @fold
(with_statement (block)) @fold
(try_statement (block)) @fold

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
] @fold
