CLASS zcl_generate_features_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_generate_features_05 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA:itab TYPE TABLE OF zfeatures_05.

*   read current timestamp
    GET TIME STAMP FIELD DATA(zv_tsl).

*   fill internal travel table (itab)
    itab = VALUE #(
    " Java

    "<a href="https://www.eclipse.org/downloads/">Visit W3Schools</a>
    ( spras = 1 mykey = '02D5290E594C1EDA93815057FD946600' description = 'Eclipse for java programming' link = 'https://www.eclipse.org/downloads/' rating = 5 cuky_field = 'EUR' price = 0 )
    ( spras = 2 mykey = '02D5290E594C1EDA93815057FD946600' description = 'Java Development Kit' link = 'https://www.java.com/de/download/' rating = 4 cuky_field = 'EUR' price = 0 )
    ( spras = 3 mykey = '02D5290E594C1EDA93815057FD946600' description = 'Java documentation API' link = 'https://docs.oracle.com/javase/10/docs/api/overview-summary.html' rating = 5 cuky_field = 'EUR' price = 0 )
    ( spras = 4 mykey = '02D5290E594C1EDA93815057FD946600' description = 'Udemy java beginner certification course' link = 'https://www.udemy.com/course/programmieren-lernen-mit-java-ein-kurs-fur-einsteiger/' rating = 3 cuky_field = 'EUR' price = '9.99' )
    ( spras = 5 mykey = '02D5290E594C1EDA93815057FD946600' description = 'Udemy java advanced certification course' link = 'https://www.udemy.com/course/java-programmieren-der-fortgeschrittenen-kurs/' rating = 5 cuky_field = 'EUR' price = '9.99' )

    " C#
    ( spras = 6 mykey = '02D5290E594C1EDA93815C50CD7AE601' description = 'Visual Studio for C#' link = 'https://visualstudio.microsoft.com/de/downloads/' rating = 3 cuky_field = 'EUR' price = 0 )
    ( spras = 7 mykey = '02D5290E594C1EDA93815C50CD7AE601' description = 'C# documentation' link = 'https://docs.microsoft.com/de-de/dotnet/csharp/' rating = 4 cuky_field = 'EUR' price = 0 )
    ( spras = 8 mykey = '02D5290E594C1EDA93815C50CD7AE601' description = 'Udemy C# beginner certification course' link = 'https://www.udemy.com/course/csharp-der-umfangreiche-einsteigerkurs/' rating = 5 cuky_field = 'EUR' price = '10.99' )
    ( spras = 9 mykey = '02D5290E594C1EDA93815C50CD7AE601' description = 'Udemy C# advanced certification course' link = 'https://www.udemy.com/course/c-der-fortgeschrittenen-kurs/' rating = 3 cuky_field = 'EUR' price = '9.99' )

    " Python
    ( spras = 10 mykey = '02D5290E594C1EDA93858EED2DA2EB02' description = 'VS-Code for python programming' link = 'https://code.visualstudio.com/download' rating = 5 cuky_field = 'EUR' price = 0 )
    ( spras = 11 mykey = '02D5290E594C1EDA93858EED2DA2EB02' description = 'Spyder for python programming' link = 'https://www.anaconda.com/products/individual' rating = 4 cuky_field = 'EUR' price = 0 )
    ( spras = 12 mykey = '02D5290E594C1EDA93858EED2DA2EB02' description = 'Vim for python programming' link = 'https://www.vim.org/download.php' rating = 5 cuky_field = 'EUR' price = 0 )
    ( spras = 13 mykey = '02D5290E594C1EDA93858EED2DA2EB02' description = 'Udemy python beginner certification course' link = 'https://www.udemy.com/course/python-fur-einsteiger/' rating = 4 cuky_field = 'EUR' price = '9.99' )
    ( spras = 14 mykey = '02D5290E594C1EDA93858EED2DA2EB02' description = 'Python for data science and machine learning' link = 'https://www.udemy.com/course/python-data-science-machine-learning/' rating = 3 cuky_field = 'EUR' price = '9.99' )
    ( spras = 15 mykey = '02D5290E594C1EDA93858EED2DA2EB02' description = 'Python Documentation' link = 'https://docs.python.org/3/' rating = 5 cuky_field = 'EUR' price = 0 )

    " C++
    ( spras = 16 mykey = '02D5290E594C1EDA93858EED2DA2EB05' description = 'C++ Documentation' link = 'https://devdocs.io/cpp/' rating = 3 cuky_field = 'EUR' price = 0 )
    ( spras = 17 mykey = '02D5290E594C1EDA93858EED2DA2EB05' description = 'C++ IDE' link = 'https://www.jetbrains.com/' rating = 3 price = 0 cuky_field = 'EUR' )
    ( spras = 18 mykey = '02D5290E594C1EDA93858EED2DA2EB05' description = 'C++ Anfängerkurs' link = 'https://www.udemy.com/course/cpp-bootcamp/' rating = 2 cuky_field = 'EUR' price = '9.99' )
    ( spras = 19 mykey = '02D5290E594C1EDA93858EED2DA2EB05' description = 'C++ Fortgeschrittenen Kurs' link = 'https://www.udemy.com/course/cpp-deep-dive/' rating = 1 cuky_field = 'EUR' price = '15.95' )

    " JavaScript
    ( spras = 20 mykey = '02D5290E594C1EDA93858EED2DA204' description = 'JavaScript Documentation' link = 'https://devdocs.io/javascript/' rating = 4 cuky_field = 'EUR' price = 0 )
    ( spras = 21 mykey = '02D5290E594C1EDA93858EED2DA204' description = 'JavaScript IDE' link = 'https://code.visualstudio.com/' rating = 5 cuky_field = 'EUR' price = 0 )
    ( spras = 22 mykey = '02D5290E594C1EDA93858EED2DA204' description = 'JavaScript IDE' link = 'https://www.jetbrains.com/webstorm/' rating = 3 cuky_field = 'EUR' price = 0 )
    ( spras = 23 mykey = '02D5290E594C1EDA93858EED2DA204' description = 'JavaScript Anfängerkurs' link = 'https://www.udemy.com/course/programmieren-lernen-mit-java-ein-kurs-fur-einsteiger/' rating = 3 cuky_field = 'EUR' price = '11.99' )
    ( spras = 24 mykey = '02D5290E594C1EDA93858EED2DA204' description = 'JavaScript Fortgeschritten' link = 'https://www.udemy.com/course/der-komplette-webentwickler-2/' rating = 2 cuky_field = 'EUR' price = '14.95' )

    " Go
    ( spras = 25 mykey = '02D5290E594C1EDA93858EED2DA2EB06' description = 'GO Documentation' link = 'https://golang.org/doc/' rating = 4 cuky_field = 'EUR' price =  0 )
    ( spras = 26 mykey = '02D5290E594C1EDA93858EED2DA2EB06' description = 'GO IDE' link = 'https://code.visualstudio.com/' rating = 5 cuky_field = 'EUR' price = 0 )
    ( spras = 27 mykey = '02D5290E594C1EDA93858EED2DA2EB06' description = 'GO Anfängerkurs' link = 'https://www.udemy.com/course/einfuhrung-in-go/' rating = 3 cuky_field = 'EUR' price = '12.99' )
    ( spras = 28 mykey = '02D5290E594C1EDA93858EED2DA2EB06' description = 'GO Fortgeschrittenenkurs' link = 'https://www.udemy.com/course/effective-go/' rating = 5 cuky_field = 'EUR' price = '9.99' )

    ).

*   delete existing entries in the database table
    DELETE FROM zfeatures_05.

*   insert the new table entries
    INSERT zfeatures_05 FROM TABLE @itab.

  ENDMETHOD.

ENDCLASS.
