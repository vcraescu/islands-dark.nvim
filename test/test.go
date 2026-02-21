// Go syntax highlighting test for Islands Dark theme
package main

import (
	"context"
	"errors"
	"fmt"
	"log"
	"net/http"
	"time"
)

// Constants should be purple (#C77DBB)
const (
	DefaultTimeout = 30 * time.Second
	MaxRetries     = 3
	ServiceName    = "example-service"
)

// Types should be teal (#16BAAC)
type Config struct {
	Host    string        `json:"host"`    // Fields should be purple
	Port    int           `json:"port"`    // Fields should be purple
	Timeout time.Duration `json:"timeout"` // Fields should be purple
	Enabled bool          `json:"enabled"` // Fields should be purple
}

// User represents a user in the system
// User type should be teal (#16BAAC)
type User struct {
	ID        int64     `json:"id"`   // Numbers should be cyan (#2AACB8)
	Name      string    `json:"name"` // Strings should be green (#6AAB73)
	Email     string    `json:"email"`
	CreatedAt time.Time `json:"created_at"`
	IsActive  bool      `json:"is_active"`
}

// Service interface - methods should be blue (#57AAF7)
type Service interface {
	GetUser(ctx context.Context, id int64) (*User, error)
	CreateUser(ctx context.Context, user *User) error
	UpdateUser(ctx context.Context, user *User) error
	DeleteUser(ctx context.Context, id int64) error
}

// UserService implements Service
type UserService struct {
	config *Config
	client *http.Client
}

// NewUserService creates a new user service
// Function names should be blue (#56A8F5)
func NewUserService(cfg *Config) *UserService {
	return &UserService{
		config: cfg,
		client: &http.Client{
			Timeout: cfg.Timeout,
		},
	}
}

// GetUser retrieves a user by ID
// Method should be blue (#57AAF7)
func (s *UserService) GetUser(ctx context.Context, id int64) (*User, error) {
	// Keywords should be orange (#CF8E6D)
	if id <= 0 {
		return nil, errors.New("invalid user ID")
	}

	// Local variables should be default text color
	url := fmt.Sprintf("http://%s:%d/users/%d", s.config.Host, s.config.Port, id)

	// Built-in functions should be blue
	req, err := http.NewRequestWithContext(ctx, http.MethodGet, url, nil)
	if err != nil {
		return nil, fmt.Errorf("failed to create request: %w", err)
	}

	resp, err := s.client.Do(req)
	if err != nil {
		return nil, fmt.Errorf("request failed: %w", err)
	}
	defer resp.Body.Close()

	// Switch statement
	switch resp.StatusCode {
	case http.StatusOK:
		log.Printf("User %d retrieved successfully", id)
	case http.StatusNotFound:
		return nil, errors.New("user not found")
	default:
		return nil, fmt.Errorf("unexpected status code: %d", resp.StatusCode)
	}

	user := &User{
		ID:        id,
		Name:      "John Doe",
		Email:     "john@example.com",
		CreatedAt: time.Now(),
		IsActive:  true,
	}

	return user, nil
}

// processUsers demonstrates various Go features
func processUsers(users []User) error {
	// For loop
	for i, user := range users {
		// String interpolation
		fmt.Printf("Processing user %d: %s\n", i, user.Name)

		// If-else
		if user.IsActive {
			log.Printf("User %s is active", user.Name)
		} else {
			log.Printf("User %s is inactive", user.Name)
		}
	}

	// Map literal
	userMap := map[int64]string{
		1: "Alice", // Numbers cyan, strings green
		2: "Bob",
		3: "Charlie",
	}
	fmt.Printf("User map size: %d\n", len(userMap))

	// Slice operations
	activeUsers := make([]User, 0, len(users))
	for _, user := range users {
		if user.IsActive {
			activeUsers = append(activeUsers, user)
		}
	}

	return nil
}

// Goroutine example
func runConcurrent(ctx context.Context, service *UserService) {
	// Channel
	results := make(chan *User, 10)
	errors := make(chan error, 10)

	// Goroutine with go keyword
	go func() {
		defer close(results)
		defer close(errors)

		for i := int64(1); i <= 10; i++ {
			// Select statement
			select {
			case <-ctx.Done():
				errors <- ctx.Err()
				return
			default:
				user, err := service.GetUser(ctx, i)
				if err != nil {
					errors <- err
					continue
				}
				results <- user
			}
		}
	}()
}

// main function
func main() {
	// Comments should be gray (#7A7E85)
	cfg := &Config{
		Host:    "localhost",
		Port:    8080,
		Timeout: DefaultTimeout,
		Enabled: true,
	}

	service := NewUserService(cfg)
	ctx := context.Background()

	// Panic and recover
	defer func() {
		if r := recover(); r != nil {
			log.Printf("Recovered from panic: %v", r)
		}
	}()

	// Error handling
	user, err := service.GetUser(ctx, 123)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Printf("Retrieved user: %+v\n", user)
}
