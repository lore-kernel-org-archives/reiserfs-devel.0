From: Hans Reiser <reiser@namesys.com>
Subject: Re: Encouraged or discouraged? Object database directly
 on reiserfs
Date: Fri, 18 Oct 2002 19:07:08 +0400
Message-ID: <3DB0239C.2050409@namesys.com>
References: <00ac01c276a9$463934e0$6400a8c0@twister>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11723-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Szabolcs Szasz <sz@szasz.hu>
Cc: reiserfs-list@namesys.com

Szabolcs Szasz wrote:

>Hi,
>
>I'm creating an OODB for use by ISPs. Now for the prototype 
>I use plain filesystem storage, object properties (names, phone 
>numbers, URLs etc.) are all stored in multitudes of very small 
>files, collected into large directories and there are symlinks all 
>over the place...
>
>For any "classical" filesystems this is clearly a horrible abuse...
>
>It may be for the current reiserfs level, too, but much less.
>
Take a look at reiser4 next week, it will get a bit easier.

>
>Considering the future (and remembering the Vision doc. at
>Namesys), is it encouraged or discouraged to continue the
>OODB implementation atop the native filesystem storage?
>(Speed is important, but not the primary concern. Unconstrained,
>solid and versatile data accessibilty beats it --  that's why the 
>fs storage rather than adding a DBMS engine.)
>
>Thanks very much,
>Sab
>
>
>
>  
>
Is it a GPL OODB?

If it is a GPL OODB, we encourage you to do it, we'll answere your 
questions and be helpful, but we will try to obsolete you someday.

If it is not a GPL OODB, you might consider forming a commercial 
relationship with us.

Hans

