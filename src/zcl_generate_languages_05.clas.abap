CLASS zcl_generate_languages_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_generate_languages_05 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA:itab TYPE TABLE OF zlanguages_05.


*   read current timestamp
    GET TIME STAMP FIELD DATA(zv_tsl).

*   fill internal travel table (itab)
    itab = VALUE #(
    ( mykey = '02D5290E594C1EDA93815057FD946600' language_id = '00000001' language = 'Java' designer = 'James Gosling' publisher = 'Sun Microsystems' released = '1995' operating_system = 'platform indipendent' rating = 5
    favourite = 0 created_by = 'SHEMA' created_at = '20190612133945.5960060' last_changed_by = 'SHEMA' last_changed_at = '20190702105400.3647680'  )
    ( mykey = '02D5290E594C1EDA93815C50CD7AE601' language_id = '00000002' language = 'C#' designer = 'Anders Hejlsberg' publisher = 'Microsoft' released = '2001' operating_system = 'platform dependent' rating = 3
    favourite = 0 created_by = 'SHEMA' created_at = '20190612133945.5960060' last_changed_by = 'SHEMA' last_changed_at = '20190702105400.3647680'  )
    ( mykey = '02D5290E594C1EDA93858EED2DA2EB02' language_id = '00000003' language = 'Python' designer = 'Guido van Rossum' publisher = 'Python Software foundation' released = '1991' operating_system = 'platform indipendent' rating = 4
    favourite = 1 created_by = 'SHEMA' created_at = '20190612133945.5960060' last_changed_by = 'SHEMA' last_changed_at = '20190702105400.3647680'  )
    ( mykey = '02D5290E594C1EDA93858EED2DA2EB03' language_id = '00000004' language = 'C' designer = 'Dennis Ritchie' publisher = 'Bell Labs' released = '1972' operating_system = 'platform indipendent' rating = 3
    favourite = 0 created_by = 'SHEMA' created_at = '20190612133945.5960060' last_changed_by = 'SHEMA' last_changed_at = '20190702105400.3647680'  )
    ( mykey = '02D5290E594C1EDA93858EED2DA204' language_id = '00000005' language = 'Javascript' designer = 'Brendan Eich' publisher = 'Sun Microsystems' released = '1995' operating_system = '-' rating = 4
    favourite = 0 created_by = 'SHEMA' created_at = '20190612133945.5960060' last_changed_by = 'SHEMA' last_changed_at = '20190702105400.3647680'  )
    ( mykey = '02D5290E594C1EDA93858EED2DA2EB05' language_id = '00000006' language = 'C++' designer = 'Bjarne Stroustrop' publisher = 'AT&T' released = '1985' operating_system = 'platform indipendent' rating = 4
    favourite = 0 created_by = 'SHEMA' created_at = '20190612133945.5960060' last_changed_by = 'SHEMA' last_changed_at = '20190702105400.3647680'  )
    ( mykey = '02D5290E594C1EDA93858EED2DA2EB06' language_id = '00000007' language = 'Go' designer = 'Rob Pike' publisher = 'Google' released = '2009' operating_system = 'platform indipendent' rating = 5
    favourite = 1 created_by = 'SHEMA' created_at = '20190612133945.5960060' last_changed_by = 'SHEMA' last_changed_at = '20190702105400.3647680'  )
    ( mykey = '02D5290E594C1EDA93858EED2DA2EB07' language_id = '00000008' language = 'Cobol' designer = 'Grace Hopper' publisher = 'CODASYL ' released = '1959' operating_system = 'platform indipendent' rating = 4
    favourite = 0 created_by = 'SHEMA' created_at = '20190612133945.5960060' last_changed_by = 'SHEMA' last_changed_at = '20190702105400.3647680'  )
    ( mykey = '02D5290E594C1EDA93858EED2DA2EB08' language_id = '00000009' language = 'KII' designer = 'Igor Albert' publisher = 'Shema Group' released = '1992' operating_system = 'platform indipendent' rating = 5
    favourite = 1 created_by = 'SHEMA' created_at = '20190612133945.5960060' last_changed_by = 'SHEMA' last_changed_at = '20190702105400.3647680'  )
    ).

*   delete existing entries in the database table
    DELETE FROM zlanguages_05.

*   insert the new table entries
    INSERT zlanguages_05 FROM TABLE @itab.


  ENDMETHOD.
ENDCLASS.

