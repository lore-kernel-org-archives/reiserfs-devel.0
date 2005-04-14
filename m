From: Edward Shishkin <edward@namesys.com>
Subject: Re: one idea about reiser4 compress
Date: Thu, 14 Apr 2005 15:25:05 -0700
Message-ID: <425EEDC0.2070707@namesys.com>
References: <42553064.9060604@namesys.com> <200504101338.AA00075@bbb-jz5c7z9hn9y.digitalinfra.co.jp> <425940FC.8060401@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23878-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <425940FC.8060401@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linuxhippy <linuxhippy@web.de>, Jun OKAJIMA <okajima@digitalinfra.co.jp>
Cc: reiserfs-list@namesys.com

Linuxhippy wrote:

> Hi Jun!
>
>> Assume you install a distribution on a compressed partition with 
>> reiser4.
>> you usually do like this --
>>
>> | CD | Installer with decompression | -> | Re-compress with Reiser4 | 
>> HDD |
>>
>> You dont think decompression -> recompression cycle is wasteful?
>> If CD contains compressed files with reiser4 compression format,
>> I guess it is possible to do like this --
>>
>> | CD with reiser4 compressed files | Installer | -> | HDD |
>> I mean, this eliminates an overhead of re-compression and make whole 
>> isntall process simpler and faster. Maybe you could do install like 
>> this --
>> # cp -a /mnt/cdrom /mnt/target_hdd
>> And this way would be much faster than usual installer today.
>>
>> How about this idea?
>>  
>

Fine, but it makes sense only if source and target files are powered by 
the same object plugin.
Also there is no any chances for 'cp' to implement this (who will inform 
the file system if we
don't need to decompress?)

> To be honest I do not think your idea can be realized in a useful way 
> because of:
> a.) Every Installer uses its own compression format, most time those 
> packages have additional fines in it like install scripts and so on.
> b.) Reiser4.1 compression will eb definitivly optimized for speed, 
> installer-packages are usually heavily optimized for size.
> c.) You would need new API's to archive this. Either through syscalls 
> or via reiser's special files.
>
> Conclusion: It would be a major hassle to implement such stuff for 
> next to null advantages. There are so many (important) features 
> waiting to be implemented ;-) 


Fast backup of cryptcompress files is a queued feature.
It should be a business of file reader/writer (not flush algorithm). 
Also each cluster after compression is supposed
to be ciphered (not in 4.1), this means we need to copy iv-seed of 
source file and store it in disk stat-data of target file
(I think to use object id as default iv-seed). This is a victim of fast 
backup...

Edward.

