xquery version "3.0";
declare namespace exist = "http://exist.sourceforge.net/NS/exist";
declare namespace request="http://exist-db.org/xquery/request";

declare option exist:serialize "method=xml media-type=text/xml indent=yes";

let $moviesDB := doc('clapperDB.xml')//movies
let $genre:= 'Crime'

let $movies := $moviesDB//movie[genres/genre = $genre]
            
return if (empty($movies))
then <status> Nenhum resultado encontrado!</status>
else <result>{$movies}</result>
