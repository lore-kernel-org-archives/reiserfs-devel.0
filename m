From: Alexandre Ratti <alex@gabuzomeu.net>
Subject: New error when running script on ReiserFS partition
Date: Thu, 12 Dec 2002 14:54:33 +0100
Message-ID: <4.3.2.7.2.20021212141046.00b5d640@mail.poulpe.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12154-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello,


I got a new error when my backup script ran today. (See [1] for previous 
message sent on Tuesday). This script runs on a large ReiserFS partition. 
System is Debian Woody with recompiled 2.4.19 kernel. System did not crash.

[1] http://marc.theaimsgroup.com/?t=103955025600002&r=1&w=2

I saw with ps that the kupdated process was dead (defunct).

I'm not sure this is ReiserFS-related, though these errors only seem to 
happen when the script runs. Can someone confirm, based on this syslog snippet?


Thanks.

Alexandre

----------
Dec 12 13:10:01 p120 /USR/SBIN/CRON[1612]: (backup) CMD 
(/usr/local/bin/roller.py)
Dec 12 13:15:01 p120 kernel: Unable to handle kernel paging request at 
virtual address 0002dd4c
Dec 12 13:15:01 p120 kernel:  printing eip:
Dec 12 13:15:01 p120 kernel: c0186f77
Dec 12 13:15:01 p120 kernel: *pde = 00000000
Dec 12 13:15:01 p120 kernel: Oops: 0000
Dec 12 13:15:01 p120 kernel: CPU:    0
Dec 12 13:15:02 p120 kernel: EIP:    0010:[can_dirty+87/144]    Not tainted
Dec 12 13:15:02 p120 kernel: EFLAGS: 00010206
Dec 12 13:15:02 p120 kernel: eax: 0002dd48   ebx: c383c75c   ecx: 
00000001   edx: c38713ec
Dec 12 13:15:02 p120 kernel: esi: 0001fe7e   edi: 00001601   ebp: 
c38193bc   esp: c10e9f3c
Dec 12 13:15:02 p120 kernel: ds: 0018   es: 0018   ss: 0018
Dec 12 13:15:02 p120 kernel: Process kupdated (pid: 7, stackpage=c10e9000)
Dec 12 13:15:02 p120 kernel: Stack: c383c75c 00000004 00000000 c0184f29 
c383c75c
  c38193bc 00000004 00000005
Dec 12 13:15:02 p120 kernel:        00000000 00000001 c38193fc 00000000 
00000000 c01850da c2c89000 c38193bc
Dec 12 13:15:02 p120 kernel:        c10e9fa4 c2c89000 00000004 3df87dc2 
c0187178 c2c89000 c2c89000 c2c89044
Dec 12 13:15:02 p120 kernel: Call Trace: [kupdate_one_transaction+177/508] 
[reiserfs_journal_kupdate+102/148] [flush_old_commits+320/336] 
[reiserfs_write_sup
er+21/32] [sync_supers+188/240]
Dec 12 13:15:02 p120 kernel:   [sync_old_buffers+12/68] [kupdate+217/252] 
[kernel_thread+40/56]
Dec 12 13:15:02 p120 kernel:
Dec 12 13:15:02 p120 kernel: Code: 83 78 04 00 74 1f 8b 40 0c 85 c0 7e 18 
83 3a 00 74 13 8b 42
----------


>Date: Wed, 11 Dec 2002 11:28:25 +0100
>To: Oleg Drokin <green@namesys.com>
>From: Alexandre Ratti <alex@gabuzomeu.net>
>Subject: Re: "get_cnode failed" error
>Cc: reiserfs-list@namesys.com, mason@namesys.com

>At 10:26 11/12/2002 +0300, Oleg Drokin wrote:
>>On Tue, Dec 10, 2002 at 08:55:08PM +0100, Alexandre Ratti wrote:
>> > The FS looks OK, but I'm curious. What does this error mean? It is 
>> serious?
>>
>>This error means there was some journaling code screwup. So FS panicked 
>>before it could do any harm to on-disk data.
>>What does your script does with cp? Do you have at least some aproximate 
>>ideas on what it copied and from where to where?
>
>Yes, this is a backup script in Python. It first duplicate an existing 
>directory tree into a new tree using hard links, then it synchronise the 
>new tree with files located on another server using rsync. This create an 
>incremental backup. See [1] for theory and [2] for code.
>
>[1] http://www.mikerubel.org/computers/rsync_snapshots/
>[2] http://web2.airmail.net/lelie/roller.py
>
>I think the script was running "cp -al old_dir new_dir" to duplicate a 
>directory tree (16 GB) on the same partition. This is a large (120 GB) 
>partition I use to back up files; it is 30% full.
>
>The script ran 99 times without any glitch. Yesterday, after the error, I 
>upgraded the system to 2.4.19 and I ran the script again; it ran with no 
>error.


