From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: [reiserfs-dev] Re: [ANNOUNCE] reiser4 snaphots
Date: Thu, 7 Nov 2002 13:47:13 +0300
Message-ID: <15818.17585.789642.675479@laputa.namesys.com>
References: <9918235451.20021106132043@kgpa.ru>
	<20021107090256.GC11974@mrball.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11942-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021107090256.GC11974@mrball.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Todd Lyons <todd@mrball.net>
Cc: ReiserFS-List <reiserfs-list@namesys.com>

Todd Lyons writes:
 > Oleg O. Ossovitskii wanted us to know:
 > 
 > >BTW: is anywhere diff to apply Reiser4 to plain 2.5.x (not bk tree) or I have to made this
 > >manually (by hands)?
 > 
 > It applied for me to the 2.5.45 tree with only one reject, mm/swap.c.
 > It wants to add a #include, but what's there is not quite like what the
 > patch expects.  You'll actually have to add two lines, not just one.
 > 
 > Still compiling.  In the reiser4 code right now....well, it built and
 > linked.  That's a good sign.
 > 
 > Here are the .config settings that I used:
 > CONFIG_REISER4_FS=m
 > CONFIG_REISER4_CHECK=y
 > CONFIG_REISER4_DEBUG=y
 > CONFIG_REISER4_CHECK_STACK=y
 > CONFIG_REISER4_DEBUG_MODIFY=y
 > CONFIG_REISER4_DEBUG_MEMCPY=y
 > CONFIG_REISER4_DEBUG_NODE=y
 > CONFIG_REISER4_ZERO_NEW_NODE=y
 > CONFIG_REISER4_TRACE=y
 > CONFIG_REISER4_STATS=y
 > CONFIG_REISER4_DEBUG_OUTPUT=y
 > # CONFIG_REISER4_NOOPT is not set
 > 
 > Curious if anybody feels that I should have chosen different values for
 > any of the options.

Reasonable options for debugging. Will result in dead-slow reiser4 though.

Once you stop being able to tolerate it slowness, disable
CONFIG_REISER4_DEBUG_MODIFY and CONFIG_REISER4_CHECK_STACK.

 > -- 
 > Blue skies...		Todd
 > | Get a bigger hammer!   |  Normal?  Normal is a setting on       |
 > | http://www.mrball.net  |  my dryer.                             |
 > | http://faq.mrball.net  |     BayCon 2001 http://www.baycon.org  |
 >    Linux kernel 2.5.45   1 user,  load average: 1.19, 0.88, 0.40

Nikita.
