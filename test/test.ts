// TypeScript/TSX syntax highlighting test for Islands Dark theme

import React, { useState, useEffect, useCallback } from 'react';
import type { FC, ReactNode } from 'react';

// Constants should be purple (#C77DBB)
const API_BASE_URL = 'https://api.example.com';
const MAX_RETRIES = 3;
const DEFAULT_TIMEOUT = 5000;

// Types should be teal (#16BAAC)
interface User {
  id: number;          // Numbers should be cyan (#2AACB8)
  name: string;        // Strings should be green (#6AAB73)
  email: string;
  isActive: boolean;   // Booleans should be orange (#CF8E6D)
  createdAt: Date;
}

type UserStatus = 'active' | 'inactive' | 'pending';

interface UserServiceConfig {
  baseUrl: string;
  timeout: number;
  retries: number;
}

// Enum - members should be light purple (#B096C6)
enum Role {
  Admin = 'admin',
  User = 'user',
  Guest = 'guest',
}

// Class - name should be teal
class UserService {
  private config: UserServiceConfig;
  private static instance: UserService;

  // Constructor
  constructor(config: UserServiceConfig) {
    this.config = config;
  }

  // Static method should be blue (#56A8F5)
  public static getInstance(config: UserServiceConfig): UserService {
    if (!UserService.instance) {
      UserService.instance = new UserService(config);
    }
    return UserService.instance;
  }

  // Method should be blue (#57AAF7)
  public async getUser(id: number): Promise<User | null> {
    try {
      // Template literal - strings should be green
      const url = `${this.config.baseUrl}/users/${id}`;
      
      // Built-in function calls should be blue
      const response = await fetch(url, {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
        },
      });

      if (!response.ok) {
        throw new Error(`Failed to fetch user: ${response.statusText}`);
      }

      const data = await response.json();
      return data as User;
    } catch (error) {
      console.error('Error fetching user:', error);
      return null;
    }
  }

  public async createUser(user: Partial<User>): Promise<User> {
    const response = await fetch(`${this.config.baseUrl}/users`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(user),
    });

    return response.json();
  }
}

// Function declaration - function name should be blue (#56A8F5)
function processUsers(users: User[]): User[] {
  // Array methods - filter, map, etc.
  return users
    .filter(user => user.isActive)
    .map(user => ({
      ...user,
      name: user.name.toUpperCase(),
    }))
    .sort((a, b) => a.id - b.id);
}

// Arrow function with generics
const createAPIClient = <T extends object>(baseUrl: string) => {
  return {
    get: async (endpoint: string): Promise<T> => {
      const response = await fetch(`${baseUrl}${endpoint}`);
      return response.json();
    },
    post: async (endpoint: string, data: T): Promise<T> => {
      const response = await fetch(`${baseUrl}${endpoint}`, {
        method: 'POST',
        body: JSON.stringify(data),
      });
      return response.json();
    },
  };
};

// React component props
interface UserCardProps {
  user: User;
  onDelete?: (id: number) => void;
  onEdit?: (user: User) => void;
  children?: ReactNode;
}

// React functional component with TSX
const UserCard: FC<UserCardProps> = ({ user, onDelete, onEdit, children }) => {
  const [isEditing, setIsEditing] = useState(false);
  const [localUser, setLocalUser] = useState<User>(user);

  useEffect(() => {
    console.log(`User ${user.name} mounted`);
    
    return () => {
      console.log(`User ${user.name} unmounted`);
    };
  }, [user.name]);

  const handleEdit = useCallback(() => {
    setIsEditing(true);
    onEdit?.(localUser);
  }, [localUser, onEdit]);

  const handleDelete = useCallback(() => {
    if (confirm(`Delete user ${user.name}?`)) {
      onDelete?.(user.id);
    }
  }, [user.id, user.name, onDelete]);

  // JSX return
  return (
    <div className="user-card" data-testid={`user-${user.id}`}>
      <div className="user-header">
        <h2>{user.name}</h2>
        <span className={`status status-${user.isActive ? 'active' : 'inactive'}`}>
          {user.isActive ? 'Active' : 'Inactive'}
        </span>
      </div>
      
      <div className="user-body">
        <p>Email: {user.email}</p>
        <p>ID: {user.id}</p>
        <p>Created: {user.createdAt.toLocaleDateString()}</p>
      </div>

      <div className="user-actions">
        <button onClick={handleEdit} disabled={isEditing}>
          Edit
        </button>
        <button onClick={handleDelete} className="danger">
          Delete
        </button>
      </div>

      {children}
    </div>
  );
};

// Generic function with constraints
function findById<T extends { id: number }>(items: T[], id: number): T | undefined {
  return items.find(item => item.id === id);
}

// Decorator (if experimentalDecorators enabled)
function log(target: any, propertyKey: string, descriptor: PropertyDescriptor) {
  const originalMethod = descriptor.value;
  
  descriptor.value = function (...args: any[]) {
    console.log(`Calling ${propertyKey} with args:`, args);
    const result = originalMethod.apply(this, args);
    console.log(`${propertyKey} returned:`, result);
    return result;
  };
  
  return descriptor;
}

// Type guards
function isUser(obj: any): obj is User {
  return (
    typeof obj === 'object' &&
    obj !== null &&
    typeof obj.id === 'number' &&
    typeof obj.name === 'string' &&
    typeof obj.email === 'string'
  );
}

// Union types and type narrowing
type Result<T> = { success: true; data: T } | { success: false; error: string };

function handleResult<T>(result: Result<T>): T | null {
  if (result.success) {
    return result.data;
  } else {
    console.error(result.error);
    return null;
  }
}

// Async/await with error handling
async function fetchUserWithRetry(id: number, retries: number = MAX_RETRIES): Promise<User | null> {
  for (let attempt = 1; attempt <= retries; attempt++) {
    try {
      const service = UserService.getInstance({
        baseUrl: API_BASE_URL,
        timeout: DEFAULT_TIMEOUT,
        retries: MAX_RETRIES,
      });
      
      const user = await service.getUser(id);
      if (user) return user;
    } catch (error) {
      if (attempt === retries) {
        console.error(`Failed after ${retries} attempts:`, error);
        throw error;
      }
      // Exponential backoff
      await new Promise(resolve => setTimeout(resolve, 1000 * Math.pow(2, attempt)));
    }
  }
  
  return null;
}

// Export default
export default UserCard;

// Named exports
export { UserService, processUsers, findById, type User, type UserStatus };

// Namespace (less common in modern TS)
namespace Utils {
  export function debounce<T extends (...args: any[]) => any>(
    func: T,
    wait: number
  ): (...args: Parameters<T>) => void {
    let timeout: NodeJS.Timeout | null = null;
    
    return (...args: Parameters<T>) => {
      if (timeout) clearTimeout(timeout);
      timeout = setTimeout(() => func(...args), wait);
    };
  }
  
  export function throttle<T extends (...args: any[]) => any>(
    func: T,
    limit: number
  ): (...args: Parameters<T>) => void {
    let inThrottle: boolean;
    
    return (...args: Parameters<T>) => {
      if (!inThrottle) {
        func(...args);
        inThrottle = true;
        setTimeout(() => (inThrottle = false), limit);
      }
    };
  }
}

// Comments should be gray (#7A7E85)
/**
 * Documentation comments should be muted green (#5F826B)
 * 
 * @param users - List of users to process
 * @returns Processed user list
 */
function documentedFunction(users: User[]): User[] {
  return processUsers(users);
}
