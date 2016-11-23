//
//  list.swift
//  LambdaDataStructures
//
//  Created by Hunter Knepshield on 11/23/16.
//  Copyright © 2016 Hunter Knepshield. All rights reserved.
//

/// Makes a new Node that acts as the new head of a list. This is essentially
/// how Lisp's cons cells work - we build the list in reverse.
///
/// In Swift, to build a list equivalent to ["a", "b", "c"], we'd write:
/// makeListNode("a", tail: makeListNode("b", tail: makeListNode("c")))
///
/// This mirrors Lisp's operations:
/// (cons a (cons b (cons c nil)))
func makeListNode(_ head: String, tail: @escaping Node = kEmptyNode) -> Node {
	return { string in
		string == head || tail(string)
	}
}
