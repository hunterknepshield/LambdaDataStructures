//
//  constants.swift
//  LambdaDataStructures
//
//  Created by Hunter Knepshield on 11/23/16.
//  Copyright © 2016 Hunter Knepshield. All rights reserved.
//

/// A type representing a node in a linked list of lambdas that generates a data
/// structure. Returns a bool indicating whether or not the supplied string is a
/// member of the data structure, i.e. contained by the current node or one it
/// is linked to.
///
/// This data type does not allow inspection of particular nodes, so the data
/// type is completely opaque to users. There is no way to determine things like
/// the index of an element in a list of Nodes or the size of a collection of
/// Nodes.
typealias Node = (String) -> Bool

/// The typical elements all example collections are comprised of.
let kElements = ["foo", "bar", "baz"]

/// The empty node always returns false, no matter the input.
let kEmptyNode: Node = { str in
	return false
}

/// Asserts that all elements are in the given collection. Causes a runtime
/// failure if that isn't the case.
func testCollection(_ beginning: Node, elements: [String]) {
	for element in elements {
		assert(beginning(element))
	}
}
