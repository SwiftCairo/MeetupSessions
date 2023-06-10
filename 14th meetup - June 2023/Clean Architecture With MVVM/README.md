# Clean Architecture With MVVM

Clean Architecture is a software design approach that emphasizes separation of concerns and maintainability, enabling flexible and scalable development.

## Table of Contents
- [Introduction](#introduction)
- [Key Principles](#key-principles)
- [Example Repository](#example-repository)
- [References](#references)

## Introduction
Clean Architecture, also known as Onion Architecture, is a software design paradigm introduced by Robert C. Martin (Uncle Bob). It promotes a modular and independent approach to building applications, ensuring that business logic remains decoupled from frameworks, user interfaces, and external dependencies. This leads to increased testability, maintainability, and adaptability.

## Key Principles
1. **Independence of Frameworks**: The core business logic and entities are independent of any frameworks or external tools. This allows for easier maintenance, testing, and adaptability to changing technologies.
2. **Separation of Concerns**: Clean Architecture divides the application into distinct layers, each with its own responsibility and abstraction level. This separation ensures that each layer has a specific role and can be modified or replaced independently.
3. **Dependency Rule**: Dependencies flow inward, with high-level modules not relying on low-level modules. This ensures that changes in low-level modules do not affect high-level modules. This rule enforces a stable and maintainable architecture.
4. **Testability**: Clean Architecture promotes testability by isolating the business logic from external dependencies. This allows for thorough unit testing, making it easier to identify and fix issues.
5. **Domain-centric Design**: The core of Clean Architecture revolves around the domain layer, which represents the essential business rules and entities. This layer is independent and can be reused across different applications and interfaces.

## Example Repository
To demonstrate Clean Architecture principles in action, we have provided an example repository that showcases a Swift Cairo application built using Clean Architecture.

[Swift Cairo Clean Architecture](https://github.com/ahmdmhasn/swift-cairo-clean-architecture)

This repository illustrates the application of Clean Architecture by dividing the codebase into separate layers: presentation, domain, and data. It demonstrates how the different layers interact and communicate while maintaining a clear separation of concerns.

Feel free to explore the repository, study the code, and gain hands-on experience with Clean Architecture implementation in Swift. You can clone the repository, run the project, and analyze how the different components and layers work together to create a scalable and modular application.

## References
1. [The Clean Architecture - Robert C. Martin](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
2. [Clean Mobile Architecture - Petros Efthymiou](https://www.petrosefthymiou.com/product-page/clean-mobile-architecture)
3. [The Onion Architecture - Jeffrey Palermo](https://jeffreypalermo.com/2008/07/the-onion-architecture-part-1/)
4. [Clean Architecture and MVVM on iOS](https://tech.olx.com/clean-architecture-and-mvvm-on-ios-c9d167d9f5b3)
5. [Clean Architecture: iOS App](https://paulallies.medium.com/clean-architecture-ios-app-100539550110)

Please refer to the references above for further insights and understanding of Clean Architecture principles.

We hope this repository and the provided references help you in implementing Clean Architecture in your own Swift projects. Happy coding!
