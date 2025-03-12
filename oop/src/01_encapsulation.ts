console.log("hello world")

// encapsulation is hideing class state from user
// private can not used by instance

class Player {
    private health: number;
    private speed: number;

    setHealth(health: number) {
        if(health<0) {
            console.log("you can not set the health bellow 0")
            return ;
        }
        this.health = health;
    }

    getHealth() {
        return this.health;
    }

    setSpeed(speed: number) {
        this.speed = speed;
    }

    getSpeed() {
        return this.speed;
    }
}

const mario = new Player()
mario.setHealth(-3)
mario.setSpeed(1)

console.log(`Mario speed is ${mario.getSpeed()}`)
console.log(`Mario health is ${mario.getHealth()}`)