From: "Thomas Raschbacher" <lordvan@lordvan.com>
Subject: Re: Reiserfsck can't fix FS - part 2
Date: Wed, 28 Dec 2005 00:48:25 -0000 (GMT)
Message-ID: <10119.195.137.105.19.1135730905.squirrel@195.137.105.19>
References: <1129303303.3370.4.camel@desktop>                
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
    <10925.195.137.105.19.1135259740.squirrel@195.137.105.19>
    <43AABA54.1040404@namesys.com>
Reply-To: lordvan@lordvan.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-27533-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43AABA54.1040404@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Hi!

On Thu, December 22, 2005 14:38, Vladimir V. Saveliev said:
>> i can recompile my kernel anytime ..
>
> Please recompile the kernel without xattr. If mount will work - then we
> have
> figured out that something is wrong with xattrs removal.
>
Done that. it seems to work now. any idea why this happened and why the
mount -o nouser_xattr didnt work?
>> i'll just feel a lot better if i get
>> a chance to back up my > 8GB digital photographs first .. :D
>
> You said that you mounted it read-only. Were you able to read the data?
>
copied yes .. making sure now everything is working :)


