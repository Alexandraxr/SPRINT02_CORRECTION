#NIVELL3
#EX1.S'estan establint els objectius de l'empresa per al següent trimestre, per la qual cosa necessiten una base sòlida per a avaluar el rendiment i mesurar l'èxit en els diferents mercats. Per a això, necessiten el llistat dels països la mitjana de transaccions dels quals sigui superior a la mitjana general.

SELECT country, avg(amount) #volem el nom del pais & amount
FROM transaction
JOIN company
ON transaction.company_id = company.id
GROUP BY country
HAVING avg(amount) > (           
  SELECT avg(amount)
  FROM transaction);
  
   
  
 #EX2.Necessitem optimitzar l'assignació dels recursos i dependrà de la capacitat operativa que es requereixi, per la qual cosa et demanen la informació sobre la quantitat de transaccions que realitzen les empreses, però el departament de recursos humans és exigent i vol un llistat de les empreses on especifiquis si tenen més de 4 transaccions o menys.
   
   SELECT company_name, (
    CASE
    WHEN ( SELECT count(id)
           FROM transaction
           WHERE transaction.company_id = company.id ) > 4 THEN "te mes de 4 transaccions" 
       ELSE  " te menys de 4 transaccions" 
       END ) AS NumTransaccions #tienes que poner siempre nombre en subq
	FROM company;
    
    
    
    
    
    
   
   
   