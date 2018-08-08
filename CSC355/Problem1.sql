/*
Tim Serio
CSC 355 Section 602
Assignment 6
May 31, 2016
*/

declare
 mid PERCENTAGES.MidPercent%type;
 fin PERCENTAGES.FinPercent%type;
 hw PERCENTAGES.HWPercent%type;

 sName STUDENT.Name%type;
 sID STUDENT.ID%type;
 
 Midterm STUDENT.Mid%type;
 Final STUDENT.Fin%type;
 Homework STUDENT.HW%type;
 average number(5,2);
 Letter VARCHAR(1);
 avH number(5,2);
 avM number(5,2);
 avF number(5,2);
 

 cursor studentPtr is SELECT * FROM STUDENT;

begin

	SELECT HWPercent, MidPercent, FinPercent
	INTO hw, mid, fin
	FROM PERCENTAGES;
	
	dbms_output.put_line('Weights are ' || mid || ', ' || fin || ', ' || hw);

  open studentPtr;

  loop

    fetch studentPtr into sID, sName, Homework, Midterm, Final;
    avH := (hw*0.01);
    avM := (mid*0.01);
    avF := (fin*0.01);
	average:=((Homework*avH) + (Midterm*avM) + (Final*avF));

    if studentPtr%found then
 	
 		  
		if (average >= 90) then Letter:='A';
        elsif (average >= 80) then Letter:='B';
		elsif (average >= 70) then Letter:='C';
        elsif (average >= 60) then Letter:='D';
        else Letter:='F';
        end if;
          dbms_output.put_line(sID  ||' '|| sName|| ' '||average||' ' || Letter);

    else

    	exit;

    end if;

    end loop;

    close studentPtr;

end;
/