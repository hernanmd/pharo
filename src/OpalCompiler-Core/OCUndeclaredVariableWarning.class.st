"
I get signalled when a temporary variable is used that is not defined.  My default action is to create an Undeclared binding and add it to the Undeclared dictionary.
"
Class {
	#name : 'OCUndeclaredVariableWarning',
	#superclass : 'Notification',
	#instVars : [
		'notice'
	],
	#category : 'OpalCompiler-Core-Exceptions',
	#package : 'OpalCompiler-Core',
	#tag : 'Exceptions'
}

{ #category : 'handling' }
OCUndeclaredVariableWarning >> defaultAction [
	| className selector |
 	className := self methodClass name.
	selector := self methodNode selector.

	NewUndeclaredWarning signal: self node name in: (selector
		ifNotNil: [className, '>>', selector]
			ifNil: ['<unknown>']).

	^ super defaultAction
]

<<<<<<< HEAD
{ #category : #correcting }
OCUndeclaredVariableWarning >> defineClass: className [ 
	"Prompts the user to define a new class."
	
	| classSymbol systemCategory classDefinition classBinding result |
	classSymbol := className asSymbol.
	systemCategory := self methodClass category
		ifNil: [ 'Unknown' ].
	classDefinition := ClassDefinitionPrinter new classDefinitionTemplateInPackage: systemCategory forClass: classSymbol.
	classDefinition := UIManager default 
		multiLineRequest: 'Edit class definition:'
		initialAnswer: classDefinition
		answerHeight: 200.
	(classDefinition isNil or: [ classDefinition isEmpty ])
		ifTrue: [ ^ Abort signal ].
	result := self class compiler
		logged: true;
		evaluate: classDefinition.
	"Because some class definition syntax the (fuild one) does not evaluate to a
	class but a class builder, we must call `fluidInstall`.
	(that is a noop on real classes)."
	result fluidInstall.
	classBinding := node owningScope lookupVar: className.
	"make sure to recompile all methods referencing this class"
	classBinding usingMethods do: [:method | method recompile].
	^classBinding
||||||| f5a33d82ec
{ #category : #correcting }
OCUndeclaredVariableWarning >> defineClass: className [ 
	"Prompts the user to define a new class."
	
	| classSymbol systemCategory classDefinition classBinding result |
	classSymbol := className asSymbol.
	systemCategory := self methodClass category
		ifNil: [ 'Unknown' ].
	classDefinition := ClassDefinitionPrinter new classDefinitionTemplateInPackage: systemCategory forClass: classSymbol.
	classDefinition := UIManager default 
		multiLineRequest: 'Edit class definition:'
		initialAnswer: classDefinition
		answerHeight: 200.
	(classDefinition isNil or: [ classDefinition isEmpty ])
		ifTrue: [ ^ Abort signal ].
	result := self class compiler
		source: classDefinition;
		logged: true;
		evaluate.
	"Because some class definition syntax the (fuild one) does not evaluate to a
	class but a class builder, we must call `fluidInstall`.
	(that is a noop on real classes)."
	result fluidInstall.
	classBinding := node owningScope lookupVar: className.
	"make sure to recompile all methods referencing this class"
	classBinding usingMethods do: [:method | method recompile].
	^classBinding
=======
{ #category : 'accessing' }
OCUndeclaredVariableWarning >> description [

	^ self class name , ':' , self notice description
>>>>>>> Pharo13
]

<<<<<<< HEAD
{ #category : #correcting }
OCUndeclaredVariableWarning >> defineTrait: traitName [ 
	"Prompts the user to define a new trait."
	
	| traitSymbol systemCategory traitDefinition |
	traitSymbol := traitName asSymbol.
	systemCategory := self methodClass category
		ifNil: [ 'Unknown' ].
	traitDefinition := 'Trait named: #' , traitSymbol , '
		uses:{} 
		package: ''' , systemCategory , ''''.
	traitDefinition := UIManager default 
		multiLineRequest: 'Edit trait definition:'
		initialAnswer: traitDefinition
		answerHeight: 150.
	(traitDefinition isNil or: [ traitDefinition isEmpty ])
		ifTrue: [ ^ Abort signal ].
	self class compiler
		logged: true;
		evaluate: traitDefinition.
	^ (node owningScope lookupVar: traitSymbol)
		ifNil: [self error: 'should be not happen']
||||||| f5a33d82ec
{ #category : #correcting }
OCUndeclaredVariableWarning >> defineTrait: traitName [ 
	"Prompts the user to define a new trait."
	
	| traitSymbol systemCategory traitDefinition |
	traitSymbol := traitName asSymbol.
	systemCategory := self methodClass category
		ifNil: [ 'Unknown' ].
	traitDefinition := 'Trait named: #' , traitSymbol , '
		uses:{} 
		package: ''' , systemCategory , ''''.
	traitDefinition := UIManager default 
		multiLineRequest: 'Edit trait definition:'
		initialAnswer: traitDefinition
		answerHeight: 150.
	(traitDefinition isNil or: [ traitDefinition isEmpty ])
		ifTrue: [ ^ Abort signal ].
	self class compiler
		source: traitDefinition;
		logged: true;
		evaluate.
	^ (node owningScope lookupVar: traitSymbol)
		ifNil: [self error: 'should be not happen']
=======
{ #category : 'accessing' }
OCUndeclaredVariableWarning >> methodClass [
	^ self methodNode methodClass
>>>>>>> Pharo13
]

{ #category : 'accessing' }
OCUndeclaredVariableWarning >> methodNode [
	^ self node methodNode
]

{ #category : 'accessing' }
OCUndeclaredVariableWarning >> node [
	^ self notice node
]

{ #category : 'accessing' }
OCUndeclaredVariableWarning >> notice [

	^ notice
]

{ #category : 'accessing' }
OCUndeclaredVariableWarning >> notice: anObject [

	notice := anObject
]

{ #category : 'accessing' }
OCUndeclaredVariableWarning >> position [

	^ self notice position
]

{ #category : 'accessing' }
OCUndeclaredVariableWarning >> sourceCode [

	^ self methodNode sourceCode
]
