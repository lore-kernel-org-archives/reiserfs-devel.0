From: Jake Maciejewski <maciejej@msoe.edu>
Subject: Re: making reiser4/AMD64 hardlock
Date: Thu, 04 Nov 2004 23:41:52 -0600
Message-ID: <1099633312.8062.20.camel@localhost>
References: <1099472359.8158.36.camel@localhost>
	 <20041103201825.GY30438@hvs.envisage.co.za>
	 <1099561964.1492.20.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22279-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1099561964.1492.20.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

OK, I have some results for you at
http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/11-04-04

all-R4 contains the results of running both make and dd on one reiser4
filesystem. R3-R4 is make on reiser4 and dd on reiserFS. The same
assertion fails in both cases, making me even more curious why reiser4
cares that dd is running on a different filesystem.

I don't get complete crashes when not in X, but the system requires a
reboot because umount fails, ps hangs, etc.

Enabling assertions caused log output that I wasn't getting otherwise.
In both cases the reiser4 filesystem suffered corruption but fsck seemed
to fix it.

Other Gentoo users are using my reiser4 patch on x86 and I haven't heard
of any problems yet. You can find it at
patches/reiser4_from_2.6.9-mm1_for_2.6.9.patch.bz2

> Please try to get as much debugging information as you can.
> sysrq+t's output may help to understand the problem. Do you have "File
> systems" -> "Reiser4" -> "Enable reiser4 debug options" -> "Assertions"
> turned on? If no, please turn it, it may also help. Try to catch its
> output, via serial console if it will not be stored in logs.

-- 
Jake Maciejewski <maciejej@msoe.edu>

