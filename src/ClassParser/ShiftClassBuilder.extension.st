Extension { #name : 'ShiftClassBuilder' }

{ #category : '*ClassParser' }
ShiftClassBuilder >> buildFromAST: aCDClassDefinitionNode [

	self name: aCDClassDefinitionNode className.

	aCDClassDefinitionNode superclassName = #nil
		ifFalse: [ self superclass: (superclassResolver resolve: aCDClassDefinitionNode superclassName inEnv: buildEnvironment) ]
		ifTrue: [ self superclass: nil ].

	self layoutClass: aCDClassDefinitionNode layoutClass.

	self slots: (aCDClassDefinitionNode slots collect: [ :e | e asSlot ]).

	self sharedVariables: (aCDClassDefinitionNode sharedVariables collect: [ :e | e asClassVariable ]).

	aCDClassDefinitionNode packageName ifNotNil: [ :aPackage | self package: aPackage ].

	aCDClassDefinitionNode tag ifNotNil: [ :aTag | self tag: aTag ].

	aCDClassDefinitionNode traitDefinition
		ifNotNil: [ :traitDef |
			traitDef originalNode formattedCode.
			self
				traitComposition:
					(self class compiler
						evaluate: traitDef originalNode formattedCode) ]
]
