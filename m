From: Oleg Drokin <green@namesys.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Fri, 14 Feb 2003 13:59:02 +0300
Message-ID: <20030214135902.I10351@namesys.com>
References: <3E4AA902.86F15815@interface-ag.com> <b2h7dc$ipp$1@satsuki.furryterror.org> <3E4C392A.2070909@namesys.com> <20030214111829.A21849@namesys.com> <20030214031316.L22930@schatzie.adilger.int> <20030214131746.H10351@namesys.com> <20030214035034.M22930@schatzie.adilger.int>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12760-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030214035034.M22930@schatzie.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

Hello!

On Fri, Feb 14, 2003 at 03:50:34AM -0700, Andreas Dilger wrote:
> > > like ext3 "errors={panic,remount-ro,warning}"?  If you marked the filesystem
> > > and/or journal in error and mount read-only, and force a full fsck at
> > > reboot time at least the user has a chance - otherwise the node might
> > > just panic in a loop.
> > It hangs on panic ;) (because it does BUG() ), so no cyclical reboot.
> Ah, you said panic, but panic != BUG...  There is a "reboot-on-panic" flag

Yes, I know. I just used the wrong word. Tere is reiserfs_panic, but it does
BUG(), hence the confusion. (btw panic() in 2.5 seems not to halt the machine.
I was able to continue work on 2.5 after panic() was called. Though that was
during 2.5.20-something I think, so may be it is back to normal behaviour).

> that is often set on servers so they don't sit stupidly when they could
> reboot and start working again.

Yeah, I use that on my servers too.

Bye,
    Oleg 
