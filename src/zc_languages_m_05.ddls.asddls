@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Project view for languages'

@UI: {
 headerInfo: { typeName: 'Language', typeNamePlural: 'Languages', title: { type: #STANDARD, value: 'Language' } } }

@Search.searchable: true

define root view entity ZC_LANGUAGES_M_05
  as projection on ZI_LANGUAGES_M_05
{
      @UI.facet: [ { id:              'Language',
                     purpose:         #STANDARD,
                     type:            #IDENTIFICATION_REFERENCE,
                     label:           'Language',
                     position:        10 },

                   { id :             'rating' ,
                     type:            #DATAPOINT_REFERENCE , position: 10,
                     label:           'Rating' ,
                     purpose:         #HEADER ,
                     targetQualifier: 'Rating' },

                   { id :             'favourite' ,
                     type:            #DATAPOINT_REFERENCE , position: 20,
                     label:           'Favourite' ,
                     purpose:          #HEADER ,
                     targetQualifier:  'Fav' },

                   { id:               'Features',
                     label:            'Features',
                     type:             #LINEITEM_REFERENCE,
                     position:         20,
                     targetElement:    '_Features' } ]
      @UI.hidden: true
  key mykey            as LanguageUUID,
      language_id      as ID,


      @UI: {
           lineItem:       [ { position: 10, importance: #HIGH, label: 'Language' } ],
           identification: [ { position: 10, label: 'Language' } ],
           selectionField: [ { position: 10 } ] }
      @Search.defaultSearchElement: true
      language         as Language,

      @UI: {
           lineItem:       [ { position: 20, importance: #HIGH, label: 'Designer' } ],
           identification: [ { position: 20, label: 'Designer'} ],
           selectionField: [ { position: 20 } ] }
      @Search.defaultSearchElement: true
      designer         as Designer,

      @UI: {
           lineItem:       [ { position: 30, importance: #HIGH, label: 'Publisher' } ],
           identification: [ { position: 30, label: 'Publisher' } ],
           selectionField: [ { position: 30 } ] }
      @Search.defaultSearchElement: true
      publisher        as Publisher,

      @UI: {
           lineItem:       [ { position: 40, importance: #HIGH, label: 'Released' } ],
           identification: [ { position: 40, label: 'Released' } ],
           selectionField: [ { position: 40 } ] }
      @Search.defaultSearchElement: true
      released         as Released,

      @UI: {
           lineItem:       [ { position: 50, importance: #HIGH, label: 'Operating System' } ],
           identification: [ { position: 50, label: 'Operating System' } ] }
      @Search.defaultSearchElement: true
      operating_system as OS,

      @UI: {
           lineItem:       [ { position: 60, type:#AS_DATAPOINT, label: 'Rating' } ],
           dataPoint:        { title: 'Rating', visualization: #RATING, targetValue: 5 },           
           identification: [ { position: 60, label:'Rating [1-5]' } ] }
      @Search.defaultSearchElement: true
      rating           as Rating,

      @UI: {
           lineItem:       [ { position: 1, type:#AS_DATAPOINT, label: 'Favourite' },
                             { type: #FOR_ACTION, dataAction: 'markFav', label: 'Mark Favourite' },
                             { type: #FOR_ACTION, dataAction: 'unmarkFav', label: 'Unmark Favourite' } ],
           dataPoint:        { title: 'Favourite', visualization: #RATING, targetValue: 1 },
           identification: [ { position: 70, label:'Favourite [0-1]' }] }
      @Search.defaultSearchElement: true
      favourite        as Fav,

      @UI.hidden: true
      last_changed_at  as LastChangedAt,

      /* Associations */
      _Features : redirected to composition child ZC_FEATURES_05
}
