From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck "block is in the tree already" error
Date: Fri, 21 Mar 2003 20:14:29 +0300
Message-ID: <200303212014.29775.vitaly@namesys.com>
References: <1048266314.8146.18.camel@Thief>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-13324-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1048266314.8146.18.camel@Thief>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Malinovich <demonbane@the-love-shack.net>, reiserfs-list@namesys.com


Hi, 

On Friday 21 March 2003 20:05, Alex Malinovich wrote:
> I've been trying to rebuild the tree on a reiserfs partition that seems
> to have gotten corrupted during a resize operation. Unfortunately, I've
> gone from having one or two directories not accessible to having the
> whole partition not accessible now. Everything seems to go ok until pass
> 2. At this point I start getting this error:
>
> "do_pass_2: The block (4901823) is in the tree already. Should not
> happen."

It seems that reiserfsck was built on another computer, which has some 
other libs version, not statically. Would you try to rebuild it and try 
again.

-- 

Thanks,
Vitaly Fertman
