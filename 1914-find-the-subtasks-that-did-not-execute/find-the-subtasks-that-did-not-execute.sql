with recursive cte1 as (
    select task_id, subtasks_count
    from tasks
    union all
    select task_id, subtasks_count - 1
    from cte1
    where  subtasks_count > 1
)

select c1.task_id, c1.subtasks_count as subtask_id
from cte1 c1
left join executed e on c1.task_id = e.task_id and c1.subtasks_count = e.subtask_id
where e.task_id is null