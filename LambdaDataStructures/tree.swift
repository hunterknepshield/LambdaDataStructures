//
//  tree.swift
//  LambdaDataStructures
//
//  Created by Hunter Knepshield on 11/23/16.
//  Copyright © 2016 Hunter Knepshield. All rights reserved.
//

/// Makes a new Node that acts as the new root of a #-ary tree. This function
/// does not guarantee that returned nodes are in any sorted order or that
/// duplicate elements are prevented. Allows for unequal numbers of children
/// across different calls.
func makeTreeNode<T: Equatable>(_ root: T, children: [Node<T>.Node] = []) -> Node<T>.Node {
	return { t in
		// TODO inspect efficiency of this call - does reduce get called too
		// much?
		t == root || children.reduce(false, { (currentResult, nextChild) in
			return currentResult || nextChild(t)
		})
	}
}

/// Makes a new Node that acts as the new root of a binary tree. This function
/// does not guarantee that returned nodes are in any sorted order or that
/// duplicate elements are prevented.
func makeBinaryTreeNode<T: Equatable>(_ root: T, left: @escaping Node<T>.Node = Node<T>.nil(), right: @escaping Node<T>.Node = Node<T>.nil()) -> Node<T>.Node {
	return makeTreeNode(root, children: [left, right])
}
