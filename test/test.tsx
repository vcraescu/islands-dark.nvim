import React, { useState, useEffect, useCallback } from "react";
import type { FC, ReactNode } from "react";

/**
 * User interface representing a user entity
 */
interface User {
  id: number;
  name: string;
  email: string;
  isActive: boolean;
}

/**
 * Props for the UserCard component
 */
interface UserCardProps {
  user: User;
  onDelete?: (id: number) => void;
  className?: string;
  children?: ReactNode;
}

/**
 * A card component that displays user information
 */
const UserCard: FC<UserCardProps> = ({
  user,
  onDelete,
  className = "",
  children,
}) => {
  const [isHovered, setIsHovered] = useState(false);
  const [count, setCount] = useState(0);

  useEffect(() => {
    console.log(`User ${user.name} card mounted`);

    return () => {
      console.log(`User ${user.name} card unmounted`);
    };
  }, [user.name]);

  const handleClick = useCallback(() => {
    setCount((prev) => prev + 1);
    console.log(`Clicked ${count} times`);
  }, [count]);

  const handleDelete = () => {
    if (onDelete) {
      onDelete(user.id);
    }
  };

  // Status badge color based on user state
  const statusColor = user.isActive ? "#2ECC71" : "#E74C3C";
  const MAX_NAME_LENGTH = 50;

  return (
    <div
      className={`user-card ${className}`}
      onMouseEnter={() => setIsHovered(true)}
      onMouseLeave={() => setIsHovered(false)}
      style={{
        backgroundColor: isHovered ? "#f0f0f0" : "#ffffff",
        padding: "1rem",
        borderRadius: "8px",
        transition: "all 0.3s ease",
      }}
    >
      <div className="user-header">
        <h2>{user.name.substring(0, MAX_NAME_LENGTH)}</h2>
        <span style={{ color: statusColor }}>
          {user.isActive ? "● Active" : "○ Inactive"}
        </span>
      </div>

      <div className="user-details">
        <p>
          Email: <strong>{user.email}</strong>
        </p>
        <p>ID: {user.id}</p>
        <p>Clicks: {count}</p>
      </div>

      <div className="actions">
        <button onClick={handleClick} disabled={!user.isActive}>
          Increment Counter
        </button>
        <button onClick={handleDelete} className="danger">
          Delete User
        </button>
      </div>

      {children && <div className="extra-content">{children}</div>}
    </div>
  );
};

/**
 * Main App component with user management
 */
const App: FC = () => {
  const [users, setUsers] = useState<User[]>([
    {
      id: 1,
      name: "Alice Johnson",
      email: "alice@example.com",
      isActive: true,
    },
    { id: 2, name: "Bob Smith", email: "bob@example.com", isActive: false },
    {
      id: 3,
      name: "Charlie Brown",
      email: "charlie@example.com",
      isActive: true,
    },
  ]);

  const [filter, setFilter] = useState<"all" | "active" | "inactive">("all");

  const handleDeleteUser = useCallback((id: number) => {
    setUsers((prevUsers) => prevUsers.filter((user) => user.id !== id));
    console.warn(`User ${id} deleted`);
  }, []);

  const filteredUsers = users.filter((user) => {
    if (filter === "active") return user.isActive;
    if (filter === "inactive") return !user.isActive;
    return true;
  });

  // Generic function example
  const findUserById = <T extends { id: number }>(
    items: T[],
    id: number,
  ): T | undefined => {
    return items.find((item) => item.id === id);
  };

  // Async function example
  const fetchUsers = async (): Promise<User[]> => {
    try {
      const response = await fetch("/api/users");
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      return await response.json();
    } catch (error) {
      console.error("Failed to fetch users:", error);
      return [];
    }
  };

  return (
    <div className="app">
      <header>
        <h1>User Management System</h1>
        <div className="filters">
          <button onClick={() => setFilter("all")}>All Users</button>
          <button onClick={() => setFilter("active")}>Active Only</button>
          <button onClick={() => setFilter("inactive")}>Inactive Only</button>
        </div>
      </header>

      <main>
        {filteredUsers.length === 0 ? (
          <p className="empty-state">No users found</p>
        ) : (
          <div className="user-grid">
            {filteredUsers.map((user) => (
              <UserCard key={user.id} user={user} onDelete={handleDeleteUser}>
                <small>Additional info for {user.name}</small>
              </UserCard>
            ))}
          </div>
        )}
      </main>

      <footer>
        <p>
          Total Users: {users.length} | Showing: {filteredUsers.length}
        </p>
      </footer>
    </div>
  );
};

export default App;
export { UserCard };
export type { User, UserCardProps };
