From: "Bill Rees" <brees@benchmarkautomation.com>
Subject: RE: Error In Dmesg
Date: Fri, 30 May 2003 09:39:58 -0400
Message-ID: <NHBBIGLOALLFLCNJNOLHEECMCBAA.brees@benchmarkautomation.com>
References: <20030530132532.GA16571@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14327-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030530132532.GA16571@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: ReiserFS ML <reiserfs-list@namesys.com>, mason@suse.com

This was running on a box that was capturing JPEG images from various
cameras at a high framerate. When both of the 40gb disks would reach 80%
capacity, the oldest images would be deleted. It was running for several
weeks just to exercise the filesystem and this just happened. I had to
reboot the computer and the program is up and running again and I will let
you know if it happens again.

Bill

-----Original Message-----
From: Oleg Drokin [mailto:green@namesys.com]
Sent: Friday, May 30, 2003 9:26 AM
To: Bill Rees
Cc: ReiserFS ML; mason@suse.com
Subject: Re: Error In Dmesg


Hello!

On Fri, May 30, 2003 at 08:56:32AM -0400, Bill Rees wrote:
> My application is running with the Sun jdk 1.4.1_02 under Red Hat 9.0 and
> I've received this  error in dmesg:

Do you have any way to reproduce?

> Unable to handle kernel NULL pointer dereference at virtual address
00000018
>  printing eip:
> e092b263
> *pde = 00000000
> Oops: 0000
> CPU:    0
> EIP:    0060:[<e092b263>]    Not tainted
> EFLAGS: 00010282
> EIP is at do_journal_end [reiserfs] 0x3b3 (2.4.20-8smp)

So it's died here:
  /* for each real block, add it to the journal list hash,
  ** copy into real block index array in the commit or desc block
  */
  for (i = 0, cn = SB_JOURNAL(p_s_sb)->j_first ; cn ; cn = cn->next, i++) {
    if (test_bit(BH_JDirty, &cn->bh->b_state) ) {

(in test_bit) because cn->bh is zero.
Hm. Chris, do you have any ideas how that might have happened?

Bye,
    Oleg

