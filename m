From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: BUG: Python and reiser4 2.6.23 (and 22+patches I was testing)
Date: Mon, 10 Dec 2007 16:22:16 +0300
Message-ID: <475D3D88.3040309@gmail.com>
References: <20071210105822.GA7887@rvalles.homedns.org.>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20071210105822.GA7887@rvalles.homedns.org.>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: rvalles <rvalles@es.gnu.org>
Cc: reiserfs-devel@vger.kernel.org

rvalles wrote:

>Hi Edward.
>
>Since a week or two ago, I've been unable to upgrade my gentoo in the
>old desktop, the machine where I have reiser4 with ccreg... up until
>today, I had thought it was some broken upgrade (I use gentoo testing)
>or something, and didn't care much, thinking "I'll fix that eventually".
>
>Today, some sentence at the irc room by <dusanc> struck me:
>
>"does anyone have any idea if reiser4 could break python for me? When I
>switch from 2.6.22 to 2.6.23 or 2.6.24-rc2-mm1 python scripts just exit
>to python prompt >>>, and when I switch back everything works OK. SAme
>config was used."
>  
>

So we can see that Dushan encountered this problem in
2.6.24-rc2-mm1, which doesn't contain new reiser4 stuff
(like vfs-fixup and discard-entd patches).

It seems that bisecting search is the most reasonable way
to find the problem. It can be a changeset which reveals
some obscured bug in reiser4 like this one:
http://lkml.org/lkml/2007/9/28/218

Thanks,
Edward.

>Which is exactly the same problem I'm suffering. (I run emerge and get a
>  
>
>>>>prompt)
>>>>        
>>>>
>
>So, since my 2.6.22.14 had patches from you:
>- reiser4-vfs-fixup.patch
>- reiser4-2.6.22-discard-entd.patch
>
>I thought it might be related to those. Indeed, it is. I boot my
>previous 2.6.22, which has a plain reiserfs-2.6.22-2, and the problem
>dissapears, so it _must_ be due to one of those two patches (which I
>believe you merged into the later 2.6.23 and mm patches, which dusanc is
>using).
>
>Just do doublecheck, I booted the problematic kernel again, and tried
>"emerge" again, getting a >>> prompt... and then I looked at dmesg, it
>seems this bug causes no log output.
>
>This is the forum thread in Gentoo that I opened back when I first had
>the problem:
>http://forums.gentoo.org/viewtopic-t-622022.html
>
>At least now we know it's somehow related to one of those two patches.
>
>Feel free to contact me for any testing needs.
>  
>

