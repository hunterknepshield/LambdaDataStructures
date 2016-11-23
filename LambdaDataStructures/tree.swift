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
func makeTreeNode(_ root: String, children: [Node] = []) -> Node {
	return { string in
		string == root || children.reduce(false, { (currentResult, nextChild) in
			return currentResult || nextChild(string)
		})
	}
}

/// Makes a new Node that acts as the new root of a binary tree. This function
/// does not guarantee that returned nodes are in any sorted order or that
/// duplicate elements are prevented.
func makeBinaryTreeNode(_ root: String, left: @escaping Node = kEmptyNode, right: @escaping Node = kEmptyNode) -> Node {
	return makeTreeNode(root, children: [left, right])
}
