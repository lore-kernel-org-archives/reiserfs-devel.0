From: jlewis@lewis.org
Subject: Re: reiserfs rebuild-tree time?
Date: Sun, 14 Mar 2004 01:14:36 -0500 (EST)
Message-ID: <Pine.LNX.4.58.0403140108560.1969@web1.mmaero.com>
References: <Pine.LNX.4.58.0403110111490.1969@web1.mmaero.com>
 <Pine.LNX.4.58.0403110848380.1969@web1.mmaero.com>
 <1079014534.9475.265.camel@tribesman.namesys.com> <200403111839.49951.vitaly@namesys.com>
 <Pine.LNX.4.58.0403131921140.1969@web1.mmaero.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17201-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0403131921140.1969@web1.mmaero.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com

This finally finished after a little more than 30 hours.  AFAICT, the
filesystem is intact...only 2 dirs and a handful of files got moved to
lost+found.  The maildir reiserfsck was spending so much time in (making
me think it was stuck) has 3742463 files (unread messages) in it.


 On Sat, 13 Mar 2004 jlewis@lewis.org wrote:

> Maybe there's no problem.  I've been running
> reiserfsck --rebuild-tree -l /var/tmp/fsck.log2 -q -n /dev/sdb2
> for about 27 hours now, and it's finally made it a bit further:
>
> Pass 1 (will try to insert 2473256 leaves):
> Looking for allocable blocks .. finished
> 0%....20%....40%....60%....80%....100%
> Flushing..finished
>         2473256 leaves read
>                 2462276 inserted
>                         - pointers in indirect items pointing to metadata
> 76 (zeroed)
>                 10980 not inserted
>         non-unique pointers in indirect items (zeroed) 142
>
> Pass 2:
> 0%....20%....40%....60%....80%....100%
> Flushing..finished
>         Leaves inserted item by item 10980
> Pass 3 (semantic):
> Flushing..finished
>         Files found: 5390892
>         Directories found: 244401
>         Symlinks found: 1494
>         Names pointing to nowhere (removed): 10
> Pass 3a (looking for lost dir/files):
> Looking for lost directories:
>
> "Pass 3 (semantic):" is as far as I'd seen it get previously.  Maybe it
> just needs time?...like a few days?
>
> ----------------------------------------------------------------------
>  Jon Lewis *jlewis@lewis.org*|  I route
>  Senior Network Engineer     |  therefore you are
>  Atlantic Net                |
> _________ http://www.lewis.org/~jlewis/pgp for PGP public key_________
>

----------------------------------------------------------------------
 Jon Lewis *jlewis@lewis.org*|  I route
 Senior Network Engineer     |  therefore you are
 Atlantic Net                |
_________ http://www.lewis.org/~jlewis/pgp for PGP public key_________
