# CoreDataExample

CoreDateExample is the source code from SwiftfulThinkings video about CoreData with multiple Entities. https://youtu.be/huRKU-TAD3g

## CoreData Delete Rules
- Nullify: If it has a relation it's set till nil after deletion.
- Cascade: If the related entity item is deleted also this will be deleted. For example when Department is deleted, all related employees are deleted.
- Deny: Can't delete till related item is deleted. For example Department can't be deleted till all employees are deleted.
