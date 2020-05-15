@AbapCatalog.sqlViewName: 'ZVI_LANGUAGE_05'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Data model for languages'
define root view ZI_LANGUAGES_M_05
  as select from zlanguages_05 as Language

  composition [0..*] of ZI_FEATURES_M_05 as _Features

{
      //zlanguages_05
  key mykey,
      language_id,
      language,
      designer,
      publisher,
      released,
      operating_system,
      rating,
      favourite,
      /*-- Admin data --*/
      @Semantics.user.createdBy: true
      created_by,
      @Semantics.systemDateTime.createdAt: true
      created_at,
      @Semantics.user.lastChangedBy: true
      last_changed_by,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at,

      /* Associations */
      _Features
}
