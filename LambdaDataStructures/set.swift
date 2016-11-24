//
//  set.swift
//  LambdaDataStructures
//
//  Created by Hunter Knepshield on 11/23/16.
//  Copyright © 2016 Hunter Knepshield. All rights reserved.
//

/// Makes a potentially new Node that acts as the beginning of a set. Uses a
/// list as the underlying storage mechanism.
func makeSetNode<T: Equatable>(_ head: T, tail: @escaping Node<T>.Node = Node<T>.nil()) -> Node<T>.Node {
	if (tail(head)) {
		// This set already contains this element, don't add anything new.
		return tail
	}
	// Otherwise, we prepend a new node to the list like normal.
	return makeListNode(head, tail: tail)
}
