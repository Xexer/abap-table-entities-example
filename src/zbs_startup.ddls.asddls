@AbapCatalog.deliveryClass: #APPLICATION_DATA
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.type: #CLIENT_DEPENDENT
@EndUserText.label: 'Table for StartUp'
define root table entity ZBS_StartUp
{
  key StartUpID         : ZBS_ST_StartUpID;
      @EndUserText.label: 'Name of the StartUp'
      StartUpName       : abap.char(50);
      @EndUserText.label: 'Description'
      Description       : abap.char(200);
      @EndUserText.label: 'Register Number'
      CompanyRegisterID : abap.char(20);
      Rating            : ZBS_SE_Ranking;
      
      _Employee : composition of exact one to many ZBS_Employee;
      _Investor : composition of exact one to many ZBS_Investor;
}
