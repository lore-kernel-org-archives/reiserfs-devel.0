From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: BUG: Replaying ReiserFS log causes hard lockup
Date: Thu, 25 Mar 2004 14:15:48 +0300
Message-ID: <1080213348.1976.277.camel@tribesman.namesys.com>
References: <20040325204836.07bcf910.a.nielsen@optushome.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17461-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040325204836.07bcf910.a.nielsen@optushome.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adam Nielsen <a.nielsen@optushome.com.au>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2004-03-25 at 13:48, Adam Nielsen wrote:
> Hi,
> 
> My apologies if this is the wrong place to send a report like this, but
> I couldn't find anywhere more suitable!
> 
> I have just come across a rather annoying bug, which seems to be most
> likely located in ReiserFS as my computer now locks up while
> booting a stock 2.6.3 kernel almost immediately after displaying this:
> 
> found reiserfs format "3.6" with standard journal
> Reiserfs journal params: device sda1, size 8192, journal first block 18,
> max trans len 1024, max batch 900, max commit age 30, max trans age 30
> reiserfs: checking transaction log (sda1) for (sda1)
> 
Is sda1 your root filesystem?
For the beginning you should boot without mounting it and reiserfsck it

> And it's a hard lockup - my keyboard LEDs stop working as does the magic
> SysRq key.  Are there any known problems that could exhibit
> symptoms like this? (e.g. will upgrading to kernel 2.6.4 fix it?)
> 
> The drive itself is a Western Digital SATA drive, connected via an
> onboard Silicon Image 3512A (which uses the under-development sil3112
> (I think) driver, so I guess there's a chance it could be the driver's
> fault, however I have not had any problems at all before this.)  The
> board itself is a Gigabyte GA-7N400 Pro 2 (rev 2.0) with an nForce 2
> chipset.
> 
> I've got no idea how to go about diagnosing the problem further, so any
> suggestions would be greatly appreciated!  I'm not subscribed to this
> list, so please CC any responses to me.
> 
> Oh, and one last thing, the problem seems to be caused by writing to the
> drive (I assume), as my computer had locked up sometime this
> afternoon, and when I reset it was when it started locking up while
> booting, I guess trying to repeat the same write operation as what
> caused the original lockup.
> 
> Anyway, any info would be greatly appreciated (as would the ability to
> be able to boot my computer again ;-))
> 
> Thanks,
> Adam.
> 
> P.S.  I've never tried debugging a kernel before, but I am able to
> compile a kernel and test it on this machine (by booting it over the
> network) and I do have a serial cable, should it come in handy for
> anything ;-)
> 

