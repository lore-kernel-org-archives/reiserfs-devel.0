From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: help recover filesystem corrupted by failing ide controller
Date: Sat, 15 Mar 2003 04:08:47 +0100
Message-ID: <3E72993F.5050700@mb.tu-ilmenau.de>
References: <200303141942.00679.phma@webjockey.net> <3E728FFB.90905@mb.tu-ilmenau.de> <200303142143.58096.phma@webjockey.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13269-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pierre Abbat <phma@webjockey.net>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 03/15/2003 03:43 AM, Pierre Abbat wrote:
> On Friday 14 March 2003 21:29, Manuel Krause wrote:
> 
>>If you already did a --rebuild-tree with that _old_ (~2years!!!)
>>reiserfsck I pray you have a backup somewhere.
> 
> 
> If I couldn't cat a single file without the cat hanging, how could I make a 
> backup?

Sorry, Pierre, you should have done it 1 min. before this happened, err, 
regularily. I feel with you.
Try upgrading the kernel when this is fixed and check your hardware is 
o.k., before.

>>Try the latest -pre-release
>>ftp://ftp.namesys.com/pub/reiserfsprogs/pre/reiserfsprogs-3.6.5-pre2.tar.gz
>>
>>that is said to have some bug fixes against the latest reiserfsprogs
>>release
>>ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.4.tar.gz
>>
>>and a plus of performance and this release link is only given in case
>>you believe in release numbering itself.
> 
> 
> I have 3.6.4 on this laptop. I can modify the spell and recast it. Is it OK to 
> copy the binary to the other box (they're both AMD processors) and run it? 
> (The laptop is running Source Mage, the box with the trashed filesystem is 
> running Mandrake.)
> 

Modify spell? Recast? Source Mage? Mmh.

You can try running the old binary. Depending on the corresponding libs 
it will work. If not - try a new thing.

And don't use it on the old system before you are sure to have the 
failures' reason: old old kernel, old old FS etc.

I refer to the following mail on this list I'll cite below mostly for 
the compiler-flag you'll need for a possibly needed independent binary 
-- so, choose your poison!

Manuel



---->
On Tuesday 28 January 2003 05:41, Francois-Rene Rideau wrote:

 > Dear all,
 >
 > to determine whether my DMA problem was due to the disk or the 
motherboard,
 > I moved the disk to another machine, where I could successfully
 > hdparm -Tt /dev/hdc without crashing linux while in udma2.
 > However, when I put the disk back into its rightful place,
 > linux died horribly with lots of error messages from reiserfs.
 > I booted on /boot where I had kept a minimal runtime, and used 
reiserfsck.
 > Reiserfsck reported an inconsistency that required using --rebuild-tree.
 > And after approximately two hours, reiserfsck --rebuild-tree entered
 > an endless loop, printing
 > do_pass_2: The block (27179935) is in the tree already. Should not 
happen.


looks like progs were compiled with other libs. Could you rebuild progs 
where
you booted again or link them statically:
	make LDFLAGS='-static'
and try agan.


 > Is there anything I can do about that, to put it in working order,
 > or should I reformat and restore what I can from backup?
 >
 > I've got a distinct feeling this disk will soon go back to MAXTOR,
 > just like its twin brother.
 >
 > [ Fran?ois-Ren? ?VB Rideau | Reflection&Cybernethics |
 > http://fare.tunes.org ] [  TUNES project for a Free Reflective Computing
 > System  | http://tunes.org  ] http://Bastiat.org/ - debunking economic
 > sophisms since 1845.


-- Thanks, Vitaly Fertman

<----

