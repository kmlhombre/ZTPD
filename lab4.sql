--zad1a
create table FIGURY (
    id number(1) primary key,
    ksztalt mdsys.sdo_geometry
);

--zad1b
insert into figury values 
(2, sdo_geometry(2003, null, null, sdo_elem_info_array(1,1003,3), sdo_ordinate_array(1,1, 5,5)));

insert into figury values 
(1, sdo_geometry(2003, null, null, sdo_elem_info_array(1,1003,4), sdo_ordinate_array(5,3, 7,5, 5,7)));

insert into figury values 
(3, sdo_geometry(2002, null, null, sdo_elem_info_array(1,4,2, 1,2,1, 5,2,2), sdo_ordinate_array(3,2, 6,2, 7,3, 8,2, 7,1)));

select * from figury;

--zad1c
insert into figury values 
(4, sdo_geometry(2002, null, null, sdo_elem_info_array(1,4,2), sdo_ordinate_array(3,2, 7,1)));

--zad1d
select f.id, sdo_geom.validate_geometry_with_context(f.ksztalt,0.01) temp from figury f

--zad1e
delete from figury
where id in
(select f2.id from (
select f.id, sdo_geom.validate_geometry_with_context(f.ksztalt,0.01) temp from figury f) f2
where f2.temp != 'TRUE');
