# Demystifying Dependency Injection
---

### Prerequisites
* Principles vs Patterns
	* Principle: The theoretical concept. (The What)
	* Pattern: How this concept is applied practically. (The How)
	  
* What If we do not follow these principles? (The Why)

---

### What?
* Principles:
	* OOD
		* SOLID
			* Dependency Inversion Principle (*DIP*)
	* Inversion of Control (*IoC*)

### Why?
* To achieve loose coupling:
	* Maintainability:
		* Easily substitute the dependencies; in case of changing a 3rd party dependency.
	* Testability:
		* Substituting the dependency with a test double.

### How?
* Patterns:
	* ~~Factory~~ (Not covered in this talk)
	* ~~Service Locator~~ (Not covered in this talk)
	* Dependency Injection (*DI*)
		* Manual Dependency Injection
			* Constructor injection.
			* Property injection.
		* Automatic Dependency Injection
			* *IoC Container*
				* Main Concepts:
					* Registering
					* Resolving
					* Managing dependency lifecycle


---

### Outcomes
* By now you should be able to understand the following:
	* The differences between:
		* Principles:
			* Dependency Inversion Principle (*DIP*)
			* Inversion of Control (*IoC*)
		  
		* Patterns:
			* Dependency Injection (*DI*)
			* *IoC Container*

	* The theoretical basis of these principles.
	* The practical usage of these patterns.


