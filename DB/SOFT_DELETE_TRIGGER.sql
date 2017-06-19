set SERVEROUTPUT ON

DROP TRIGGER Deletion1;
DROP TRIGGER Deletion2;

CREATE TRIGGER Deletion1
AFTER UPDATE  
OF deleted ON PRISONERS
DECLARE

  cursor TabelPrisoners is select prisoner_id from prisoners where deleted = 1;
  
  cursor TabelVisitors is select v1.cnp from visitors v1 join prisoner_visitors p1 on v1.cnp=p1.visitor_id
                                                      join visits v2 on p1.visit_id=v2.visit_id
                                                      where v2.deleted=1;
  
  v1_deleted number;
  v2_deleted number;
  
BEGIN      
    OPEN TabelPrisoners;
        loop
            fetch TabelPrisoners into v1_deleted ;
            exit when TabelPrisoners%NOTFOUND;
            update visits
                set deleted = 1
            where(convict_id = v1_deleted );
        end loop;
    close TabelPrisoners;
    OPEN TabelVisitors;
        loop
            fetch TabelVisitors into v2_deleted ;
            exit when TabelVisitors%NOTFOUND;
            update visitors
                set deleted = 1
            where(cnp = v2_deleted );
        end loop;
    close TabelVisitors;
END;

/

CREATE TRIGGER Deletion2
AFTER UPDATE  
OF deleted ON Visits
DECLARE
 
  cursor TabelVisitors is select v1.cnp from visitors v1 join prisoner_visitors p1 on v1.cnp=p1.visitor_id
                                                      join visits v2 on p1.visit_id=v2.visit_id
                                                      where v2.deleted=1;
  
  v1_deleted number;
  v2_deleted number;
  
BEGIN      
    OPEN TabelVisitors;
        loop
            fetch TabelVisitors into v2_deleted ;
            exit when TabelVisitors%NOTFOUND;
            update visitors
                set deleted = 1
            where(cnp = v2_deleted );
        end loop;
    close TabelVisitors;
END;