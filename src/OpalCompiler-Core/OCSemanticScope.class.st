"
I am an abstract class. My subclasses represent the meaning of the code: is it a method or a doIt expression.

The source code is parsed or compiled using a configured semantic scope, one of my subclasses:

- parsing is delegated to the scope with:
	
		 aSemanticScope parseASTBy: aParser
		
Depending on a scope the parser performs #parseMethod or #parseExpression operations.

- compilation is delegated to the scope with:

	aSemanticScope compileMethodFromASTBy: aCompiler

Depending on a scope the compiler performs #compileMethodFromAST or #compileDoItFromAST operations.

Another responsibility of subclasses is to define the visibility of variables by implementing #targetClass method. 
Target class is used for the variable lookup logic: all instance variables and shared variables are visible for the code compiled for the target class.

For the current integration into the compilation logic a several converting methods are implemented to simplify the initialization of scopes:
- asDoItScope
- asDoItForContext:
- asDoItForReceiver: 
Configuration methods like #class:, #context:, #receiver:, #noPattern: perform the initialization of scope in the compilation context. They convert existing scope using new parameters. It allows to keep the current API allowing different combination of these method calls which we have in the system. In future it needs to be cleaned.

"
Class {
<<<<<<< HEAD
	#name : #OCSemanticScope,
	#superclass : #OCAbstractScope,
	#instVars : [
		'targetEnvironment'
	],
	#category : #'OpalCompiler-Core-Semantics'
||||||| f5a33d82ec
	#name : #OCSemanticScope,
	#superclass : #OCAbstractScope,
	#category : #'OpalCompiler-Core-Semantics'
=======
	#name : 'OCSemanticScope',
	#superclass : 'OCAbstractScope',
	#category : 'OpalCompiler-Core-Semantics',
	#package : 'OpalCompiler-Core',
	#tag : 'Semantics'
>>>>>>> Pharo13
}

{ #category : 'testing' }
OCSemanticScope class >> isAbstract [
	^self = OCSemanticScope
]

{ #category : 'accessing' }
OCSemanticScope >> allTemps [
	^#()
]

{ #category : 'code evaluation' }
OCSemanticScope >> announceDoItEvaluation: aSourceString by: aSystemAnnouncer [

	aSystemAnnouncer evaluated: aSourceString context: nil
]

<<<<<<< HEAD
{ #category : #converting }
OCSemanticScope >> asDoItScope [
	self subclassResponsibility 
]

{ #category : #converting }
OCSemanticScope >> asDoItScopeForContext: aContext [ 
	^OCContextualDoItSemanticScope targetingContext: aContext
]

{ #category : #converting }
OCSemanticScope >> asDoItScopeForReceiver: anObject [
	^OCReceiverDoItSemanticScope targetingReceiver: anObject
]

{ #category : #testing }
||||||| f5a33d82ec
{ #category : #converting }
OCSemanticScope >> asDoItScope [
	self subclassResponsibility 
]

{ #category : #converting }
OCSemanticScope >> asDoItScopeForContext: aContext [ 
	^OCContextualDoItSemanticScope targetingContext: aContext
]

{ #category : #converting }
OCSemanticScope >> asDoItScopeForReceiver: anObject [
	^OCReceiverDoItSemanticScope targetingReceiver: anObject
]

{ #category : #'code compilation' }
OCSemanticScope >> compileMethodFromASTBy: aCompiler [
	self subclassResponsibility 
]

{ #category : #testing }
=======
{ #category : 'testing' }
>>>>>>> Pharo13
OCSemanticScope >> hasBindingThatBeginsWith: aString [

	(self targetClass hasBindingThatBeginsWith: aString) ifTrue: [ ^true ].

	^super hasBindingThatBeginsWith: aString
]

{ #category : 'testing' }
OCSemanticScope >> isDoItScope [
	^false
]

{ #category : 'lookup' }
OCSemanticScope >> lookupVar: name [

<<<<<<< HEAD
	(self targetClass lookupLocalVar: name) ifNotNil: [ :v | ^v ].
	(self targetEnvironment lookupVar: name) ifNotNil: [ :v | ^v ].	
		
	^outerScope ifNotNil: [ outerScope lookupVar: name declare: aBoolean ]
	
]
||||||| f5a33d82ec
	(self targetClass lookupVar: name declare: aBoolean) ifNotNil: [ :v | ^v ].
	
	^outerScope ifNotNil: [ outerScope lookupVar: name declare: aBoolean ]
	
]
=======
	(self targetClass lookupVar: name) ifNotNil: [ :v | ^v ].
>>>>>>> Pharo13

<<<<<<< HEAD
{ #category : #'code compilation' }
OCSemanticScope >> parseASTBy: aParser [
	self subclassResponsibility 
]

{ #category : #printing }
OCSemanticScope >> scopeLevel [ 
	^0
]

{ #category : #accessing }
OCSemanticScope >> targetClass [ 
	self subclassResponsibility  
]

{ #category : #accessing }
OCSemanticScope >> targetEnvironment [ 
	^targetEnvironment ifNil: [ self targetClass environment ]
]

{ #category : #accessing }
OCSemanticScope >> targetEnvironment: anObject [

	targetEnvironment := anObject
||||||| f5a33d82ec
{ #category : #'code compilation' }
OCSemanticScope >> parseASTBy: aParser [
	self subclassResponsibility 
]

{ #category : #printing }
OCSemanticScope >> scopeLevel [ 
	^0
]

{ #category : #accessing }
OCSemanticScope >> targetClass [ 
	self subclassResponsibility  
]

{ #category : #accessing }
OCSemanticScope >> targetEnvironment [ 
	^self targetClass environment 
=======
	^ super lookupVar: name
>>>>>>> Pharo13
]
