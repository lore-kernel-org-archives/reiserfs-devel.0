From: Hans Reiser <reiser@namesys.com>
Subject: Re: Unicode policy
Date: Fri, 02 May 2003 04:55:37 +0400
Message-ID: <3EB1C209.1050808@namesys.com>
References: <200305011538.h41FcFn01653@linux1.futureware.at> <20030501154819.GA15670@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13919-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030501154819.GA15670@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Philipp G?hring <p.guehring@futureware.at>, reiserfs-list@namesys.com

It is a VFS issue.  We just conform.  VFS can't handle / and null being 
in a filename, so Unicode can't work in Linux.  If you get VFS to handle 
Unicode, I'll make ReiserFS work.  Linus is the one to convince, not us.

Best,

Hans

Oleg Drokin wrote:

>Hello!
>
>On Thu, May 01, 2003 at 05:38:04PM +0200, Philipp G?hring wrote:
>
>  
>
>>I have some question regarding the Unicode policy of filenames in filesystem, 
>>especially ReiserFS. 
>>Are filenames stored in UTF-8?
>>    
>>
>
>No. filenames are stored "as is". If you write those as unicode, you get unicode.
>
>There are several restrictions on filenames in Unix/Linux:
>You cannot use 0-byte and '/'-byte as part of filename.
>
>  
>
>>Should they be stored in UTF-8?
>>    
>>
>
>You decide how do you want to store your filenames.
>
>  
>
>>Is it a question of the filesystem?
>>    
>>
>
>Some filesystems do it, but I doubt FS should do it.
>
>  
>
>>Is it the applications job to interpret it?
>>    
>>
>
>It is debatable. Kernel/VFS/some library might do this as well.
>
>  
>
>>Or is the filesystem encoding independent?
>>    
>>
>
>Some filesystems are encoding-dependent and some are not (because they do not know anything about encoding at all).
>
>  
>
>>Are there migration plans to Unicode?
>>    
>>
>
>Migration of what? Migration of reiserfs to unicode is not planned.
>Same for reiser4. You can write whatever plugin to store filenames in any way
>you might imagine in reiser4.
>
>Bye,
>    Oleg
>
>
>  
>


-- 
Hans


