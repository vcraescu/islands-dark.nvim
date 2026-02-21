<?php

/**
 * This is a doc comment for testing
 * @param string $name The user name
 * @return void
 */
function greetUser(string $name): void
{
    // This is a line comment
    $message = "Hello, $name!";
    echo $message;
}

/**
 * User class for testing PHP syntax highlighting
 */
class User
{
    // Instance field
    private string $username;

    // Constant
    const MAX_LENGTH = 255;

    // Static field
    public static int $userCount = 0;

    /**
     * Constructor
     */
    public function __construct(string $username)
    {
        $this->username = $username;
        $this->getUserCount();
        self::$userCount++;
    }

    /**
     * Instance method
     */
    public function getUsername(): string
    {
        return $this->username;
    }

    /**
     * Static method
     */
    public static function getUserCount(): int
    {
        return self::$userCount;
    }
}

// Keywords: if, else, for, while, switch, case
if (true) {
    $number = 42;
    $float = 3.14;
    $bool = false;
    $null = null;
}

// Operators
$result = 10 + 20 * 3 - 5 / 2;
$comparison = $result > 50 && $result < 100;

// String escape sequences
$escaped = "Line 1\nLine 2\tTabbed";
$regex = '/[a-z]+/i';

// Arrays
$array = [1, 2, 3, 4, 5];
$assoc = ['key' => 'value', 'foo' => 'bar'];

// Exception handling
try {
    throw new Exception("Error message");
} catch (Exception $e) {
    echo $e->getMessage();
} finally {
    // Cleanup
}

// Namespace and use
namespace App\Models;

use DateTime;
use App\Services\UserService;

// Interface
interface Authenticatable
{
    public function authenticate(): bool;
}

// Abstract class
abstract class BaseModel
{
    abstract protected function save(): void;
}

// Trait
trait Timestampable
{
    protected DateTime $createdAt;
    protected DateTime $updatedAt;
}

// Enum (PHP 8.1+)
enum Status: string
{
    case ACTIVE = 'active';
    case INACTIVE = 'inactive';
    case PENDING = 'pending';
}

// Attributes/Annotations (PHP 8+)
#[Attribute]
class Route
{
    public function __construct(
        public string $path,
        public string $method = 'GET'
    ) {
    }
}

// Arrow function (PHP 7.4+)
$multiply = fn($a, $b) => $a * $b;

// Match expression (PHP 8+)
$result = match ($status) {
    'active' => 'User is active',
    'inactive' => 'User is inactive',
    default => 'Unknown status',
};

// Named arguments (PHP 8+)
greetUser(name: 'John');

// Nullsafe operator (PHP 8+)
$username = $user?->getUsername();

// Variables and parameters
function processData(array $data, ?string $filter = null): array
{
    $localVar = $data;
    $filtered = array_filter($localVar, fn($item) => $item !== null);
    return $filtered;
}

// Magic constants
echo __FILE__;
echo __LINE__;
echo __CLASS__;
echo __METHOD__;

// Built-in functions
$time = time();
$date = date('Y-m-d H:i:s');
$count = count($array);

// TODO: This is a todo comment
// FIXME: This needs to be fixed
