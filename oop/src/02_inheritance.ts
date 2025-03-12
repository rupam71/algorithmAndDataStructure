console.log("Inheritance")

// sub class inherit super/parent class. 
// can be chain of interitance
// can method extending

// Benifit
// 1. its remove code duplication
// 2. provide a common protocal for a group subclass

// when we use inheritance we tell our program that all class are group under
// a certain supertype, has all the method and instance variable super type has.

// public every body access
// private no body access but class itself
// protected can access inherited class

class Animal {
    hunger: number;
    health: number;
    protected coordX: number;
    protected coordY: number;

    setcoordx(x: number) {
        this.coordX = x
    }
    setcoordy(y: number) {
        this.coordY = y
    }

    eat() {
        console.log('I am eating')
    }
    sleep() {
        console.log('I am sleeping')
    }
    move() {
        console.log('I am moving')
        console.log(`I am moving from (${this.coordX}, ${this.coordY})`)
    }
    makeNoise() {
        console.log('Make Noise')
    }
}

// dog inheriting everything from animal
class Dog extends Animal{
    owner: string; // dog has a owner

    makeNoise(): void {
        console.log("Bark")
    }

    returnToOwner() {
        console.log(`I am at (${this.coordX}, ${this.coordY}), and now i am returning to owner`)
        // inherit coordx and coordy from parent 

        // but super class private instance variable are not shared with child
        // but protected type can inherit child but not access ohter people
    }

    move() {
        // method extending
        // here we will not override or erase parent move method
        console.log("Getting up on all four paws")
        super.move() // from parents
    }
}
class Cat extends Animal {}
class Canine extends Animal {}

const dog = new Dog()
const cat = new Cat()

dog.makeNoise() // dog have make noise so its override it
cat.makeNoise() // cat have no make noise so its inherit it from parent

dog.setcoordx(3)
dog.setcoordy(5)

dog.returnToOwner()
dog.move()