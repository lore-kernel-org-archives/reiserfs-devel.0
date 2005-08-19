From: Edward Shishkin <edward@namesys.com>
Subject: Re: Basic interface for key management in reiser4 (DRAFT)
Date: Fri, 19 Aug 2005 14:45:56 +0400
Message-ID: <4305B864.6090403@namesys.com>
References: <43034EC4.9040906@namesys.com> <43039594.3040300@namesys.com> <4304D492.5010203@namesys.com> <43052842.6050505@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25571-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43052842.6050505@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Reiserfs List <reiserfs-list@namesys.com>

Hans Reiser wrote:

>Edward Shishkin wrote:
>
>  
>
>>>  What is a "plugin/regular"?  Why
>>>not "plugin/file"?
>>>
>>>      
>>>
>>first, we have the following:
>>#cat mydir/..../plugin/file
>>1 dir directory
>>
>>second, because the pseudo-file ..../plugin/file is readonly
>>    
>>
>
>you can change that, but perhaps better would be to cat "crypt_compress"
>  
>
>>mydir/..../children_inherit/plugin
>>    
>>
>
>  
>
>>: it is impossible
>>to change a file plugin of existing object in reiser4, whereas we want to
>>have a pseudo-file to specify file plugins of children to create.
>>Vitaly also suggested to rename "regular" to "creat" that sounds like
>>creat (2)
>>
>>    
>>
>>> 
>>>
>>>      
>>>
>>>>#cat mydir/..../plugin/regular
>>>>1 cryptcompress Cryptcompress regular plugin
>>>>  
>>>>        
>>>>
>>>The above is cryptic to me.
>>>
>>> 
>>>
>>>      
>>>
>>>>#cat mydir/..../plugin/compression
>>>>0 lzo1 lzo1 compression transform
>>>>  
>>>>        
>>>>
>>>The above is cryptic to me.
>>>
>>>      
>>>
>>0 lzo1 lzo1 compression transform
>>
>>^     ^     ^^^^^^^^^^^^^^^^^^^^^^^^^^
>>|   plugin label    plugin description
>>plugin id
>>    
>>
>
>Why not a separate file for each of these fields?
>
>  
>
>>    
>>
>>> Is it a list of the allowed values for
>>>compression algorithm?  What is the 0?
>>>
>>> 
>>>
>>>      
>>>
>>>>#cat mydir/..../plugin/digest
>>>>1 sha256-32 sha256-32 digest transform
>>>>#cat mydir/..../plugin/crypto
>>>>0 none absence of crypto transform
>>>>#echo -e "blowfish\0" > mydir/..../plugin/crypto
>>>>
>>>>#touch mydir/myfile
>>>>Unable to create file
>>>>#cat mydir/..../keyload
>>>>No key loaded
>>>>
>>>>#echo -e "08e19c2d91bbc14f06af9ec61e68\0" > mydir/..../keyload
>>>>        ^^----------------^^^^^^^^^^
>>>>     keysize     key      passphrase
>>>>
>>>>#cat mydir/..../keyload
>>>>keyid32: f56ef868
>>>>loaded 8-byte key for Blowfish cipher algo
>>>>
>>>>#echo "Hello World" > mydir/myfile
>>>>#cd /
>>>>#umount /mnt
>>>>#mount /dev/hdb5 /mnt
>>>>#cat /mnt/mydir/myfile
>>>>Unable to open file
>>>>#cat /mnt/mydir/myfile/..../keyload
>>>>keyid32: f56ef868
>>>>No key loaded
>>>>
>>>>#echo -e "08e19c2d91bbc14f06af9ec61e68\0" > /mnt/mydir/..../keyload
>>>>#cat /mnt/mydir/myfile
>>>>Hello World
>>>>  
>>>>        
>>>>
>>>When you load a key, who can access the file?  Only the person who
>>>loaded it, yes or?
>>>
>>>      
>>>
>>Currently standard unix permissions work here.
>>    
>>
>
>but the idea is to use keys instead of standard unix permissions....
>
>I think you need to store keys in a per process place, and allow
>specifying whether children of a process inherit the keys somehow.
>  
>

Do we need the semantic tree-based propagating:
Hans Reiser wrote:
#We would like to implement the functionality to allow the default
#plugin for a directory such as the home directory to be encrypted,
#and for everything else to not be encrypted for better performance.
#... we would like to make it possible for the descendents of this
#directory to share one key.
?

Edward.
