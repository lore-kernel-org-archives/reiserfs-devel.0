From: Oleg Drokin <green@namesys.com>
Subject: Re: Error In Dmesg
Date: Fri, 30 May 2003 17:25:32 +0400
Message-ID: <20030530132532.GA16571@namesys.com>
References: <NHBBIGLOALLFLCNJNOLHMECLCBAA.bill@billrees.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14326-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <NHBBIGLOALLFLCNJNOLHMECLCBAA.bill@billrees.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Rees <bill@billrees.com>
Cc: ReiserFS ML <reiserfs-list@namesys.com>, mason@suse.com

Hello!

On Fri, May 30, 2003 at 08:56:32AM -0400, Bill Rees wrote:
> My application is running with the Sun jdk 1.4.1_02 under Red Hat 9.0 and
> I've received this  error in dmesg:

Do you have any way to reproduce?

> Unable to handle kernel NULL pointer dereference at virtual address 00000018
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
