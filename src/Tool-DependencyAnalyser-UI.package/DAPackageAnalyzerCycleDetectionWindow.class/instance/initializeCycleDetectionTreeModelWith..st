initialization-filter
initializeCycleDetectionTreeModelWith: aCollection

	self initializeWithSystemCycles.
	packageAnalyzerTreeModel filterWithPackages: aCollection