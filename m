From: Hans Reiser <reiser@namesys.com>
Subject: Re: Proposal for keying encrypted filesystem
Date: Wed, 02 Apr 2003 10:06:45 +0400
Message-ID: <3E8A7DF5.9070302@namesys.com>
References: <200303282026.23543.phma@webjockey.net> <76105761281.20030401181632@tnonline.net> <3E89BC94.5030308@namesys.com> <200304012156.56798.phma@webjockey.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13520-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304012156.56798.phma@webjockey.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pierre Abbat <phma@webjockey.net>
Cc: reiserfs-list@namesys.com

Pierre Abbat wrote:

>On Tuesday 01 April 2003 11:21, Hans Reiser wrote:
>  
>
>>I think it is essential to the task that apps not be aware of keys.
>>    
>>
>
>Indeed. The reiser4-specific syscall should insert or delete a key into the 
>database;
>
why?

> to open a file you use the generic open() syscall, which passes the 
>filename to reiser4, which then asks the plugin if it has the key, and fails 
>if it doesn't. The only time you should need to use a reiser4-specific call 
>to open a file is when you need to read or write the ciphertext, which Bob 
>needs to do when he backs up to tape (or another disk) the data which Alice 
>backed up to him. This also needs special read and write calls, as you need 
>to know how long each block (stored as a tail) is, because it's compressed.
>
>I'd also like to see some other protocols using an encrypted filesystem, 
>especially ones using public key, as I don't understand why you need public 
>key encryption in a filesystem.
>
>phma
>  
>


-- 
Hans


