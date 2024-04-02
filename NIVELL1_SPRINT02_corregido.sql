#SPRINT02
#EX1.Mostra totes les transaccions realitzades per empreses d'Alemanya.

select *
FROM transaction
WHERE company_id IN (
 SELECT id
 FROM company
 WHERE country = "Germany") ;

 #relacionas con company_id(de transaction) y id (de company) las dos tablas,tienes que utilizar IN porque devuelve mas de una fila
 
#EX2.Màrqueting està preparant alguns informes de tancaments de gestió, et demanen que els passis un llistat de les empreses que han realitzat transaccions per una suma superior a la mitjana de totes les transaccions. 

SELECT distinct(company_name)   #sacar el nombre de las empresas que cumplen requisitos
FROM company
WHERE id IN (  #subq1.sacar las id_empresas que cumplen average criteria
  select company_id
  FROM transaction
  WHERE amount > ( #subq2.encontrar el average 
   SELECT avg(amount)
   FROM transaction) ) ;
   
   
   SELECT *   #CORREGIDO: Sacar toda la información de las empresas 
FROM company
WHERE id IN (  #subq1.sacar las id_empresas que cumplen average criteria
  select company_id
  FROM transaction
  WHERE amount > ( #subq2.encontrar el average 
   SELECT avg(amount)
   FROM transaction) ) ;
 
#EX3.El departament de comptabilitat va perdre la informació de les transaccions realitzades per una empresa, però no recorden el seu nom, només recorden que el seu nom iniciava amb la lletra c. Com els pots ajudar? Comenta-ho acompanyant-ho de la informació de les transaccions.

SELECT *
FROM transaction # info transacciones 
 WHERE company_id IN (  #company id de las empresas que cumplen requisitos 
  SELECT id 
  FROM company
  WHERE company_name LIKE "C%" ) ; #condicion que empiezan con "C"
  
  
  #CORRECCIÓN:Añadiendo nombbre empresa 
  
  SELECT transaction.* , company.company_name
FROM transaction # info transacciones 
INNER JOIN company
ON transaction.company_id= company.id
 WHERE company_id IN (  #company id de las empresas que cumplen requisitos 
  SELECT id 
  FROM company
  WHERE company_name LIKE "C%" ) ; #condicion que empiezan con "C"
  
  #Ex4.Van eliminar del sistema les empreses que no tenen transaccions registrades, lliura el llistat d'aquestes empreses.

select company_name                     #NOT EXIST SUBQ
FROM company
where NOT EXISTS ( 
 SELECT * FROM transaction 
 where transaction.company_id= company.id); 

# otras maneras de revisar si hay empresas eliminadas en el listado 
select company_name
FROM company
WHERE id IN (
 SELECT company_id 
 FROM transaction
 WHERE id = null ) ; 
 
 select count(distinct id)
FROM company;

select count(distinct company_id)
FROM transaction;
 


 