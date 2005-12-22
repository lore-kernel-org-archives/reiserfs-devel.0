From: "Thomas Raschbacher" <lordvan@lordvan.com>
Subject: Re: Reiserfsck can't fix FS - part 2
Date: Thu, 22 Dec 2005 13:55:40 -0000 (GMT)
Message-ID: <10925.195.137.105.19.1135259740.squirrel@195.137.105.19>
References: <1129303303.3370.4.camel@desktop>             
    <1129484435.16949.1.camel@desktop>             
    <b14e81f00510171234l4addda48kf73e962b384be6e6@mail.gmail.com>          
       <53246.213.249.155.242.1129721262.squirrel@213.249.155.242>         
        <b14e81f00510201255x3ee436afveb8222f43f69f8a@mail.gmail.com>       
          <10442.195.137.105.19.1134285670.squirrel@195.137.105.19>        
         <f18a8d980512121022j614f431dv62adbbc3caf5a6eb@mail.gmail.com>     
            <b14e81f00512121415j3c415d45q5cdbeadd149d2eab@mail.gmail.com>  
              <f18a8d980512121454q5170cc19i31c9aa3d653226fe@mail.gmail.com>
             <46071.213.249.155.231.1134648585.squirrel@213.249.155.231>   
          <43A170D7.1070705@namesys.com>      
    <10772.195.137.105.19.1134678241.squirrel@195.137.105.19>      
    <43A27033.1060109@namesys.com>   
    <10157.195.137.105.19.1134746087.squirrel@195.137.105.19>   
    <43A67E61.4020702@namesys.com>
    <10376.195.137.105.19.1135063487.squirrel@195.137.105.19>
    <43A7BD74.8020305@namesys.com>
Reply-To: lordvan@lordvan.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-27482-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43A7BD74.8020305@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

hmm.. "safe links" ?? u as in 'ln' ?

i can recompile my kernel anytime .. i'll just feel a lot better if i get
a chance to back up my > 8GB digital photographs first .. :D
-- 
-----BEGIN GEEK CODE BLOCK-----
GCS/CC/E/M/MU/S d- s: a--- C++++(++) UL++++ P+ L++++ E W+++ N+++ o-- K w-- O
M-- V- PS+ PE-- Y++ PGP+++ t+++ 5+ X- R tv b++++ DI- D+ G++ e-->+++++ h-- !r
z-
------END GEEK CODE BLOCK------

On Tue, December 20, 2005 8:14, Vladimir V. Saveliev said:
> Hello
>
> Thomas Raschbacher wrote:
>> i just tried the -o nouser_xattr again .. and it seems like i only get
>> this error when i have -o rw... it works with -o ro .. any idea why
>> readwrite would cause this?
>>
>
> yes, because with -o ro - reiserfs does not handle safe links.
>
> And this "safe link handling" is what you have crashing.
> Am I correct that you do not have possibility to recompile the kernel
> without
> xattr support?
>


