// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// In Solidity, a struct is a user-defined composite data type 
// Used to group together different variables under a single name. 
// It allows to create a custom data structure with multiple fields,
// Similar to a record or a class in other programming languages.

// Uses of Structs:

//     Data Organization: Structs are useful for organizing and storing related data in a more structured format.
//     Complex Data Structures: They are used to create more complex data structures, like arrays or mappings of structs.
//     Smart Contract Data Management: Structs help manage and represent data within smart contracts, 
//     making code more readable and maintainable.

contract ToDos {
    // Define a struct named 'Todo'
    struct Todo {
        string text;
        bool completed;
    }

    // Declare a public array of 'Todo' structs named 'todos'
    Todo[] public todos;

    // Function to create a new Todo
    function create(string calldata _text) public {
        // There are three ways to initialize the 'Todo' struct and add it to the 'todos' array

        // 1. Initialize the struct by calling it like a function
        todos.push(Todo(_text, false));

        // 2. Initialize the struct using key-value mapping
        todos.push(Todo({text: _text, completed: false}));

        // 3. Initialize an empty struct and then update its fields
        Todo memory todo;
        todo.text = _text;
        // The struct is then added to the 'todos' array
        todos.push(todo);
    }

    // Function to get the details of a Todo at a specific index
    function get(uint _index) public view returns (string memory text, bool completed) {
        // Retrieve the Todo at the specified index
        Todo storage todo = todos[_index];
        // Return its text and completion status
        return (todo.text, todo.completed);
    }

    // Function to update the text of a Todo at a specific index
    function updateText(uint _index, string calldata _text) public {
        // Retrieve the Todo at the specified index
        Todo storage todo = todos[_index];
        // Update the text field of the Todo
        todo.text = _text;
    }

    // Function to toggle the 'completed' status of a Todo at a specific index
    function toggleCompleted(uint _index) public {
        // Retrieve the Todo at the specified index
        Todo storage todo = todos[_index];
    
        // Toggle the 'completed' status by using the logical NOT operator (!)
        // This will change true to false and false to true
        todo.completed = !todo.completed;
    }

}
