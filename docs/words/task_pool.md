# Task Pool words

Task pools provide a means of managing multiple tasks and dynamically creating and destroying them. Note that the total number of task that may exist at any one time is fixed, but the number of executing tasks may be of any number less than or equal to that at any point in time.

The task pool interface is not included in the default builds; the user must load `src/common/forth/task_pool.fs` or use a big build for it to be available. Note that logic is in place to ensure that it is not loaded multiple times. It also requires `src/common/forth/task.fs` to be loaded before it is loaded. Note that it does not reboot the MCU when loaded, as it has no need for initialization to be carried out.

The following words are in `task-pool-module`:

##### `x-no-task-available`
( -- )

Exception raised if one attempts to spawn a task from a task pool and no tasks are available.

##### `spawn-from-task-pool`
( xt...x0 count xt task-pool --  task )

Spawn a task from a task pool, if a task is available, or raise `x-no-task-available` if no tasks are available. *xt* through *x0* are parameters to pass to the *xt* when executed, and *count* is the number of such parameters.

##### `task-pool-free`
( task-pool -- count )

Get the number of free tasks in a task pool.

##### `init-task-pool`
( dict-size stack-size rstack-size count addr -- )

Initialize a task pool at *addr*, with *count* tasks, each with *stack-size* stack size, *rstack-size* return stack size, and *dict-size* dictionary size; note that *stack-size*, *rstack-size*, and *dict-size* are rounded up to the nearest four bytes. These tasks are terminated initially, and are free to be spawned as needed.

##### `task-pool-size`
( count -- bytes )

Get the size (excluding the tasks themselves) taken up by a task pool with *count* tasks; this size should be used for alloting the block of memory to be passed to `init-task-pool`
