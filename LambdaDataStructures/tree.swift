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
func makeTreeNode<T: Equatable>(_ root: T, children: [Node<T>.Lambda] = []) -> Node<T>.Lambda {
	return { t in
		t == root || children.reduce(false, { (currentResult, nextChild) in
			return currentResult || nextChild(t)
		})
	}
}

/// Makes a new Node that acts as the new root of a binary tree. This function
/// does not guarantee that returned nodes are in any sorted order or that
/// duplicate elements are prevented.
func makeBinaryTreeNode<T: Equatable>(_ root: T, left: @escaping Node<T>.Lambda = Node<T>.empty(), right: @escaping Node<T>.Lambda = Node<T>.empty()) -> Node<T>.Lambda {
	return makeTreeNode(root, children: [left, right])
}
