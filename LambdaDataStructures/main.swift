//
//  main.swift
//  LambdaDataStructures
//
//  Created by Hunter Knepshield on 11/23/16.
//  Copyright © 2016 Hunter Knepshield. All rights reserved.
//


// Lists.
// Built in reverse, from tail to head.

var listHead = kEmptyNode
for string in kElements.reversed() {
	// Resets listHead to point to the newly created node.
	listHead = makeListNode(string, tail: listHead)
}
// Or, all in one shot:
let oneShotList = makeListNode("foo", tail: makeListNode("bar", tail: makeListNode("baz")))

testCollection(listHead, elements: kElements)
testCollection(oneShotList, elements: kElements)


// Trees.
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


// Sets.
// Underlying list gets built in reverse, but we don't really care about order.

var setHead = kEmptyNode
// The additional "foo" element does nothing, since it's already in the set by
// the time we get to it.
for string in kElements + ["foo"] {
	// Resets setHead to point to the newly created node.
	setHead = makeSetNode(string, tail: setHead)
}
// A one-shot set would look just like the instantiation of oneShotList above.

testCollection(setHead, elements: kElements)

