/*
Tim Serio
CSC 355 Section 602
Assignment 6
May 31, 2016
*/

CREATE OR REPLACE TRIGGER NewContract BEFORE INSERT ON CONTRACT FOR EACH ROW



declare
	cCount TASK.ContractCount%type;
	
begin
	SELECT ContractCount INTO cCount FROM TASK WHERE taskID = :new.TaskID;
	
	
	
	IF (cCount < 3) THEN
		UPDATE TASK
		SET TASK.ContractCount = TASK.ContractCount + 1
		WHERE TaskID = :new.TaskID;
		
  	ELSIF (cCount = 3) THEN
  		--cancel insert
  		RAISE_APPLICATION_ERROR(-20001, 'The TASK table is full');
  	END IF;
end;
/

CREATE OR REPLACE TRIGGER EndContract BEFORE DELETE ON CONTRACT FOR EACH ROW

begin
	UPDATE TASK
	SET TASK.ContractCount = TASK.ContractCount - 1
	WHERE TaskID = :old.TaskID;
	
end;
/


CREATE OR REPLACE TRIGGER NoChanges BEFORE UPDATE ON CONTRACT	

begin
	RAISE_APPLICATION_ERROR(-20001, 'No updates are permitted to existing rows of CONTRACT.');
end;
/