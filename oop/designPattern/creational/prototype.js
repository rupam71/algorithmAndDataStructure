/*

The Prototype Design Pattern is a creational design pattern that deals with object creation mechanisms, trying to create objects in a manner suitable to the situation. It allows you to create new objects by copying an existing object, known as the prototype. The new object is not required to know the details of the object it copies.

Here are the key components of the Prototype Design Pattern:

Prototype Interface:

Declares an interface for cloning itself.
Concrete Prototype:

Implements the Clone operation to create a new instance.
Client:

Creates a new object by asking a prototype to clone itself.
This pattern is particularly useful when the cost of creating an object is more expensive or complex than copying an existing object. It is often used when the construction of a new object is more efficient by duplicating an existing object and then customizing it as needed.

Here's a simple example in JavaScript:


*/

// Prototype Interface
class Animal {
  constructor(name) {
    this.name = name;
  }

  clone() {
    // Create a shallow copy of the current object
    return Object.assign(Object.create(Object.getPrototypeOf(this)), this);
  }
}

// Concrete Prototype
class Dog extends Animal {
  constructor(name, breed) {
    super(name);
    this.breed = breed;
  }

  bark() {
    console.log("Woof!");
  }
}

// Client
const originalDog = new Dog("Buddy", "Golden Retriever");
const clonedDog = originalDog.clone();

console.log(originalDog.name); // Output: Buddy
console.log(clonedDog.name); // Output: Buddy

console.log(originalDog.breed); // Output: Golden Retriever
console.log(clonedDog.breed); // Output: Golden Retriever

originalDog.bark(); // Output: Woof!
// clonedDog can also bark since it's a clone of originalDog
clonedDog.bark(); // Output: Woof!

/*

In this example, the Animal class serves as the prototype interface, and the Dog class is a concrete prototype. The clone method is used to create a new instance by copying the existing object. The client creates a new object by asking the prototype to clone itself. The cloned object retains the properties of the original but can be further customized if needed.

*/
