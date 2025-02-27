CLASS zcl_bs_demo_table_entity_crud DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.
    METHODS read_data
      IMPORTING !out TYPE REF TO if_oo_adt_classrun_out.

    METHODS select_employee
      IMPORTING employee_id   TYPE ZBS_Employee-EmployeeID
      RETURNING VALUE(result) TYPE ZBS_Employee.
ENDCLASS.


CLASS zcl_bs_demo_table_entity_crud IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    out->write( select_employee( 'E001' ) ).
    read_data( out ).
  ENDMETHOD.


  METHOD read_data.
*    SELECT FROM ZBS_StartUp AS Start
*      FIELDS Start~StartUpName,
*             concat_with_space( \_Employee-FirstName, \_Employee-LastName, 1 ) as FullName,
*             \_Investor-Name
*      WHERE Rating = @ZBS_SE_Ranking-premium
*      INTO TABLE @DATA(mixed_data).

    SELECT
      FROM ZBS_StartUp AS Start
             LEFT OUTER JOIN
               ZBS_Employee AS Employee ON Employee~StartUpID = Start~StartUpID
                 LEFT OUTER JOIN
                   ZBS_Investor AS Investor ON Investor~StartUpID = Start~StartUpID
      FIELDS Start~StartUpName,
             concat_with_space( Employee~FirstName, Employee~LastName, 1 ) AS FullName,
             Investor~Name
      WHERE Rating = @ZBS_SE_Ranking-premium
      INTO TABLE @DATA(mixed_data).

    out->write( mixed_data ).
  ENDMETHOD.


  METHOD select_employee.
    SELECT SINGLE FROM ZBS_Employee
      FIELDS *
      WHERE EmployeeID = @employee_id
      INTO @result.
  ENDMETHOD.
ENDCLASS.
