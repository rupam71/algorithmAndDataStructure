// Constructors, Static, Parameter, and Readonly Properties,

class Chractor {
    // Static property 
// static property lives in the class rather than object/instance.

    static characterCount = 0;

    private hunger: number;
    private health: number;

    constructor(hunger:number,health:number) {
        this.health = health;
        this.hunger = hunger;

        // static can be used in constructor
        Chractor.characterCount += 1;
        console.log(`I am the charactor count number ${Chractor.characterCount}`)
    }

    setHunger(hunger: number): void {
        this.hunger = hunger;
    }
    setHealth(health: number): void {
        this.health = health;
    }
    getHunger() {
        console.log(this.hunger)
    }
    getHealth() {
        console.log(this.health)
    }
}

class Hero6 extends Chractor {
    // static property can be used anywhere
    // Chractor.characterCount

    // readly can made for one time. and can not mutate it.
    // after one time instantiat it, we can not change this.
    readonly humanID: number;

    private heroId: number;

    constructor(hunger:number,health:number,heroId:number,humanID: number) {
        super(hunger,health) // calls super class constructor
        this.heroId = heroId
        this.humanID = humanID
    }

    setHeroId(heroId: number): void {
        this.heroId = heroId;
    }
    getHeroId() {
        console.log(this.heroId)
    }
}

const jeff = new Chractor(100,100)
jeff.getHunger()
jeff.getHealth()
const jeff2 = new Hero6(50,50,5,1)

Chractor.characterCount // can be accesses
// jeff.charactroCount // can not be accesses

// Typescript offer perametre propertys
// we can convert perametre to propertys

class Hero7 {
    constructor(public hunger:number, public health:number) {}
}
const jeff3 = new Hero7(100,100)

