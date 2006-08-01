From: Edward Shishkin <edward@namesys.com>
Subject: Re: reiserfs 3.6 with 2TB file size limitation!
Date: Wed, 02 Aug 2006 02:26:44 +0400
Message-ID: <44CFD524.4020509@namesys.com>
References: <20060801213834.7405.qmail@web51413.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29428-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060801213834.7405.qmail@web51413.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Ricardo (Tru64 User)" <tru64user@yahoo.com>
Cc: Reiserfs-List@namesys.com

Ricardo (Tru64 User) wrote:
> Hi,

Hello

> I read on reiserfs site, faq #1, about max file sizes:
> max file size 2^60 - bytes => 1 Ei, 
> but page cache limits this to 8 Ti on architectures
> with 32 bit int for reiserfs 3.6
> 
> I do have a reiserfs 3.6 filesystem, on kernel 
> 2.6.12-21mdksmp (mandriva 2006) that would not take a
> filesize greater than 2TB!
> 
> Filesize in question::
> -rw-r--r--  1 myuser users 2147483647 Aug  1 16:41
> myfile.out

Hmm.. actually this file has size 2GB, not 2TB.
Did you try to specify O_LARGEFILE when creating a file?
(man creat)

> 
> Error received:
> "Filesize limit exceeded"
> 
> This filesystem is on a scsi device connected via 
> Adaptec AIC-7899P U160/m card (if it matters).
> 
> # debugreiserfs /dev/sda1
> debugreiserfs 3.6.19 (2003 www.namesys.com)
> 
> 
> Filesystem state: consistency is not checked after
> last mounting
> 
> Reiserfs super block in block 16 on 0x801 of format
> 3.6 with standard journal
> Count of blocks on the device: 292967356
> Number of bitmaps: 8941
> Blocksize: 4096
> Free blocks (count of blocks - used [journal, bitmaps,
> data, reserved] blocks): 172310677
> Root block: 121672
> Filesystem is NOT clean
> Tree height: 5
> Hash function used to sort names: "r5"
> Objectid map size 2, max 972
> Journal parameters:
>         Device [0x0]
>         Magic [0x5613f7b2]
>         Size 8193 blocks (including 1 for journal
> header) (first block 18)
>         Max transaction length 1024 blocks
>         Max batch size 900 blocks
>         Max commit age 30
> Blocks reserved by journal: 0
> Fs state field: 0x0:
> sb_version: 2
> inode generation number: 1507612
> UUID: 78e233e1-8210-4c9f-8f5d-7159c754db16
> LABEL: 
> Set flags in SB:
>         ATTRIBUTES CLEAN
> 
> Any idea why i would receive this limitation, with a
> 2.6 kernel and reiserfs 3.6? Can this be corrected to
> allow the full file size?
> I would appreciate any hints....
> I check the kernel-sources for the kernel version i am
> running, and i dont see any mention of "large
> file/filesystem support" that i recall was available
> in  older kernel compiles, so it is probably
> integrated now?
> 
> 
> _Thanks
> 
> Richard
> 
> __________________________________________________
> Do You Yahoo!?
> Tired of spam?  Yahoo! Mail has the best spam protection around 
> http://mail.yahoo.com 
> 
> 

