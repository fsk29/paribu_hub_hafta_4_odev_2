// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Insert, update, read from array of stucts
contract TodoList{
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) external {
        todos.push(Todo({
            text: _text,
            completed: false
        }));
    }


    function update(uint _index, string calldata _text) external {
        todos[_index].text = _text;
    }


    function get(uint _index) external view returns (string memory, bool) {
        Todo storage todo = todos[_index]; // for less gass fee I preferred storage instead of memory.
        return (todo.text, todo.completed);       
    }

    function toggleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }
}