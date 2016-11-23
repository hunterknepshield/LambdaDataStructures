//
//  set.swift
//  LambdaDataStructures
//
//  Created by Hunter Knepshield on 11/23/16.
//  Copyright © 2016 Hunter Knepshield. All rights reserved.
//

/// Makes a potentially new Node that acts as the beginning of a set. Uses a list as the underlying storage mechanism.
func makeSetNode(_ head: String, tail: @escaping Node = kEmptyNode) -> Node {
	if (tail(head)) {
		// This set already contains this element, don't add anything new.
		return tail
	}
	// Otherwise, we append to a list like normal.
	return makeListNode(head, tail: tail)
}
