"
A KMDescription is a window showing the description of shortcuts for a specified set of symbols reprensenting KMCategories
"
Class {
	#name : #KMDescriptionPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'shortcutList',
		'actionBar',
		'categoryList'
	],
	#category : #'Keymapping-Tools-Spec'
}

{ #category : #specs }
KMDescriptionPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #categoryList withConstraints: [ :c | c height: 25 ];
		add: #shortcutList;
		add: #actionBar withConstraints: [ :c | c height: 25 ];
		yourself
]

{ #category : #example }
KMDescriptionPresenter class >> example [
	self new
		categories: #(#MorphFocusNavigation #TextEditorTab #SimpleHierarchicalList #RubTextEditor
#WindowShortcuts #Glamour #RubSmalltalkEditor #TextEditor #TabMorphsNavigation
#ChangesBrowserGlobalShortcuts #MorphFocusCtrlNavigation #PluggableButtonMorph
#GlobalShortcuts #TextMorph #ScrollPane #MonticelloShortcuts);
		openWithSpec
]

{ #category : #api }
KMDescriptionPresenter >> categories: aCollectionOfSymbols [
	categoryList items: (aCollectionOfSymbols collect: [ :e | KMRepository default categoryForName: e ])
]

{ #category : #initialization }
KMDescriptionPresenter >> initializePresenter [
	categoryList
		transmitTo: shortcutList
		transform: [ :category | category model keymaps sorted: [ :keymap | keymap shortcut asString ] ascending ]
]

{ #category : #initialization }
KMDescriptionPresenter >> initializeWidgets [
	categoryList := self newDropList.
	shortcutList := self newTable.
	actionBar := self newActionBar.

	categoryList display: [ :category | category name ].

	shortcutList
		addColumn: (SpStringTableColumn title: 'Shortcut' evaluated: #shortcut);
		addColumn: (SpStringTableColumn title: 'Name' evaluated: #name);
		addColumn: (SpStringTableColumn title: 'Description' evaluated: #description);
		beResizable.

	actionBar
		addLast:
			(SpButtonPresenter new
				action: [ self window close ];
				label: 'Close';
				yourself)
]

{ #category : #initialization }
KMDescriptionPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter
		title: 'Shortcuts description';
		initialExtent: 600 @ 350
]
