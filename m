From: Boyd Waters <bwaters+mac@aoc.nrao.edu>
Subject: Re: metas Permission Denied
Date: Thu, 29 Apr 2004 09:02:25 -0600
Message-ID: <39CF0546-99EE-11D8-8CFE-000A95C88606@aoc.nrao.edu>
References: <E38393BE-9950-11D8-B39A-000A95C88606@aoc.nrao.edu> <16528.46352.173184.528623@laputa.namesys.com>
Mime-Version: 1.0 (Apple Message framework v613)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18282-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16528.46352.173184.528623@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list <reiserfs-list@namesys.com>


On Apr 29, 2004, at 1:56 AM, Nikita Danilov wrote:

> Boyd Waters writes:
>> Perhaps this is obvious, but why am I getting "Permission Denied"
>> errors on the "metas" pseudo for some -- but not all -- of the files 
>> on
>> a reiser4 volume?
>>
>> (doing this as root)
>
> Can you provide more details?

Sorry, I know I was not very specific, but I thought perhaps there was 
a quick obvious answer.

Here is a simple case: a directory that holds three files; I can see 
the metas dir on one of the files and not on another one.

It's like this all over this file system. I cannot predict which files 
will let me look at their "metas" pseudo. All directories seem to 
support the metas pseudo consistently.



> lurch __ # ls backup/
> backup.sh*  fsplit*  fsplit.c

> lurch __ # ls backup/fsplit.c/metas
> ls: backup/fsplit.c/metas: Permission denied

> lurch __ # ls backup/fsplit/metas
> bmap  items  locality  nlink  pagecache/  pseudo   rwx   uid
> gid   key    new       oid    plugin/     readdir  size

> lurch __ # file backup/fsplit.c
> backup/fsplit.c: ASCII C program text

> lurch __ # stat backup/fsplit.c
>   File: `backup/fsplit.c'
>   Size: 4794            Blocks: 10         IO Block: 65536  regular 
> file
> Device: 701h/1793d      Inode: 265994      Links: 1
> Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    
> root)
> Access: 2004-04-29 08:57:56.765859214 -0600
> Modify: 2004-01-19 15:04:51.000000000 -0700
> Change: 2004-04-23 00:16:43.922694256 -0600

> lurch __ # file backup/fsplit
> backup/fsplit: ELF 32-bit LSB executable, Intel 80386, version 1 
> (SYSV), for GNU/Linux 2.4.1, dynamically linked (uses shared libs), 
> not stripped

> lurch __ # stat backup/fsplit
>   File: `backup/fsplit'
>   Size: 11191           Blocks: 22         IO Block: 65536  regular 
> file
> Device: 701h/1793d      Inode: 265992      Links: 1
> Access: (0755/-rwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/    
> root)
> Access: 2004-04-29 08:58:05.118418514 -0600
> Modify: 2004-01-19 15:05:16.000000000 -0700
> Change: 2004-04-23 00:16:43.915696302 -0600


> # uname -a
> Linux lurch 2.6.5-Redeiser4 #3 Fri Apr 23 17:55:28 MDT 2004 i686 AMD 
> Duron(tm) Processor AuthenticAMD GNU/Linux

using Redeeman's patches.

~ boyd

