From: Edward Shishkin <edward@namesys.com>
Subject: Re: Installing Fedora Core with root on Reiserfs
Date: Thu, 21 Jul 2005 04:04:51 +0400
Message-ID: <42DEE6A3.3040406@namesys.com>
References: <42DAB928.9000303@namesys.com> <42DB5DB3.3020809@namesys.com> <42DBD1F5.5030105@suse.com> <200507191717.49280.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25219-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200507191717.49280.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: russell@coker.com.au
Cc: Jeff Mahoney <jeffm@suse.com>, reiserfs-list@namesys.com, fedora-test-list@redhat.com, reiser@namesys.com

Russell Coker wrote:

>On Tuesday 19 July 2005 01:59, Jeff Mahoney <jeffm@suse.com> wrote:
>  
>
>>>>If the root file system is reiserfs then reiserfs.ko will (or at least
>>>>should) be included in the initrd.
>>>>        
>>>>
>>>Right, but initrd is in /boot which is not something separate: it is on
>>>the same reiserfs root partition..
>>>      
>>>
>>The situation you're describing is one that is well tested by now.
>>
>>If the root filesystem is reiserfs, and /boot is a part of it,
>>reiserfs.ko MUST be in the initrd. Otherwise, there is a chicken/egg
>>problem and the system will not boot.
>>    
>>
>
>This works in all my tests.  The reiserfs.ko module is apparently in the 
>initrd.
>
>Also if the original bug concerned a lack of reiserfs.ko in the initrd then 
>re-running GRUB would not fix things.
>
>I can't reproduce the bug, it just works for me.
>
>  
>

Sorry for the confusion.
My phrase "reiserfs.ko located on reiserfs" sounds bad, and I should
clarify that the reiserfs.ko is contained in the initrd with other
binaries/scripts, and this initrd looks fine from the standpoint of
kernel/reiserfs, but not from the standpoint of grub/reiserfs-emulation.
The logs obtained from serial console don't include anything about
loading initrd, and there is the following detail: a dump created by
debugreiserfs -d shows that the initrd (i_size: 1128235) is represented
by an indirect item (276 4K-blocks), while grub found that this is not
sector-aligned:

debugreiserfs:
--------------
|  0|54 17448 0x1 IND (1), len 1104, location 2992 entry count 0, fsck 
need 0, format new|
276 pointers
[ 1347049(276)]
  ^^^^^^^

grub:
--------------
grub> blocklist /boot/initrd-2.6.11-1.1286_FC4smp.img
(hd0,4)10776392[10-512],10776393+15,10776408[0-10],10776408[10-512],10776409+15,...
       ^^^^^^^^^^^^^^^^
...,10778584[10-512],10778585+11
(the actual dump is large, so I have cut the middle)

This blocklist doesn't contain last zeroed sectors 10778596-10778599
occupied by the initrd, but I am not sure if it is essential. The
"mysterious offset 10" looks more suspiciously.
I'll look at grub internals which are responsible for accessing reiserfs..

Thanks to everyone,
Edward.

