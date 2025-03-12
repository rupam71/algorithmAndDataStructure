console.log("Hello World")

// Abstract class and methods
// by abstrack keyword, we prevent any class to initiate
// can not create an instance of abstaract class
// but abstrack class will be used as inheritance
// we also can use polymorphysm
// "Concrete Class" is class which inherite "Abstract Class"
// abstract class need to be extended and its method need to be overrideded

abstract class Hero2 {
    hunger: number;
    health: number;

    abstract attack():void
    // this is abstrack method
    // any class inherite Hero2 class should must be implement abstract method attack()
    // super method will not work with abstract method

    move() {
        console.log("I am moving")
    }
    eat() {
        console.log("I am eating")
    }
}

class Archer2 extends Hero2 {
    arrows: number;

    attack() {
        console.log("Firing an arrow")
        this.arrows -= 1
    }
}

class Knight2 extends Hero2 {
    shield: number;

    attack(): void {
        console.log("Throwing a potion")
        this.shield -= 1
    }
}

const archer2 = new Archer2()
archer2.attack()

// abstrack class can inherite anohter abstract class
abstract class Mage2 extends Hero2 {
    mana: number;
}

// they have to use all abstract method from Hero2 and Mage2
class Wizard2 extends Mage2 {
    attack(): void {
        this.mana -= 1;
        console.log("Wizard attacks")
    }
}

class Withch2 extends Mage2 {
    attack(): void {
        this.mana -= 1;
        console.log("Witch attacks")
    }
}

const wizard3 = new Wizard2()
const withch3 = new Withch2()
withch3.attack()
wizard3.attack()

// still we can use this in polymorphysm, through attack is a abstract class.
const heros4:Hero2[] = [archer2,wizard3,withch3]

for(let hero of heros4) {
    hero.attack()
}
