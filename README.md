# LambdaDataStructures
An experiment in using lambdas to create data structures.

## Using `cons` in an imperative language?
The way these constructs work is essentially equivalent to Lisp's `cons`. A
linked list of lambdas store data about what they contain, and can be chained
together in interesting ways.

These data structures are decidedly less efficient than their traditional
counterparts (all are O(n) efficiency), but a fun thought exercise nonetheless.
