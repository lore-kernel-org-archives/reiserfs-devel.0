From: Hans Reiser <reiser@namesys.com>
Subject: Re: Several questions about encrypted filesystem
Date: Wed, 18 Jun 2003 14:01:04 +0400
Message-ID: <3EF03860.7000608@namesys.com>
References: <20030618094418.77717.qmail@web80512.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14599-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030618094418.77717.qmail@web80512.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: tdwebste2@yahoo.com
Cc: Edward Shushkin <edward@namesys.com>, "Zhao, Forrest" <forrest.zhao@intel.com>, reiserfs-list@namesys.com

Timothy Webster wrote:

>--- Hans Reiser <reiser@namesys.com> wrote:
>  
>
>>Timothy Webster wrote:
>>
>>    
>>
>>>2) Key rotation and backups
>>>Over time the number of keys quickly become
>>>prohibitive. 
>>>
>>>      
>>>
>>Why? One key per user or group or file body. user
>>and group keys unlock 
>>the file body key which is stored in the file
>>metadata.
>>    
>>
>
>This additional level of abstraction is a good
>one and greatly reduces the total number of 
>keys required. The key space is for user, 
>group, master, acl "keys" which in turn unlock 
>individual file body keys encrypted in the file 
>metadata. The file body keys are session keys,
>which may would change foreach encrypting writing
>process. Or is this not what you had in mind?
>

By default, no.  There was someone who proposed granting write only 
permissions using a scheme in which keys change such that if you know 
the first key you can compute the later ones but the later ones don't 
allow you to compute the first ones, but this would not be the default 
encryption plugin.

>Anyway, the user, group, master, acl "keys" need
>to change quite often, perhaps once a day.
>
Why? 

> The
>idea is to keep handing out new keys as needed.
>Or is your idea to retrive semi-perminate 
>metadata keys from a PKI. Which ever approach
>you take being able to construct a combined
>key is very useful. See my other mail
>"kool stuff". The number of key components
>starts adding up very quickly even if you don't
>change the metadata keys frequently.
>10 yrs later with all these key combinations 
>on lets say a mail server, you have far too 
>many keys to individually remember. And thus 
>the key space approach. 
>
>-tim
>
>
>  
>
>>>You need to in stead store the "seed key
>>>and the dimension" of multi-dimension key space.
>>>      
>>>
>>The
>>    
>>
>>>multi-dimension key space is actually several key
>>>spaces combined to make a higher dimensional key
>>>space. 
>>>The key space is created by sequencal encryption of
>>>the seed key inserted into dimension space
>>>      
>>>
>>controlled
>>    
>>
>>>by a "secure" psedo-random walk. When a new key is
>>>required it is taken form the mult-dimensional key
>>>space as the next index number. Keys don't need to
>>>      
>>>
>>use
>>    
>>
>>>all the deminsion in its index number. Which allows
>>>transition to new key spaces as old ones get
>>>      
>>>
>>filled.
>>    
>>
>>>Or Remote sites which will ofcourse have different
>>>      
>>>
>>key
>>    
>>
>>>spaces.
>>>
>>>At some point in the future a particular key is
>>>required, it is retrived by first regenating the
>>>      
>>>
>>key
>>    
>>
>>>space, then using the key in the key space
>>>      
>>>
>>specified
>>    
>>
>>>my the "particular" key's index number. There is no
>>>reason that the key's index number and key space
>>>"number" can not be stored in the clear, lets say
>>>      
>>>
>>in
>>    
>>
>>>the file header.
>>>
>>>Using this method there is basically unlimited keys
>>>available, and they can be stored and retrived
>>>efficently.
>>>
>>>      
>>>
>
>
>__________________________________
>Do you Yahoo!?
>SBC Yahoo! DSL - Now only $29.95 per month!
>http://sbc.yahoo.com
>
>
>  
>


-- 
Hans


