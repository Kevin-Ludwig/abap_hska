@AbapCatalog.sqlViewName: 'ZVI_FEATURES_05'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View for features'
define view ZI_FEATURES_M_05
  as select from zfeatures_05

  association to parent ZI_LANGUAGES_M_05 as _Language on $projection.mykey = _Language.mykey

{
      //zfeatures_05
  key spras,
  key mykey,
      description,
      link,
      rating,
      cuky_field,
      price,

      /* Associations */
      _Language // Make association public

}
