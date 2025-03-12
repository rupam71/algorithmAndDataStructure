/*
The SOLID principles in JavaScript are a set of design principles that aim at improving the quality 
and maintainability of the software. By adhering to these SOLID principles, you can create a software 
that is more flexible, maintainable, and scalable. 


S.O.L.I.D. STANDS FOR:

S — Single Responsibility Principle
O — Open-Closed Principle
L — Liskov Substitution Principle
I — Interface Segregation Principle
D — Dependency Inversion Principle


S — Single Responsibility Principle (SRP):
    The Single Responsibility Principle emphasizes that each class or module should have only one 
    responsibility, meaning that it should only have one reason to change. In JavaScript, this can 
    be achieved by breaking down complex functions into smaller ones that perform a single task.

    For example, instead of having a function that handles both user authentication and database 
    connection, you can separate them into two separate functions, each with its own responsibility.

    Pros Of The Single Responsibility Principle:
        Easier to maintain and modify the code
        Enhanced modular code
        Easier to read and test the code
        Less prone to errors
    Cons Of Single Responsibility Principle:
        Increases the number of functions or modules in the codebase
        Can require more time to implement



O — Open Closed Principle (OCP):
    The Open Closed Principle states that the classes or modules should be open for an extension but 
    closed for modification. This means that you should be able to add new functionality to a class or 
    module without modifying its existing code. In JavaScript, this can be achieved by using 
    interfaces, abstract classes, and inheritance.

    Pros Of Open-closed principle:
        More flexible code
        Easier to modify and extend code
        Less prone to errors
    Cons Of Open-closed principle:
        Can require more time to implement
        Can increase the complexity of the codebase


L – Liskov Substitution Principle (LSP):
    The Liskov Substitution Principle states that the objects of a superclass should be in a position 
    to be replaced with objects of a subclass without affecting the correctness of the program. In 
    JavaScript, this can be achieved by ensuring that the subclasses inherit the same properties and 
    methods as their parent classes.

    Pros Of Liskov Substitution Principle:
        More predictable code
        Easier to test code
        Less prone to errors
    Cons Of Liskov Substitution Principle:
        Can increase the complexity of the codebase
        Might require more time to implement


I – Interface Segregation Principle (ISP):
    The Interface Segregation Principle states that clients should not be forced to depend on interfaces 
    that they do not use. In JavaScript, this can be achieved by creating smaller interfaces with fewer 
    methods instead of larger interfaces with numerous methods.

    Pros Of Interface Segregation Principle:
        More modular code
        Easier to maintain and modify code
        Less prone to errors
    Cons Of Interface Segregation Principle:
        Can increase the number of interfaces in the codebase
        Can require more time to implement

D- Dependency Inversion Principle (DIP):
    The Dependency Inversion Principle states that high-level modules should not depend on low-level 
    modules, but both should depend on abstractions. In JavaScript, this can be achieved by using 
    dependency injection, where dependencies are passed to a function or class instead of being  
    created inside it. 

    Pros Of Dependency Inversion Principle:
        Promotes loose coupling between modules.
        Increases code flexibility and maintainability.
        Easier to change or modify lower-level modules without affecting higher-level modules.
        Promotes unit testing and improves testability.
    Cons Of Dependency Inversion Principle:
        Can be time-consuming to implement in larger projects.
        May require additional interfaces or abstraction layers, which can increase the complexity.
        
        */
