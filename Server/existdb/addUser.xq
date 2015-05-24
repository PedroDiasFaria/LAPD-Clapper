xquery version "3.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace util="http://exist-db.org/xquery/util";

declare option exist:serialize "method=xml media-type=text/xml indent=yes";
    let $users := doc("clapperDB.xml")//users
    let $user:=  
    <user userName="NEW USER" userId="12881">
        <toSeeList>
            <movieId>tt0988045</movieId>
            <movieId>tt1515091</movieId>
        </toSeeList>
        <seenList>
            <movie>
                <movieId>tt3168234</movieId>
                <personalClassification>7</personalClassification>
                <comment commentId="1">Cool movie</comment>
            </movie>
        </seenList>
    </user>
    
    return 
        if($users//user[@userId = $user/@userId])
    then
        <status>Already exists</status>
    else
        (update insert $user into $users,
             <status> User Added </status>)
        
    
            
       
            

 

