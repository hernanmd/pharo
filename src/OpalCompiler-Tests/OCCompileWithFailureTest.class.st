"
I have tests for the curious capability of Opal to compile code with syntax errors.

Instead of raising syntax errors at runtime, they are raised at compile time.


"
Class {
	#name : 'OCCompileWithFailureTest',
	#superclass : 'TestCase',
	#category : 'OpalCompiler-Tests-Source',
	#package : 'OpalCompiler-Tests',
	#tag : 'Source'
}

{ #category : 'interactive error protocol' }
OCCompileWithFailureTest >> notify: aMessage at: positon in: object [
	"ingnore, for testEmptyBlockArg"
]

{ #category : 'tests' }
OCCompileWithFailureTest >> testEmptyBlockArg [
	| result |
	"parse [:] in parse error mode, this results in arg vars with an empty string as a name"
	result := UndefinedObject compiler
<<<<<<< HEAD
    noPattern: true;
    options:  #(+ optionParseErrors + optionSkipSemanticWarnings);
||||||| f5a33d82ec
    source: '^[ :]';
    noPattern: true;
    options:  #(+ optionParseErrors + optionSkipSemanticWarnings);
=======
    source: '^[ :]';
    isScripting: true;
>>>>>>> Pharo13
    requestor: self;
<<<<<<< HEAD
    parse: '^[ :]'. 
||||||| f5a33d82ec
    parse. 
=======
    parse.
>>>>>>> Pharo13
	self assert: result isDoIt.
	self assert: result statements first isReturn
]

{ #category : 'tests' }
OCCompileWithFailureTest >> testEvalSimpleMethodWithError [
<<<<<<< HEAD
	| ast cm |
	ast := OpalCompiler new
				options: #(+ optionParseErrors);
				parse: 'method 3+'.
	
	self assert: ast isMethod.
	self assert: ast isFaulty.
	
	cm := ast compiledMethod.
	self should: [cm valueWithReceiver: nil arguments: #()] raise: RuntimeSyntaxError
||||||| f5a33d82ec
	| ast cm |
	ast := OpalCompiler new
				source: 'method 3+';
				options: #(+ optionParseErrors);
				parse.
	
	self assert: ast isMethod.
	self assert: ast isFaulty.
	
	cm := ast compiledMethod.
	self should: [cm valueWithReceiver: nil arguments: #()] raise: RuntimeSyntaxError
=======
	| compiler cm |
	cm := (compiler := OpalCompiler new)
				source: 'method 3+';
				permitFaulty: true;
				compile.

	self assert: compiler ast isMethod.
	self assert: compiler ast isFaulty.

	self should: [cm valueWithReceiver: nil] raise: RuntimeSyntaxError
>>>>>>> Pharo13
]

{ #category : 'tests' }
OCCompileWithFailureTest >> testParenthesis [
	| compiler cm |
	cm := (compiler := UndefinedObject compiler)
    source: 'self assert: pragma( numArgs equals: 0.';
    isScripting: true;
    requestor: self;
    permitFaulty: true;
    compile.
	self assert: compiler ast isDoIt.
	self assert: compiler ast isFaulty.
	self should: [cm valueWithReceiver: nil] raise: RuntimeSyntaxError
]
