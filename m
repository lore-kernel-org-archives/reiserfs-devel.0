From: Hans Reiser <reiser@namesys.com>
Subject: Re: New to reiserfs
Date: Mon, 13 May 2002 14:07:30 +0400
Message-ID: <3CDF9062.5070201@namesys.com>
References: <OF69292CB8.96B5D3F9-ONC1256BB8.0033D851@esade.edu> <20020513135343.A1386@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10299-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: JPASTORM@esade.edu, reiserfs-list@namesys.com

Oleg Drokin wrote:

>Hello!
>
>On Mon, May 13, 2002 at 11:34:29AM +0200, JPASTORM@esade.edu wrote:
>
>  
>
>>I'm new to this surprising file system. Currently I have a Linux Red Hat
>>6.2 server for testing, with two partitions (/ and /boot). I'm running the
>>2.2.14-5.0 kernel and I have several questions about reiserfs:
>>    
>>
>
>  
>
>>1.- Do I necessarily have to update to the 2.2.20 kernel so as to use
>>2.2.20-reiserfs patch?
>>    
>>
>
>No, but it is not guaranteed that that patch would apply to older kernels.
>Also 2.2.14 kernel is a very old one, and it is willed with bugs and security
>holes (e.g. anyone with local account may obtain root access in seconds).
>So it is good idea to upgrade the kernel regardless of whenever you plan to
>use reiserfs or not.
>
>  
>
>>2.- Can I migrate from ext2 to reiserfs without loosing data (I know I
>>should always backup my data) or should I have to format my new reiserfs
>>partitions?
>>    
>>
>
>No. Currently you need to do full backup/mkfs/restore cycle.
>
>  
>
>>3.- Is there any partition in other servers (in production) where it is
>>advisable to stay with the ext2 filesystem?
>>    
>>
>
>I usually have very small "rescue" ext2 partition with all the necessary tools
>present to ercover from various system disasters, I also never mount that
>partition, except when I need to update some tools there.
>ext2 was choosen as an fstype because 99% of all kernels are built with
>ext2 support built-in, I guess.
>In such a scenario, if I loose almost everything including rootfs,
>I still can get any kernel and boot into my rescue partition to try and recover
>stuff.
>
>  
>
>>4.- I have a PIII 1 GHz, 512 MB RAM, SCSI server where I run sendmail, bind
>>and squid. Will I have problems with performance if I migrate to reiserfs?
>>
sendmail will be lower in performance when using reiserfs unless you use 
the latest not yet released patches and turned data journaling on.  Do 
you really push the performance limits of the machine as a mail server?

squid will benefit from your putting all files in one directory.

>>    
>>
>
>Not likely.
>
>  
>
>>What's the counterpart of dealing with a journaling filesystem?
>>    
>>
>
>Some of the diskspace is occupied for the journal (32M to be exact).
>Also reiserfs is a balanced tree filesystem, and it puts somewhat higher
>load on the CPU. (more likely to overheat if you do not have correct
>cooling and stuff).
>Also you usually do not see those fsck runs at startup after power failures.
>
>Bye,
>    Oleg
>
>
>  
>



