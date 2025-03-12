// Multiple Inheritance, and Interfaces

import { isClassDeclaration } from "typescript";

class Character {
    hunger: number
    health: number
}

class Hero3 extends Character {
    heroId: number;

    eat() {
        this.hunger += 3;
    }
}
class Enemy extends Character {
    enemyId: number;

    eat() {
        this.hunger +=1
    }
}

// spy - is a hero also is a enemy
// deadly diamond of dead
// class Spy extends Hero3, Enemy {}
// both have eat() mehtod, which method does Spy inherit? make this DDD.
// we cannot extends 2 class. 
// so here come interface
// Interface are similer to classes but they are more of abstruct classes. 

interface Hero5 extends Character {
    // Interface can extends classes
    // It will inherit property and methods
    heroId: number;
}

interface Enemy2 extends Character {
    enemyId: number;
}

// now spy can implements 2 interface
class Spy implements Hero3, Enemy2 {
    // this will not inherit anything from Hero3 or Enemy2.
    // we must have to add everything here. Strictly Maintaing.
    hunger: number;
    health: number;
    heroId: number;
    enemyId: number;

    eat(): void {
        this.hunger -= 1
    }
}

const hero: Hero3 = new Spy();
const enemy: Enemy2 = new Enemy();

// interface acts as a contact but not inherit or use any state of super class.

// we gonna many ways to create class
// 1. Basic classes
// 2. subclasses
// 3. abstaract classeses
// 4. interface

// 1. basic class when no is-a class
// 2. if a is-a class than use subclasses
// 3. abstaract class when we create a template for a classes but not use for himself
// 4. interface when need multiple inheritance, like spy could be 2 different type for polymorphic reasons

