"
I representant abstract metric on a moose entity.
I can compute my value on the entity or aggregate my values over a collection of entities
"
Class {
	#name : #MDAbstractMetric,
	#superclass : #Object,
	#instVars : [
		'subscribers'
	],
	#category : #'MooseDashboard-Metrics'
}

{ #category : #accessing }
MDAbstractMetric class >> displayName [
	^'Unknown metric'
]

{ #category : #initialization }
MDAbstractMetric >> addListener: anObject [
	subscribers add: anObject
]

{ #category : #compute }
MDAbstractMetric >> aggregateMetricFor: aCollection [
	self subclassResponsibility
]

{ #category : #compute }
MDAbstractMetric >> averageMetricFor: aCollection [
	^ (aCollection collect: [ :each | self computeMetricFor: each ])
		average
]

{ #category : #compute }
MDAbstractMetric >> computeMetricFor: anEntity [
	self subclassResponsibility
]

{ #category : #accessing }
MDAbstractMetric >> displayName [
	^self class displayName
]

{ #category : #initialization }
MDAbstractMetric >> initialize [
	super initialize.
	subscribers := OrderedCollection new
]

{ #category : #compute }
MDAbstractMetric >> maxMetricFor: aCollection [
	^ (aCollection collect: [ :each| self computeMetricFor: each])  max
]

{ #category : #compute }
MDAbstractMetric >> minMetricFor: aCollection [
	^ (aCollection collect: [ :each | self computeMetricFor: each ]) min
]

{ #category : #compute }
MDAbstractMetric >> sumMetricFor: aCollection [
	^ (aCollection collect: [ :each | self computeMetricFor: each ]) asOrderedCollection 
		sum
]