"
An ASTCommentNode represents a text comment associated with an AST node.

Even though comments are not part of the syntax, we model comments with a subclass of ASTProgramNode, storing the comment text and start/stop position.

Due to the way the parser handles comments, the ASTCommentNode is assigned to its preceding (real) AST node, although we often write the comment prior to a statement.

For example:

foo
""method comment""

self firstStatement.

""comment about the return""
^ self

The ""method comment"" is assigned to the method node, the ""comment about the return"" is assigned
to the ""self firstStatement"" node!

Note that comments can be escaped by doubling the quotation (like in a string).
Therefore `""This is """"a single"""" comment""` is a single comment.
Whereas `""This is "" ""three"" "" comments""` is three comments.

instance variables
	contents 	<String> the comment text without the quotes.
		Note double quotes are unescaped, so you get single quotes here.
		You can use `sourceCode` to get the original text with all verbatim quotes. 
	start	<Number> (start-) position within the method source

"
Class {
	#name : 'ASTCommentNode',
	#superclass : 'ASTProgramNode',
	#instVars : [
		'contents',
		'start',
		'stop'
	],
	#category : 'AST-Core-Nodes',
	#package : 'AST-Core',
	#tag : 'Nodes'
}

{ #category : 'instance creation' }
ASTCommentNode class >> with: aCommentToken [
	"To respect the previously implemented comment node content,
	 we strip the surrounding quotes of the comment."
	^ self new
		with: aCommentToken value from: aCommentToken start to: aCommentToken stop;
		yourself
]

{ #category : 'instance creation' }
ASTCommentNode class >> with: aString at: startPosition [

	^ self with: (RBCommentToken
			   value: aString
			   start: startPosition
			   stop: startPosition + aString size - 1)
]

{ #category : 'comparing' }
ASTCommentNode >> = anObject [
	self == anObject ifTrue: [ ^true ].
	^ self class = anObject class and: [ self contents = anObject contents ]
]

{ #category : 'visiting' }
ASTCommentNode >> acceptVisitor: aProgramNodeVisitor [

	^ aProgramNodeVisitor visitCommentNode: self
]

{ #category : 'accessing' }
ASTCommentNode >> contents [
	^ contents
]

{ #category : 'comparing' }
ASTCommentNode >> hash [
	^ self contents hash
]

{ #category : 'testing' }
ASTCommentNode >> isCommentNode [
	^true
]

{ #category : 'printing' }
ASTCommentNode >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' "'.
	aStream nextPutAll: contents.
	aStream nextPutAll: '" '
]

{ #category : 'enumeration' }
ASTCommentNode >> size [
	^ contents size + 2 "must take into account quotation marks"
]

{ #category : 'accessing' }
ASTCommentNode >> start [
	^ start
]

{ #category : 'accessing' }
ASTCommentNode >> stop [
	^ stop ifNil: [ start + self size - 1 ]
			 ifNotNil: [ stop ]
]

{ #category : 'instance creation' }
ASTCommentNode >> with: aString from: aStartPosition to: aStopPosition [
	start := aStartPosition.
	stop := aStopPosition.
	contents := aString
]