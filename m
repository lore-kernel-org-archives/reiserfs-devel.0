From: Hans Reiser <reiser@namesys.com>
Subject: Re: fsync() Performance Issue
Date: Mon, 29 Apr 2002 22:56:15 +0400
Message-ID: <3CCD974F.70002@namesys.com>
References: <93F527C91A6ED411AFE10050040665D0049BF961@corpusmx1.us.dg.com> <20020429162020.92AD93EA8@lyta.coker.com.au> <6tsqcu0887p2396p14cn2krqrhh1o0dhfk@4ax.com>            <m3adrmz8us.fsf@merlin.emma.line.org> <200204291858.g3TIw8Qn009356@foo-bar-baz.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10202-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Valdis.Kletnieks@vt.edu
Cc: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>, reiserfs-list@namesys.com

Valdis.Kletnieks@vt.edu wrote:

>On Mon, 29 Apr 2002 19:56:59 +0200, Matthias Andree <ma@dt.e-technik.uni-dortmund.de>  said:
>
>  
>
>>Barring write cache effects, fsync() only returns after all blocks are
>>on disk. While I'm not sure if and if yes, which, Linux file systems are
>>affected, but for portable applications, be aware that sync() may return
>>prematurely (and is allowed to!).
>>    
>>
>
>And in fact is the reason for the old "recipe":
>  # sync
>  # sync
>  # sync
>  # reboot
>
>On the older Vax 750-class machines, sync could return LONG before the blocks
>were all flushed - the second 2 sync's were so you were busy typing for
>several seconds while the disks whirred.  Failure to understand the typing
>speed issue has lead at least one otherwise-clued author to recommend:
>  # sync;sync;sync
>  # reboot
>
>(the distinction being obvious if you think about when the shell reads the
>commands, and when it does the fork/exec for each case....)
>
>  
>
Finally I understand this.  Doing more than one sync always seemed 
mysterious to me.;-)

Thanks Matthias.

Hans

