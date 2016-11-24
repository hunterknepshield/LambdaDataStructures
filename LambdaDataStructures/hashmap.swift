//
//  hashmap.swift
//  LambdaDataStructures
//
//  Created by Hunter Knepshield on 11/23/16.
//  Copyright © 2016 Hunter Knepshield. All rights reserved.
//

/// Deliberately a reference type so its value can be changed - this is
/// important, as it allows lookup functionality.
class Container<K: Equatable, V>: Equatable {
	public let key: K?
	public var value: V?
	
	init(_ key: K?, _ value: V? = nil) {
		self.key = key
		self.value = value
	}
}

/// To satisfy Equatable, required by Node's type parameter.
func ==<K: Equatable, V>(lhs: Container<K, V>, rhs: Container<K, V>) -> Bool {
	return lhs.key == rhs.key
}

/// See makeHashMapNode(head:Container, tail: Node.Lambda).
func makeHashMapNode<K: Equatable, V>(_ key: K?, _ value: V?, tail: @escaping Node<Container<K, V>>.Lambda = Node<Container<K, V>>.empty()) -> Node<Container<K, V>>.Lambda {
	return makeHashMapNode(Container(key, value), tail: tail)
}

/// See makeHashMapNode(head:Container, tail: Node.Lambda).
func makeHashMapNode<K: Equatable, V>(_ head: (K?, V?), tail: @escaping Node<Container<K, V>>.Lambda = Node<Container<K, V>>.empty()) -> Node<Container<K, V>>.Lambda {
	return makeHashMapNode(Container(head.0, head.1), tail: tail)
}

/// If the given key is not already in the data structure, this function returns
/// a Node that accepts a Container. A few different behaviors result:
/// If keys match, but the supplied container's value is not nil, then this
///		Node's value gets updated with the new value.
/// If keys match and the supplied container's value is nil, then it is
///		mutated to "return" the existing value in this node.
/// If keys do not match, defers functionality to the tail.
func makeHashMapNode<K: Equatable, V>(_ head: Container<K, V>, tail: @escaping Node<Container<K, V>>.Lambda = Node<Container<K, V>>.empty()) -> Node<Container<K, V>>.Lambda {
	if (tail(head)) {
		// Don't allow duplicate keys. Return early if we already find one. This
		// will also update an existing key/value pair if appropriate.
		return tail
	}
	// If our parameter to find has the same key as this node, we set its value
	// to whatever exists in this node and return true. Otherwise, we delegate
	// to the tail to do work.
	return { container in
		if container == head {
			// Now we either update or "return" a value.
			if (container.value == nil) {
				// Returning a value.
				container.value = head.value
			} else {
				// Update our own value.
				head.value = container.value
			}
			return true
		}
		return tail(container)
	}
}
