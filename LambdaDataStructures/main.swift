//
//  main.swift
//  LambdaDataStructures
//
//  Created by Hunter Knepshield on 11/23/16.
//  Copyright © 2016 Hunter Knepshield. All rights reserved.
//


// List.
// Built in reverse, from tail to head.

var listHead = Node<String>.empty()
for string in kElements.reversed() {
	// Resets listHead to point to the newly created node.
	listHead = makeListNode(string, tail: listHead)
}
// Or, all in one shot:
let oneShotList = makeListNode("foo", tail: makeListNode("bar", tail: makeListNode("baz")))

testCollection(listHead, elements: kElements)
testCollection(oneShotList, elements: kElements)


// Tree.
// Built in reverse, from leaves to root.

// Leaves.
let btreeBar = makeBinaryTreeNode("bar")
let btreeBaz = makeBinaryTreeNode("baz")
// Root.
let btreeFoo = makeBinaryTreeNode("foo", left: btreeBar, right: btreeBaz)
// Or, all in one shot:
let oneShotBtree = makeBinaryTreeNode("foo", left: makeBinaryTreeNode("bar"), right: makeBinaryTreeNode("baz"))

testCollection(btreeFoo, elements: kElements)
testCollection(oneShotBtree, elements: kElements)


// Set.
// Underlying list gets built in reverse, but we don't really care about order.

var setHead = Node<String>.empty()
// The additional "foo" element does nothing, since it's already in the set by
// the time we get to it.
for string in kElements + ["foo"] {
	// Resets setHead to point to the newly created node.
	setHead = makeSetNode(string, tail: setHead)
}
// A one-shot set would look just like the instantiation of oneShotList above.

testCollection(setHead, elements: kElements)


// Hash map.
// This one is interesting - it associates keys and values and mutates the
// parameter to the lambdas to "return" a value.

var hashMapHead = Node<Container<String, Int>>.empty()
for (index, string) in kElements.enumerated() {
	// Resets hashMapHead to point to the newly created node.
	hashMapHead = makeHashMapNode(string, index, tail: hashMapHead)
}

for (index, element) in kElements.enumerated() {
	var found = Container<String, Int>(element)
	assert(hashMapHead(found))
	assert(found.value == index)
}
let notFound = Container<String, Int>("qux")
assert(!hashMapHead(notFound))
assert(notFound.value == nil)
// The power of this construct is that we can specify whatever default value we
// want. The default is nil, but we can force a different default value like so:
let notFound2 = Container<String, Int>("qux", -1)
assert(!hashMapHead(notFound2))
assert(notFound2.value == -1)
