From: Hans Reiser <reiser@namesys.com>
Subject: Re: tail policy question
Date: Wed, 12 Nov 2003 04:56:38 -0800
Message-ID: <3FB22E06.9070500@namesys.com>
References: <Pine.GSO.4.58.0311121737100.9552@bingsun2.cc.binghamton.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16069-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.GSO.4.58.0311121737100.9552@bingsun2.cc.binghamton.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Zhihui Zhang <bf20761@binghamton.edu>
Cc: reiserfs-list@namesys.com, vs@namesys.com

Zhihui Zhang wrote:

>Hi,
>
>I spent a little time on Reiser4 tail code and was surprised to find out
>that the default policy given in reiser4.h is ALWAYS_TAIL_ID not
>DEFAULT_TAIL_ID.
>
>/* default tail policy plugin */
>#define REISER4_TAIL_PLUGIN       (ALWAYS_TAIL_ID)
>
>Does this mean Reiser4 always use tails no matter how large a file is by
>default?  I must be wrong somewhere.
>  
>
Umh,  we are often capable of incredible stupidity as a result of 
someone testing some setting and then checking it in by accident.  You 
want the default not the always.

>Anyway, when tails are in use, will they incur more or less performance
>penalty on files using them when compared to ReiserFS V3 (remember that
>-notail mount option is sometimes preferred)? 
>
It is not nearly that bad, but you want the default.

I'll let Saveliev comment further.   Thanks for finding this.


-- 
Hans


