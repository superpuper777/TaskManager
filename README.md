# Task Manager

Functional requirements
---------------
- [x] to create/update/delete projects
- [x] to add tasks to my project
- [x] to update/delete tasks
- [x] to prioritise tasks into a project
- [x] to choose deadline for my task
- [x] to mark a task as 'done' ~ ('completed') ?

Technical requirements
---------------
- [x] It should be Rails API only application (no views needed) and implemented with https://github.com/ruby-grape/grape
- [ ] It should have user authentication solution and a user should only have access to their
- [ ] It should have automated tests for all functionality

SQL tasks
---------------
- [x] tasks (id, name, status, project_id)
- [x] projects (id, name)

Write the queries
---------------
- [x] get all statuses, not repeating, alphabetically ordered 
- [ ] get the count of all tasks in each project, order by tasks count descending
- [ ] get the count of all tasks in each project, order by projects names
- [x] get the tasks for all projects having the name beginning with “N” letter
- [x] get the list of tasks with duplicate names. Order alphabetically
- [ ] get the list of project names having more than 10 tasks in status ‘completed’. Order by project_id

***Authentication and some requests(where point is blanck) were written but didn't work correctly. No automated tests***
