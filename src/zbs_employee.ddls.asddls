@AbapCatalog.deliveryClass: #APPLICATION_DATA
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.type: #CLIENT_DEPENDENT
@EndUserText.label: 'Table for Employee'
define table entity ZBS_Employee
{
  key EmployeeID : ZBS_ST_EmployeeID;
      StartUpID  : ZBS_ST_StartUpID;
      @EndUserText.label: 'First name'
      FirstName  : abap.char(100);
      @EndUserText.label: 'Last name'
      LastName   : abap.char(100);
      @EndUserText.label: 'Salary'
      @Semantics.amount.currencyCode: 'Currency'
      Salary     : abap.curr(10,2);
      @EndUserText.label: 'Currency'
      Currency   : abap.cuky(5);
      @EndUserText.label: 'Manager'
      Manager    : ZBS_ST_EmployeeID;
      
      _StartUp : association to parent ZBS_StartUp on _StartUp.StartUpID = $projection.StartUpID;
}
