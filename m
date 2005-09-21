From: PFC <lists@boutiquenumerique.com>
Subject: Re: Compression Plugin
Date: Wed, 21 Sep 2005 10:33:30 +0200
Message-ID: <op.sxf114l4th1vuj@localhost>
References: <433017C1.4050408@gmail.com> <43307E49.8060404@slaphack.com> <e692861c05092015364a887a44@mail.gmail.com> <b14e81f00509201851518accd4@mail.gmail.com> <433102D0.7010706@mch.one.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-26196-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <433102D0.7010706@mch.one.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: reiserfs-list@namesys.com


>>> An interesting idea:  select the algo and a range of compression
>>> levels per file,

	A simple check on wether it's an already compressed file (using file  
extension and magic number) should be quite easy to do and cheap.

	Now, intrigued by this lzo thingie, I ran a little benchmark on my emails  
; I have a huge mail spool and my mail client is always slow to launch...
	Seems that on this laptop LZO can compress about 40 MB/s and decompress  
about 200 (!) MB/s. On the mail spool, compression ratio was about 1/2 ;  
gzip was better, although 5-6 times slower. So considering the disk  
throughput is only 15 MB/s, this could make it twice as fast with CPU to  
spare. Yowza !

>>> but select the actual compression level at flush time
>>> based on some estimate of how loaded the system is.. :)
>>> Probably not worth it even though the amount of compression and the
>>> speed differ greatly from -1 to -9... I hope no one wastes their time
>>> on it until the more important things are done.. but perhaps a nice
>>> touch.
>>   Kinda makes it sound like in addition to the "repacker" that repacks
>> blocks in order and squeezes them, (which should allow for filesystem
>> size reduction), there'll be a compression repacker too that allows
>> you to repack files to a higher or lower compression level (anyone
>> remember the Compression Agent that came with DoubleSpace and the like
>> in Windows 9x?).
>
> AFAIR e2compr patch to ext2 (which enables compression on a ex2  
> filesystem) could use many packing methods, including gzip and bzip2  
> (!), with a range from 1 to 9...
>
> I certainly could imagine cases where compression level is more  
> important than speed.
>
>


