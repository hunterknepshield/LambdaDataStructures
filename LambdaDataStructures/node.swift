//
//  node.swift
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
struct Node<T: Equatable> {
	/// The function that actually does work. Returns true if this Node contains
	/// the supplied value or if any linked Nodes further down the chain do.
	typealias Node = (T) -> Bool
	
	/// The empty node, which always returns false, no matter the input. Has to
	/// be a function because generics can't be stored in static properties.
	static func `nil`() -> Node {
		return { _ in
			return false
		}
	}
}

/// The typical elements all example collections are comprised of.
let kElements = ["foo", "bar", "baz"]

/// Asserts that all elements are in the given collection. Causes a runtime
/// failure if that isn't the case.
func testCollection<T: Equatable>(_ beginning: Node<T>.Node, elements: [T]) {
	for element in elements {
		assert(beginning(element))
	}
}
