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

// To satisfy Equatable.
func ==<K: Equatable, V>(lhs: Container<K, V>, rhs: Container<K, V>) -> Bool {
	return lhs.key == rhs.key
}

func makeHashMapNode<K: Equatable, V>(_ key: K?, _ value: V?, tail: @escaping Node<Container<K, V>>.Lambda = Node<Container<K, V>>.empty()) -> Node<Container<K, V>>.Lambda {
	return makeHashMapNode(Container(key, value), tail: tail)
}

func makeHashMapNode<K: Equatable, V>(_ head: (K?, V?), tail: @escaping Node<Container<K, V>>.Lambda = Node<Container<K, V>>.empty()) -> Node<Container<K, V>>.Lambda {
	return makeHashMapNode(Container(head.0, head.1), tail: tail)
}

func makeHashMapNode<K: Equatable, V>(_ head: Container<K, V>, tail: @escaping Node<Container<K, V>>.Lambda = Node<Container<K, V>>.empty()) -> Node<Container<K, V>>.Lambda {
	if (tail(head)) {
		// TODO if we're already mapping to a different value, what do? Calling
		// tail(head) will overwrite its value. V isn't Equatable so we can't
		// compare that way.
		
		// Don't allow duplicate keys. Return early if we already find one.
		return tail
	}
	// If our parameter to find has the same key as this node, we set its value
	// to whatever exists in this node and return true. Otherwise, we delegate
	// to the tail to do work.
	return { container in
		if container == head {
			// Now we need to return its value
			container.value = head.value
			return true
		}
		return tail(container)
	}
}
