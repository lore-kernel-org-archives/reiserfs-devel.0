From: Hans Reiser <reiser@namesys.com>
Subject: Re: some testing questions
Date: Tue, 15 Aug 2006 13:04:07 -0700
Message-ID: <44E228B7.10505@namesys.com>
References: <44DCC20C.7020400@email.si> <200608141615.58185.vs@namesys.com> <20060815142140.GA4247@kruemel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29599-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060815142140.GA4247@kruemel>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ingo Bormuth <ibormuth@efil.de>
Cc: reiserfs-list@namesys.com

Ingo Bormuth wrote:
>
>
> #df:
> /dev/hda8              6357768   3478716   2879052  55% /cache
>  
> Before doing so, the partition was >90% full. 
The performance difference between >90% full and 55% full will be large
on every filesystem.  When we ship a repacker, that will be less true,
because we will have large chunks of unused space after the repacker runs.

Oddly enough, I don't know the statistics for reiser* filesystems, but I
know that for FFS you should not let it become more than 85% full before
buying a new disk (or cleaning your home directory) if you want good
performance.
