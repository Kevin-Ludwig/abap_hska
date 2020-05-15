CLASS lhc_Language DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS mark_favourite FOR MODIFY IMPORTING keys FOR ACTION Language~markFav RESULT result.
    METHODS unmark_favourite FOR MODIFY IMPORTING keys FOR ACTION Language~unmarkFav RESULT result.
    METHODS get_features FOR FEATURES IMPORTING keys REQUEST requested_features FOR Language RESULT result.

    METHODS validate_favourite FOR VALIDATION Language~validateFavourite IMPORTING keys FOR Language.
    METHODS validate_rating FOR VALIDATION Language~validateRating IMPORTING keys FOR Language.
    METHODS validate_language FOR VALIDATION Language~validateLanguage IMPORTING keys FOR Language.

    METHODS CalculateLanguageKey FOR DETERMINATION Language~CalculateLanguageKey IMPORTING keys FOR Language.

ENDCLASS.



CLASS lhc_Language IMPLEMENTATION.

********************************************************************************
*
* Language action to mark a favourite Language (change favourite to 1)
*
********************************************************************************
  METHOD mark_favourite.

    " Modify in local mode: BO-related updates that are not relevant for authorization checks
    MODIFY ENTITIES OF zi_languages_m_05 IN LOCAL MODE
           ENTITY language
              UPDATE FIELDS ( favourite )
                 WITH VALUE #( FOR key IN keys ( mykey      = key-mykey
                                                 favourite = 1 ) ) " Mark as favourite
           FAILED   failed
           REPORTED reported.

    " Read changed data for action result
    READ ENTITIES OF zi_languages_m_05 IN LOCAL MODE
         ENTITY language
           FIELDS ( language_id
                    language
                    designer
                    publisher
                    released
                    operating_system
                    rating
                    favourite
                    created_by
                    created_at
                    last_changed_by
                    last_changed_at )
             WITH VALUE #( FOR key IN keys ( mykey = key-mykey ) )
         RESULT DATA(lt_language).

    result = VALUE #( FOR language IN lt_language ( mykey = language-mykey
                                                    %param      = language ) ).

  ENDMETHOD.


********************************************************************************
*
* Language action to unmark a favourite Language (change favourite to 0)
*
********************************************************************************
  METHOD unmark_favourite.

    " Modify in local mode: BO-related updates that are not relevant for authorization checks
    MODIFY ENTITIES OF zi_languages_m_05 IN LOCAL MODE
           ENTITY language
              UPDATE FIELDS ( favourite )
                 WITH VALUE #( FOR key IN keys ( mykey      = key-mykey
                                                 favourite = 0 ) ) " Unmark as favourite
           FAILED   failed
           REPORTED reported.

    " Read changed data for action result
    READ ENTITIES OF zi_languages_m_05 IN LOCAL MODE
         ENTITY language
           FIELDS (
                   language_id
                    language
                    designer
                    publisher
                    released
                    operating_system
                    rating
                    favourite
                    created_by
                    created_at
                    last_changed_by
                    last_changed_at )
             WITH VALUE #( FOR key IN keys ( mykey = key-mykey ) )
         RESULT DATA(lt_language).

    result = VALUE #( FOR language IN lt_language ( mykey = language-mykey
                                                    %param      = language ) ).
  ENDMETHOD.


*********************************************************************************
**
* the dynamic feature handling for language instances
**
*********************************************************************************
  METHOD get_features.

    READ ENTITY zi_languages_m_05
       FIELDS (  language_id favourite )
         WITH VALUE #( FOR keyval IN keys (  %key = keyval-%key ) )
       RESULT DATA(lt_language_result).

    result = VALUE #( FOR ls_language IN lt_language_result
                     ( %key                           = ls_language-%key
                       %features-%action-markFav = COND #( WHEN ls_language-favourite = 1
                                                                  THEN if_abap_behv=>fc-o-disabled ELSE if_abap_behv=>fc-o-enabled  )
                       %features-%action-unmarkFav = COND #( WHEN ls_language-favourite = 0
                                                                  THEN if_abap_behv=>fc-o-disabled ELSE if_abap_behv=>fc-o-enabled   )
                    ) ).
  ENDMETHOD.


*********************************************************************************
**
* Determination to count key
**
*********************************************************************************
  METHOD CalculateLanguageKey.
    SELECT FROM zlanguages_05
        FIELDS MAX( language_id ) INTO @DATA(lv_max_language_id).

    LOOP AT keys INTO DATA(ls_key).
      lv_max_language_id = lv_max_language_id + 1.
      MODIFY ENTITIES OF zi_languages_m_05  IN LOCAL MODE
        ENTITY language
          UPDATE SET FIELDS WITH VALUE #( ( mykey     = ls_key-mykey
                                            language_id = lv_max_language_id ) )
          REPORTED DATA(ls_reported).
      APPEND LINES OF ls_reported-language TO reported-language.
    ENDLOOP.
  ENDMETHOD.


*********************************************************************************
**
* Validate favourite when saving a language data (only 0 or 1 is accepted)
**
*********************************************************************************
  METHOD validate_favourite.
    READ ENTITY zi_languages_m_05\\language FIELDS ( favourite ) WITH
        VALUE #( FOR <root_key> IN keys ( %key = <root_key> ) )
        RESULT DATA(lt_language_result).

    LOOP AT lt_language_result INTO DATA(ls_language_result).
      CASE ls_language_result-favourite.
        WHEN 0.  " Open
        WHEN 1.  " Cancelled

        WHEN OTHERS.
          APPEND VALUE #( %key = ls_language_result-%key ) TO failed.

          APPEND VALUE #( %key = ls_language_result-%key
                          %msg = new_message( id       = 'ZHSKA05' "Message Class
                                              number   = '001'
                                              v1       = ls_language_result-favourite
                                              v2       = 'Value out of range'
                                              severity = if_abap_behv_message=>severity-error )
                          %element-favourite = if_abap_behv=>mk-on ) TO reported.
      ENDCASE.
    ENDLOOP.
  ENDMETHOD.


*********************************************************************************
**
* Validate rating when saving a language data (only 1 to 5 is accepted)
**
*********************************************************************************
  METHOD validate_rating.
    READ ENTITY zi_languages_m_05\\language FIELDS ( rating ) WITH
        VALUE #( FOR <root_key> IN keys ( %key = <root_key> ) )
        RESULT DATA(lt_language_result).

    LOOP AT lt_language_result INTO DATA(ls_language_result).
      IF 0 < ls_language_result-rating AND ls_language_result-rating < 6.
        " Accepted
      ELSE.
        APPEND VALUE #( %key = ls_language_result-%key ) TO failed.

        APPEND VALUE #( %key = ls_language_result-%key
                        %msg = new_message( id       = 'ZHSKA05' "Message Class
                                            number   = '002'
                                            v1       = ls_language_result-rating
                                            v2       = 'Value out of range'
                                            severity = if_abap_behv_message=>severity-error )
                        %element-rating = if_abap_behv=>mk-on ) TO reported.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


*********************************************************************************
**
* Validate language when saving a language data (not empty)
**
*********************************************************************************
  METHOD validate_language.
    READ ENTITY zi_languages_m_05\\language FIELDS ( language ) WITH
            VALUE #( FOR <root_key> IN keys ( %key = <root_key> ) )
            RESULT DATA(lt_language_result).

    LOOP AT lt_language_result INTO DATA(ls_language_result).

      IF ls_language_result-language <> ''.
      ELSE.
        APPEND VALUE #( %key = ls_language_result-%key ) TO failed.

        APPEND VALUE #( %key = ls_language_result-%key
                        %msg = new_message( id       = 'ZHSKA05' "Message Class
                                            number   = '003'
                                            v1       = ls_language_result-language
                                            v2       = 'Field requiered'
                                            severity = if_abap_behv_message=>severity-error )
                        %element-language = if_abap_behv=>mk-on ) TO reported.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
