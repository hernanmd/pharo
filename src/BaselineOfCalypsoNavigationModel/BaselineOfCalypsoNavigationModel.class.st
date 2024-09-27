Class {
	#name : 'BaselineOfCalypsoNavigationModel',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfCalypsoNavigationModel',
	#package : 'BaselineOfCalypsoNavigationModel'
}

{ #category : 'baselines' }
BaselineOfCalypsoNavigationModel >> baseline: spec [

	<baseline>
	
	spec for: #common do: [ 
		spec
			package: #'Calypso-NavigationModel';
			package: #'Calypso-NavigationModel-Tests'
				with: [ spec requires: #( #'Calypso-NavigationModel' ) ] ].

	spec group: 'default' with: #( 'Calypso-NavigationModel' 'Calypso-NavigationModel-Tests' ).
]