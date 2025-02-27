CLASS ltc_table_entity DEFINITION FINAL
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    CLASS-DATA sql_environment TYPE REF TO if_osql_test_environment.
*    CLASS-DATA cds_environment TYPE REF TO if_cds_test_environment.

    CLASS-METHODS class_setup.
    CLASS-METHODS class_teardown.

    METHODS check_tdf          FOR TESTING.
    METHODS check_not_original FOR TESTING.
ENDCLASS.

CLASS zcl_bs_demo_table_entity_crud DEFINITION LOCAL FRIENDS ltc_table_entity.

CLASS ltc_table_entity IMPLEMENTATION.
  METHOD class_setup.
    DATA double_data TYPE STANDARD TABLE OF ZBS_Employee WITH EMPTY KEY.

    sql_environment = cl_osql_test_environment=>create( VALUE #( ( 'ZBS_EMPLOYEE' ) ) ).
*    cds_environment = cl_cds_test_environment=>create(
*        i_for_entity      = 'ZBS_EMPLOYEE'
*        i_dependency_list = VALUE #( ( name = 'ZBS_EMPLOYEE' type = 'TABLE' ) ) ).

    double_data = VALUE #( Currency = 'USD'
                           ( EmployeeID = 'C001'
                             FirstName  = 'Brian'
                             LastName   = 'Jonsson'
                             Salary     = '50000.00'
                             Manager    = '' )
                           ( EmployeeID = 'E001'
                             FirstName  = 'Marlene'
                             LastName   = 'Geralt'
                             Salary     = '45200.00'
                             Manager    = 'C001' ) ).

    sql_environment->insert_test_data( double_data ).
*    cds_environment->insert_test_data( double_data ).
  ENDMETHOD.


  METHOD class_teardown.
    sql_environment->destroy( ).
*    cds_environment->destroy( ).
  ENDMETHOD.


  METHOD check_tdf.
    DATA(cut) = NEW zcl_bs_demo_table_entity_crud( ).

    DATA(result) = cut->select_employee( 'C001' ).

    cl_abap_unit_assert=>assert_equals( exp = 'Brian'
                                        act = result-FirstName ).
  ENDMETHOD.


  METHOD check_not_original.
    DATA(cut) = NEW zcl_bs_demo_table_entity_crud( ).

    DATA(result) = cut->select_employee( 'E004' ).

    cl_abap_unit_assert=>assert_differs( exp = 'Ilmur'
                                         act = result-FirstName ).
  ENDMETHOD.
ENDCLASS.
