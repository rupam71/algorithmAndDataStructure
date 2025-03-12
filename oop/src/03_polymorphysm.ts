console.log("Hello world");

// Polymorphysm
// poly means many, morph means forms, Many Forms


class Hero {
    hunger: number;
    health: number;

    attack() {
        console.log("I am attacking")
    }
    move() {
        console.log("I am moving")
    }
    eat() {
        console.log("I am eating")
    }
}

class Archer extends Hero {
    arrows: number;

    attack() {
        super.attack()
        console.log("Firing an arrow")
        this.arrows -= 1
    }
}

class Mage extends Hero {
    mana: number;

    attack(): void {
        super.attack()
        console.log("Throwing a potion")
        this.mana -= 1
    }
}

class Knight extends Hero {
    shield: number;

    attack(): void {
        super.attack()
        console.log("Throwing a potion")
        this.shield -= 1
    }
}
class Wizard extends Mage {}

class Tribe {
    private heros: Hero[]
    // here its not care about Hero class or its subclass
    // its only care aboout methods its gonna used
    // it can also get all access of instance variable type/class method

    setHeros(heros: Hero[]) {
        this.heros = heros
    }

    attack() {
        for(let hero of this.heros) {
            hero.attack()
        }
    }
}

const archer: Hero = new Archer()   // right now they are Hero, not specificly Archer any more.
const mage: Hero = new Mage()       // we make this for typescript type sefty
const knight: Hero = new Knight()
// here archer is a Archer, also archer is a Hero. because of inheritance
// here mage is a Mage, also mage is a Hero. because of inheritance
// here knight is a Knight, also knight is a Hero. because of inheritance

const wizard01: Wizard = new Wizard() // first label
const wizard02: Mage = new Wizard() // second label / one label up
const wizard03: Hero = new Wizard() // thired label / two upper label up
// here wizard is a Wizard, also wizard is a Mage, also wizard is Hero becasue of inheritance

const heros: Hero[] = [archer,mage,knight]
const tribe = new Tribe()
tribe.setHeros(heros)
tribe.attack()


archer.attack()
mage.attack()
knight.attack()


// new ask: thieves
class Thief extends Hero {
    attack(): void {
        super.attack()
        console.log("Pick pocket")
    }
}

const thief = new Thief()
const heros2: Hero[] = [knight,thief, mage]
const tribe2 = new Tribe()
tribe2.setHeros(heros2)

// Here we use brand new thief class and re use tribe code without touching any 
// ohter code. this is so cool and flexible.
// and this is polymorphysm. here we pass ohter class/type 
// in polymorphysm we can work with more general type in our class with flexibility