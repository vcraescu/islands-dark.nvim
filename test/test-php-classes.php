<?php

// Test file for class names and method invocations

// 1. Class name in declaration - should this be different from usage?
class MyClass {
    public function myMethod() {}
}

// 2. Class name as type hint
function createUser(MyClass $obj): MyClass {
    return $obj;
}

// 3. Class name reference (usage)
$instance = new MyClass();

// 4. Method invocation (calling a method)
$instance->myMethod();

// 5. Static method invocation
MyClass::staticMethod();

// 6. Class name in instanceof
if ($instance instanceof MyClass) {
    // ...
}

// 7. Built-in class names
$date = new DateTime();
$date->format('Y-m-d');

// 8. Fully qualified class names
$user = new \App\Models\User();

// 9. Class constant access
echo MyClass::CONSTANT_NAME;

// 10. Method chaining
$result = $object
    ->firstMethod()
    ->secondMethod()
    ->thirdMethod();

// 11. Function calls (not methods)
strlen("test");
array_map('strtoupper', $array);

// 12. Class in catch block
try {
    throw new Exception("error");
} catch (Exception $e) {
    // Exception is a class name
}

// 13. Interface and trait names
interface MyInterface {}
trait MyTrait {}

// 14. Abstract and extends
abstract class BaseClass {}
class ChildClass extends BaseClass implements MyInterface {
    use MyTrait;
}

// 15. Anonymous class
$obj = new class {
    public function test() {}
};

// 16. Type parameters/generics (PHP doesn't have these, but for reference)
// In other languages: List<String>, Map<K, V>

// 17. Method calls on chained objects
User::where('active', true)->get()->first();
