From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Fri, 14 Feb 2003 03:13:16 -0700
Message-ID: <20030214031316.L22930@schatzie.adilger.int>
References: <3E4AA902.86F15815@interface-ag.com> <b2h7dc$ipp$1@satsuki.furryterror.org> <3E4C392A.2070909@namesys.com> <20030214111829.A21849@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12757-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030214111829.A21849@namesys.com>; from green@namesys.com on Fri, Feb 14, 2003 at 11:18:29AM +0300
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Hans Reiser <reiser@namesys.com>, Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

On Feb 14, 2003  11:18 +0300, Oleg Drokin wrote:
> Currently we panic if write to journal area fails. We report IO error to
> userspace if non-journaled write fails it seems (I will check it again).

I'm thinking "panic" isn't going to help the user's data any more than
not commiting the change...  How about remount-ro, or have a mount option
like ext3 "errors={panic,remount-ro,warning}"?  If you marked the filesystem
and/or journal in error and mount read-only, and force a full fsck at
reboot time at least the user has a chance - otherwise the node might
just panic in a loop.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

