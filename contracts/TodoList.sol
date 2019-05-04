pragma solidity ^0.5.0;

contract TodoList {
    uint public taskCount = 0;

    struct Task {
        uint  id;
        string content;
        bool completed;
    }

    // mapping(data type for key => data structure
    mapping(uint => Task) public tasks;

    // Create event for when a task is created
    event TaskCreated(uint id, string content, bool completed);

    // Create event for when a task is completed
    event TaskCompleted(uint id, bool completed);

    function createTask(string memory _content) public {
        // Increase our taskCount
        taskCount ++;

        // Add new Task to our tasks array. Task struct takes params
        // id:int, content:string, completed:bool
        tasks[taskCount] = Task(taskCount, _content, false);

        // Trigger our event
        emit TaskCreated(taskCount, _content, false);
    }

    function toggleCompleted(uint _id) public {
        // Declare local var _task in memory of type Task
        // from array tasks of index id
        Task memory _task = tasks[_id];

        // Assigned whatever the opposite of
        // completed is set to currently on
        // the _task object
        _task.completed = !_task.completed;

        // Push task object back to stack
        tasks[_id] = _task;

        // Trigger our event
        emit TaskCompleted(_id, _task.completed);

    }

    // Create a task upon deployment
    constructor() public {
        createTask("Task One");

    }



}
