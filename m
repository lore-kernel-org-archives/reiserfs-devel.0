From: Oleg Drokin <green@namesys.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Fri, 14 Feb 2003 13:17:46 +0300
Message-ID: <20030214131746.H10351@namesys.com>
References: <3E4AA902.86F15815@interface-ag.com> <b2h7dc$ipp$1@satsuki.furryterror.org> <3E4C392A.2070909@namesys.com> <20030214111829.A21849@namesys.com> <20030214031316.L22930@schatzie.adilger.int>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12758-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030214031316.L22930@schatzie.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>, Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

Hello!

On Fri, Feb 14, 2003 at 03:13:16AM -0700, Andreas Dilger wrote:
> > Currently we panic if write to journal area fails. We report IO error to
> > userspace if non-journaled write fails it seems (I will check it again).
> I'm thinking "panic" isn't going to help the user's data any more than
> not commiting the change...  How about remount-ro, or have a mount option

SuSE people work on this.

> like ext3 "errors={panic,remount-ro,warning}"?  If you marked the filesystem
> and/or journal in error and mount read-only, and force a full fsck at
> reboot time at least the user has a chance - otherwise the node might
> just panic in a loop.

It hangs on panic ;) (because it does BUG() ), so no cyclical reboot.
There is even big chance that everything not touching problematic fs will
survive and continue to work.
Given that nobody runfs reiserfsck at boot, "full fsck" aproach won't work.
Ah, and reiserfsck ignores -a command line switch because
"we do not trust our fsck yet" (c) Hans.

Bye,
    Oleg
