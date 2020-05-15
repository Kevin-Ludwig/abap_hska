@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Project view for languages'

@UI: {
  headerInfo: { typeName: 'Feature',
                typeNamePlural: 'Features',
                title: { type: #STANDARD, value: 'Description' } } }

@Search.searchable: true


define view entity ZC_FEATURES_05
  as projection on ZI_FEATURES_M_05

{

      //ZI_FEATURES_M_05
      @UI.facet: [ { id:            'Feature',
                     purpose:       #STANDARD,
                     type:          #IDENTIFICATION_REFERENCE,
                     label:         'Feature',
                     position:      10 },

                   { id :             'rating',
                     type:            #DATAPOINT_REFERENCE , position: 10,
                     label:           'Rating',
                     purpose:         #HEADER,
                     targetQualifier: 'Rating' } ]

      @UI.hidden: true
  key spras       as FeatureID,
  key mykey,
      cuky_field,

      @UI: {
           lineItem:       [ { position: 10, importance: #HIGH, label: 'Description' } ],
           identification: [ { position: 10, label: 'Description' } ] }
      //selectionField: [ { position: 10 } ]
      @Search.defaultSearchElement: true
      description as Description,

      @UI: {
           lineItem:       [ { position: 20, type: #WITH_URL, url: 'Link', importance: #HIGH } ],
           identification: [ { position: 20, type: #WITH_URL, url: 'Link'} ] }
      //selectionField: [ { position: 20 } ]
      link        as Link,

      @UI: {
           lineItem:       [ { position: 30, type:#AS_DATAPOINT, label: 'Rating' } ],
           dataPoint:        { title: 'Rating', visualization: #RATING, targetValue: 5 },
           identification: [ { position: 30, label:'Rating [1-5]' } ] }
      @Search.defaultSearchElement: true
      rating      as Rating,

      @UI: {
           lineItem:       [ { position: 40, importance: #HIGH, label: 'Price' } ],
           identification: [ { position: 40, label: 'Price'} ] }
      @Search.defaultSearchElement: true
      price       as Price,


      /* Associations */
      //ZI_FEATURES_M_05
      _Language : redirected to parent ZC_LANGUAGES_M_05
}
