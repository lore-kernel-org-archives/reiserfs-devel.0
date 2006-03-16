From: Edward Shishkin <edward@namesys.com>
Subject: Re: Encryption/Compression and meta data (like file names)
Date: Thu, 16 Mar 2006 15:21:54 +0300
Message-ID: <44195862.2030000@namesys.com>
References: <200603131341.11327.jgilmore@glycou.com> <441662E7.3010003@namesys.com> <4416CB93.2090502@namesys.com> <4417C0A4.5020000@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28290-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4417C0A4.5020000@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: John Gilmore <jgilmore@glycou.com>, reiserfs-list@namesys.com

Hans Reiser wrote:

>Edward Shishkin wrote:
>
>  
>
>>Hans Reiser wrote:
>>
>>    
>>
>>>Instead of answering your questions as asked, let me explain what it
>>>does.
>>>
>>>It encrypts the file data.  It makes some effort at avoiding
>>>watermarking attacks by use of an initialization vector, but this effort
>>>is not robust in that file size is not encryptable without an
>>>unacceptable cost in space utilization (to encrypt file size you must
>>>store each of the files with a random amount of padding proportional to
>>>the size of the largest file stored),
>>>
>>>      
>>>
>>Why?
>>As I understand, to encrypt file size means to encrypt a 64-bit field
>>in the appropriate
>>stat-data extension, also we need to make sure that nobody can observe
>>this attribute
>>(except key owner) when inode is in memory.
>>    
>>
>
>If you have root, you can inspect the items on the raw device, and from
>them construct the compressed size.  The problem is not encrypting the
>attribute, it is preventing persons with access to the raw device from
>constructing the size.
>
>  
>
>>>and for that reason we do not
>>>encrypt file size. 
>>>      
>>>
>>We don't encrypt file size (and other attributes) because nobody tried
>>to implement it
>>(not because of unresolved problems).
>>
>>    
>>
>>>Edward, do you do some minor (and not crypto-secure)
>>>amount of padding?  (I think he does.)
>>> 
>>>
>>>      
>>>
>>We use get_random_bytes() to fill up each stream to be proportional to
>>the cipher block
>>size before encryption.  This is safe.
>>    
>>
>
>but it does not prevent determining whether the linux kernel tree is
>present in a directory.
>

I mean this is not a security hole like say filling it up by zeroes.

>  the cipher block is something like 64 bytes, so
>you still have enough size info to guess that the kernel source code is
>in a directory.  You will often be able to guess things like whether two
>users are probably sharing the same file based on file size.
>  
>

Oh, social engineering works here?
I think it will be enough for a file system to prevent trivial 
assumtions about file's content
(by encrypting file names)

>So, we offer one tool.   This tool does not meet all needs, just some
>needs.  I wish I was using it on my home directory, we need to get this
>stuff shipped.;-)
>  
>

