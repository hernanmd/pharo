"
I am a command to convert given method groups to a protocol.
I perform kind of ""Move to protocol"" operation for all contained methods
 
Internal Representation and Key Implementation Points.

    Instance Variables
	protocol:		<Symbol>
"
Class {
	#name : #ClyConvertMethodGroupToProtocolCommand,
	#superclass : #ClyMethodGroupCommand,
	#instVars : [
		'protocol'
	],
	#category : #'Calypso-SystemTools-FullBrowser-Commands-MethodGroups'
}

{ #category : #testing }
ClyConvertMethodGroupToProtocolCommand class >> canBeExecutedInContext: aToolContext [
	^aToolContext isMethodTagSelected not
]

{ #category : #activation }
ClyConvertMethodGroupToProtocolCommand class >> fullBrowserContextMenuActivation [
	<classAnnotation>

	^CmdContextMenuActivation byRootGroupItemFor: ClyMethodGroup asCalypsoItemContext
]

{ #category : #execution }
ClyConvertMethodGroupToProtocolCommand >> applyResultInContext: aToolContext [

	super applyResultInContext: aToolContext.
	aToolContext showMethodTag: protocol
]

{ #category : #accessing }
ClyConvertMethodGroupToProtocolCommand >> defaultMenuItemName [

	^ 'Convert to protocol'
]

{ #category : #execution }
ClyConvertMethodGroupToProtocolCommand >> execute [

	methodGroups do: [ :methodGroup | methodGroup categorizeMethodsIn: protocol ]
]

{ #category : #execution }
ClyConvertMethodGroupToProtocolCommand >> prepareFullExecutionInContext: aToolContext [
	super prepareFullExecutionInContext: aToolContext.

	protocol := aToolContext requestSingleMethodTag: 'New protocol name'
]

{ #category : #accessing }
ClyConvertMethodGroupToProtocolCommand >> protocol [

	^ protocol
]

{ #category : #accessing }
ClyConvertMethodGroupToProtocolCommand >> protocol: anObject [

	protocol := anObject
]