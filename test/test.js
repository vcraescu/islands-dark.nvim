// JavaScript syntax highlighting test for Islands Dark theme

// Constants should be purple (#C77DBB)
const API_BASE_URL = "https://api.example.com";
const MAX_RETRIES = 3;
const DEFAULT_TIMEOUT = 5000;
const PI = 3.14159;

// Variables should be default foreground
let count = 0;
let isActive = true;
let userName = "John";

// Strings should be green (#6AAB73)
const greeting = "Hello, World!";
const template = `User: ${userName}`;
const multiline = `
  This is a
  multiline string
`;

// Numbers should be cyan (#2AACB8)
const count = 42;
const price = 19.99;
const binary = 0b1010;
const hex = 0xff;

// Booleans/Keywords should be orange (#CF8E6D)
const isEnabled = true;
const isDisabled = false;

// Regular expressions should be cyan/teal
const regex = /test\d+/gi;
const regex2 = new RegExp("pattern", "i");

// Arrow function
const add = (a, b) => a + b;

// Anonymous function
const multiply = function (a, b) {
  return a * b;
};

// Class declarations - class name should be teal (#16BAAC)
class Animal {
  // Constructor - should be teal
  constructor(name, species) {
    this.name = name;
    this.species = species;
    this.isAlive = true;
  }

  // Method - should be blue (#57AAF7)
  speak() {
    return `${this.name} makes a sound`;
  }

  // Getter
  get description() {
    return `${this.name} is a ${this.species}`;
  }

  // Setter
  set name(value) {
    this._name = value;
  }

  // Static method - should be blue (#56A8F5)
  static create(name, species) {
    return new Animal(name, species);
  }
}

// Class with extends
class Dog extends Animal {
  constructor(name, breed) {
    super(name, "Canine");
    this.breed = breed;
  }

  speak() {
    return `${this.name} barks`;
  }

  fetch() {
    return `${this.name} fetches the ball`;
  }
}

// Class with private fields (ES2022)
class BankAccount {
  #balance;
  #accountNumber;

  constructor(initialBalance, accountNumber) {
    this.#balance = initialBalance;
    this.#accountNumber = accountNumber;
  }

  // Getter for private field
  get balance() {
    return this.#balance;
  }

  // Method
  deposit(amount) {
    if (amount > 0) {
      this.#balance += amount;
      return true;
    }
    return false;
  }

  withdraw(amount) {
    if (amount <= this.#balance) {
      this.#balance -= amount;
      return true;
    }
    return false;
  }

  // Static property
  static bankName = "Example Bank";
}

// Class with static blocks (ES2022)
class Configuration {
  static {
    console.log("Configuration class initialized");
  }

  static settings = {
    theme: "dark",
    language: "en",
  };
}

// Abstract-like class with method
class Shape {
  constructor(color) {
    if (this.constructor === Shape) {
      throw new Error("Shape is abstract");
    }
    this.color = color;
  }

  area() {
    throw new Error("Method area() must be implemented");
  }

  perimeter() {
    throw new Error("Method perimeter() must be implemented");
  }
}

class Circle extends Shape {
  constructor(radius, color) {
    super(color);
    this.radius = radius;
  }

  area() {
    return Math.PI * this.radius ** 2;
  }

  perimeter() {
    return 2 * Math.PI * this.radius;
  }
}

class Rectangle extends Shape {
  constructor(width, height, color) {
    super(color);
    this.width = width;
    this.height = height;
  }

  area() {
    return this.width * this.height;
  }

  perimeter() {
    return 2 * (this.width + this.height);
  }
}

// Class with getters/setters
class User {
  #email;

  constructor(name, email) {
    this.name = name;
    this.#email = email;
    this.createdAt = new Date();
  }

  get email() {
    return this.#email;
  }

  set email(value) {
    if (value.includes("@")) {
      this.#email = value;
    }
  }

  // Method with async
  async fetchProfile() {
    const response = await fetch(`/api/users/${this.name}`);
    return response.json();
  }

  // Generator method
  *generatePosts() {
    yield "Post 1";
    yield "Post 2";
    yield "Post 3";
  }
}

// Class expression
const Animal = class {
  constructor(type) {
    this.type = type;
  }
};

// Named class expression
const NamedAnimal = class AnimalClass {
  constructor(type) {
    this.type = type;
    this.className = AnimalClass.name;
  }
};

// Factory function returning class
function createVehicleClass(type) {
  return class Vehicle {
    constructor() {
      this.type = type;
    }
  };
}

const Car = createVehicleClass("car");
const Boat = createVehicleClass("boat");

// Mixin pattern
const Flyable = (SuperClass) =>
  class extends SuperClass {
    fly() {
      return `${this.constructor.name} is flying`;
    }
  };

const Swimmable = (SuperClass) =>
  class extends SuperClass {
    swim() {
      return `${this.constructor.name} is swimming`;
    }
  };

class Aircraft extends Flyable(Object) {}
class BoatClass extends Swimmable(Object) {}
class Amphibious extends Flyable(Swimmable(Object)) {}

// Decorator-like pattern (pre-ES decorators)
function logged(target) {
  const originalMethod = target.prototype.method;

  target.prototype.method = function (...args) {
    console.log(`Calling method with args:`, args);
    const result = originalMethod.apply(this, args);
    console.log(`Method returned:`, result);
    return result;
  };

  return target;
}

@logged
class Service {
  method(data) {
    return { status: "success", data };
  }
}

// Array with objects
const users = [
  { name: "Alice", age: 30 },
  { name: "Bob", age: 25 },
];

// Array methods
const names = users
  .filter((user) => user.age > 25)
  .map((user) => user.name.toUpperCase())
  .sort();

// Destructuring
const { name, age } = users[0];
const [first, ...rest] = users;

// Spread operator
const updatedUser = { ...users[0], age: 31 };

// Template literals with expressions
const message = `User ${name} is ${age} years old`;

// Optional chaining
const city = users[0]?.address?.city;

// Nullish coalescing
const fallback = null ?? "default";

// Try/catch
try {
  const result = JSON.parse('{"valid": true}');
} catch (error) {
  console.error("Parse error:", error.message);
} finally {
  console.log("Cleanup");
}

// Async/await
async function fetchData() {
  try {
    const response = await fetch(API_BASE_URL);
    const data = await response.json();
    return data;
  } catch (error) {
    console.error("Fetch failed:", error);
  }
}

// Promise
const promise = new Promise((resolve, reject) => {
  setTimeout(() => resolve("Done"), 1000);
});

// Promise chaining
promise
  .then((result) => console.log(result))
  .catch((error) => console.error(error))
  .finally(() => console.log("Complete"));

// Comments should be gray (#7A7E85)
/**
 * JSDoc comments should be muted green (#5F826B)
 *
 * @param {string} name - User name
 * @returns {string} Greeting message
 */
function greet(name) {
  return `Hello, ${name}!`;
}

// Exports
module.exports = { Animal, Dog, User };
export { Animal, Dog, User };
export default User;
