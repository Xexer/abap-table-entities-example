@AbapCatalog.deliveryClass: #APPLICATION_DATA
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.type: #CLIENT_DEPENDENT
@EndUserText.label: 'Table for Investor'
define table entity ZBS_Investor
{
  key InvestmentID  : sysuuid_x16;
      StartUpID     : ZBS_ST_StartUpID;
      @EndUserText.label: 'Name of the Investor'
      Name          : abap.char(100);
      @EndUserText.label: 'Invested sum'
      @Semantics.amount.currencyCode: 'Currency'
      InvestmentSum : abap.curr(15,2);
      @EndUserText.label: 'Currency'
      Currency      : abap.cuky(5);
      @EndUserText.label: 'Company shares'
      Shares        : abap.dec(5,2);
      
      _StartUp : association to parent ZBS_StartUp on _StartUp.StartUpID = $projection.StartUpID;
}
