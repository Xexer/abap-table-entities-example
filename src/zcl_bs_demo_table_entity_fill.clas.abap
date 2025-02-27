CLASS zcl_bs_demo_table_entity_fill DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_bs_demo_table_entity_fill IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA startups  TYPE STANDARD TABLE OF ZBS_StartUp WITH EMPTY KEY.
    DATA employees TYPE STANDARD TABLE OF ZBS_Employee WITH EMPTY KEY.
    DATA investors TYPE STANDARD TABLE OF ZBS_Investor WITH EMPTY KEY.

    INSERT VALUE #( StartUpID         = xco_cp=>uuid( )->value
                    StartUpName       = 'Unicorns'
                    Description       = 'Innovative Ideas with Unicorns'
                    CompanyRegisterID = 'UNI1245C5'
                    Rating            = ZBS_SE_Ranking-premium )
           INTO TABLE startups REFERENCE INTO DATA(startup_uni).

    INSERT VALUE #( StartUpID         = xco_cp=>uuid( )->value
                    StartUpName       = 'Woodi'
                    Description       = 'Hand-designed wooden furniture by the artist'
                    CompanyRegisterID = 'WOO9749D1'
                    Rating            = ZBS_SE_Ranking-good )
           INTO TABLE startups REFERENCE INTO DATA(startup_wood).

    INSERT VALUE #( StartUpID         = xco_cp=>uuid( )->value
                    StartUpName       = 'AI Runners'
                    Description       = 'AI Tools for the ABAP Developer of Tomorrow'
                    CompanyRegisterID = 'AIT6684F3'
                    Rating            = ZBS_SE_Ranking-nochance )
           INTO TABLE startups REFERENCE INTO DATA(startup_ai).

    employees = VALUE #( ( EmployeeID = 'C001'
                           StartUpID  = startup_uni->StartUpID
                           FirstName  = 'Skye'
                           LastName   = 'Robertson'
                           Salary     = '75000.00'
                           Currency   = 'EUR'
                           Manager    = '' )
                         ( EmployeeID = 'E001'
                           StartUpID  = startup_uni->StartUpID
                           FirstName  = 'Indiana'
                           LastName   = 'Fitz'
                           Salary     = '35200.00'
                           Currency   = 'EUR'
                           Manager    = 'C001' )
                         ( EmployeeID = 'E002'
                           StartUpID  = startup_uni->StartUpID
                           FirstName  = 'Kaua Correia'
                           LastName   = 'Rocha'
                           Salary     = '45750.00'
                           Currency   = 'EUR'
                           Manager    = 'C001' )
                         ( EmployeeID = 'C002'
                           StartUpID  = startup_wood->StartUpID
                           FirstName  = 'Peter'
                           LastName   = 'Wulf'
                           Salary     = '150000.00'
                           Currency   = 'USD'
                           Manager    = '' )
                         ( EmployeeID = 'E003'
                           StartUpID  = startup_wood->StartUpID
                           FirstName  = 'A''ishah Hafizah'
                           LastName   = 'Deeb'
                           Salary     = '55600.00'
                           Currency   = 'USD'
                           Manager    = 'C002' )
                         ( EmployeeID = 'C003'
                           StartUpID  = startup_ai->StartUpID
                           FirstName  = 'Kadeer Mutawalli'
                           LastName   = 'Hajjar'
                           Salary     = '36000.00'
                           Currency   = 'CHF'
                           Manager    = '' )
                         ( EmployeeID = 'C004'
                           StartUpID  = startup_ai->StartUpID
                           FirstName  = 'Kimberly Pérez'
                           LastName   = 'Bustos'
                           Salary     = '48000.00'
                           Currency   = 'CHF'
                           Manager    = 'C003' )
                         ( EmployeeID = 'E004'
                           StartUpID  = startup_wood->StartUpID
                           FirstName  = 'Ilmur'
                           LastName   = 'Sigþórsdóttir'
                           Salary     = '280000.00'
                           Currency   = 'CHF'
                           Manager    = 'C004' )
                         ( EmployeeID = 'E005'
                           StartUpID  = startup_wood->StartUpID
                           FirstName  = 'Xiao Chen'
                           LastName   = 'Hu'
                           Salary     = '235000.00'
                           Currency   = 'CHF'
                           Manager    = 'C004' )
                         ( EmployeeID = 'E006'
                           StartUpID  = startup_wood->StartUpID
                           FirstName  = 'Callum'
                           LastName   = 'Carroll'
                           Salary     = '278000.00'
                           Currency   = 'CHF'
                           Manager    = 'C004' ) ).

    investors = VALUE #( ( InvestmentID  = xco_cp=>uuid( )->value
                           StartUpID     = startup_uni->StartUpID
                           Name          = 'Buffalo Shoes'
                           InvestmentSum = '300000.00'
                           Currency      = 'EUR'
                           Shares        = '10.50' )
                         ( InvestmentID  = xco_cp=>uuid( )->value
                           StartUpID     = startup_uni->StartUpID
                           Name          = 'Cuvox Unicorns'
                           InvestmentSum = '150000.00'
                           Currency      = 'EUR'
                           Shares        = '8.20' )
                         ( InvestmentID  = xco_cp=>uuid( )->value
                           StartUpID     = startup_uni->StartUpID
                           Name          = 'Skye Robertson'
                           InvestmentSum = '75000.00'
                           Currency      = 'EUR'
                           Shares        = '50.10' )
                         ( InvestmentID  = xco_cp=>uuid( )->value
                           StartUpID     = startup_wood->StartUpID
                           Name          = 'Walter L. Oliver'
                           InvestmentSum = '45000'
                           Currency      = 'USD'
                           Shares        = '20.00' ) ).

    DELETE FROM ZBS_StartUp.
    DELETE FROM ZBS_Employee.
    DELETE FROM ZBS_Investor.

    INSERT ZBS_StartUp FROM TABLE @startups.
    INSERT ZBS_Employee FROM TABLE @employees.
    INSERT ZBS_Investor FROM TABLE @investors.
  ENDMETHOD.
ENDCLASS.
