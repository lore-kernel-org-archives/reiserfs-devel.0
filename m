From: Edward Shishkin <edward@namesys.com>
Subject: Re: Encryption/Compression and meta data (like file names)
Date: Tue, 14 Mar 2006 16:56:35 +0300
Message-ID: <4416CB93.2090502@namesys.com>
References: <200603131341.11327.jgilmore@glycou.com> <441662E7.3010003@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28249-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <441662E7.3010003@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: John Gilmore <jgilmore@glycou.com>, reiserfs-list@namesys.com

Hans Reiser wrote:

>Instead of answering your questions as asked, let me explain what it does.
>
>It encrypts the file data.  It makes some effort at avoiding
>watermarking attacks by use of an initialization vector, but this effort
>is not robust in that file size is not encryptable without an
>unacceptable cost in space utilization (to encrypt file size you must
>store each of the files with a random amount of padding proportional to
>the size of the largest file stored),
>

Why?
As I understand, to encrypt file size means to encrypt a 64-bit field in 
the appropriate
stat-data extension, also we need to make sure that nobody can observe 
this attribute
(except key owner) when inode is in memory.

> and for that reason we do not
>encrypt file size.  
>

We don't encrypt file size (and other attributes) because nobody tried 
to implement it
(not because of unresolved problems).

>Edward, do you do some minor (and not crypto-secure)
>amount of padding?  (I think he does.)
>  
>

We use get_random_bytes() to fill up each stream to be proportional to 
the cipher block
size before encryption.  This is safe.

>It does not encrypt the filenames.
>
>I believe that if you want to encrypt file size you really want a deeply
>different approach.
>
>The problem with not encrypting file size is that you can figure out
>whether someone is storing, say, the linux kernel, in their home
>directory, by looking at file sizes, and if for every file in the tree
>you have a match in file size, you can be pretty sure the linux kernel
>is what it is.
>
>So, our encryption is useful for protecting data whose contents are
>unique, 
>

Yes

>like your personal accounting, and not useful for data that are
>widely known and stored in a tree of many files, like the linux kernel.
>
>Now that I have answered the questions you did not ask, could you repeat
>your email to me with the questions that you still want me to answer?
>
>Future work for future reiser4's: multi-file compression and encryption
>based on encrypting and compressing (enlarged) nodes not files. 
>Alternately, compressing and encrypting whole directories rather than
>files.  Note how if files are 100 bytes, you are motivated to make
>compression be implemented using multiple files if you want good
>compression.
>
>Hans
>
>John Gilmore wrote:
>
>  
>
>>I seem to recall several people saying that the compression/encryption plugins 
>>will only encrypt items, and not the filesystems metadata. And then saying 
>>that this might be useless for their purposes, because being able to see the 
>>filename might be enough for the attacker.
>>
>>However, I don't think that is correct. The only thing visible to an attacker 
>>would be the tree structure, not the item, which contains the directory 
>>information including the filenames.
>>
>>    
>>

This is a complex problem, but even in the simplest case, when attacker 
has only your hard drive,
all disk structures (including items) are available.
 

>>So at most an attacker would be able to browse the tree structure, and see the 
>>keys used and the size of the item pointed to. If this is true, selection of 
>>a good hash should entirely prevent the giving information away problem, 
>>leaving only useless key->size->location data for an attacker.
>>
>>Is my understanding correct?
>>
>>
>> 
>>
>>    
>>
>
>
>
>  
>

