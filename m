From: Chris Mason <mason@suse.com>
Subject: Re: kernel: journal-1777: buffer 16 bad state  PREPARED  LOCKED
	!DIRTY  JDIRTY_WAIT
Date: Tue, 23 Mar 2004 08:10:22 -0500
Message-ID: <1080047422.11061.610.camel@watt.suse.com>
References: <m3hdwf96bm.fsf@toyland.sauerland.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17408-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m3hdwf96bm.fsf@toyland.sauerland.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sebastian Kaps <seb-keyword-reiserfs.0462a0@toyland.sauerland.de>
Cc: reiserfs-list@namesys.com

On Tue, 2004-03-23 at 06:00, Sebastian Kaps wrote:
> Hi!
> 
> I've found a few of these messages in my logs:
> ,----
> | kernel: journal-1777: buffer 16 bad state  PREPARED  LOCKED !DIRTY  JDIRTY_WAIT
> `----
> What does it mean?
> 
> I'm running Linux 2.6.4 w/ Chris' data=ordered patches on a P4-2.6, Asus
> P4P800 and Samsung SP1614C S-ATA drive.

I've been trying to track this one down.  I think it is a harmless race
between writepage and the journal code, I'm adapting that printk to
ignore it.

-chris


