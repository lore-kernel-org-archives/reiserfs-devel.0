From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Reiserfs Data Recovery
Date: Tue, 9 Mar 2004 12:28:19 +0300
Message-ID: <200403091228.19775.vitaly@namesys.com>
References: <404C81B9.4050504@nsanity.com> <20040308155913.123967b7@philou.gramoulle.local> <404C9A07.3060904@nsanity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17134-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <404C9A07.3060904@nsanity.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nick Vahalik <nick@nsanity.com>
Cc: reiserfs-list@namesys.com

Hello Nick,

On Monday 08 March 2004 19:06, Nick Vahalik wrote:
> Hello again,
>
> Okay, I updated reiserfsprogs and this is what I got:
>
> 0%....20%....40%....60%....80%....100%                       left 0,
> 15217 /sec
>         "r5" hash is selected
> Flushing..finished
>         Read blocks (but not data blocks) 38667613
>                 Leaves among those 56652
>                         - corrected leaves 2500
>                         - leaves all contents of which could not be
> saved and de leted 26
>                 pointers in indirect items to wrong area 5332 (zeroed)
>                 Objectids found 116644
>
> Pass 1 (will try to insert 56626 leaves):
> Looking for allocable blocks .. finished
> 0%pass1.c 408 pass1_correct_leaf                             left 56623,
> 3 /sec
> pass1_correct_leaf: block 65604, item 0, pointer 1: The wrong pointer
> (379082642 5) in the file [50696 50697]. Must be fixed on pass0.
> Aborted

When such things happen especially in different places of the 
tree at every fsck run this often indicates some hardware problem.
I would check the memory with memtest first.

-- 
Thanks,
Vitaly Fertman


