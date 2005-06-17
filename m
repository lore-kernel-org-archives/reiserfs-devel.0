From: "E.Gryaznova" <grev@namesys.com>
Subject: Re: hard hang with reiser4-for-2.6.11-5 and VMware Workstation 5.0
Date: Fri, 17 Jun 2005 21:30:40 +0400
Message-ID: <42B308C0.4050807@namesys.com>
References: <20050617170514.23193.qmail@web53908.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24403-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050617170514.23193.qmail@web53908.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: scott <scottfk@yahoo.com>
Cc: reiserfs-list@namesys.com

Hello.

Thank you for the report.

VMWare/reiser4 is known problem, we can reproduce it.  But unfortunately 
I can't  estimate when this will be fixed.
Reiser4 format was changed in reiser4-5 patch for 2.6.11, reiser4progs 
for this format are not ready yet.

Thanks,
Lena

scott wrote:

>Greetings,
>
>I have been using Reiser4 as my primary filesystem for
>some time now, and for the first time have encountered
>a problem that keeps me from doing what I want to do.
>
>I run VMware Workstation 5.0 with the virtual disk
>files on my Reiser4 / partition, which happens to be a
>Linux md RAID1 device.  The other day I built a new
>kernel, upgrading to the -5 release of the reiser4
>patches.  Either during boot or shortly after boot of
>any guest OS, my workstation becomes totally
>unresponsive.  Magic SysRq keys don't even work.
>  
>

>To narrow down the source of the problem, I applied
>the Reiser4 patch to a vanilla 2.6.11 kernel tree.  I
>saw the exact same issue.
>
>I tried reverting to a previous version of the Reiser4
>patch, but I get VFS errors about being unable to find
>a Reiser4 filesystem on my rootdisk using any other
>Reiser4 patchset.  Did the filesystem format change?
>  
>

>I tried recompiling the -5 release with debug enabled,
>but since the machine is unresponsive, I don't see any
>output.
>
>My question...  is this a known issue?  Or should I
>just keep pounding away at this until I can get some
>sort of debugging information?
>
>Thanks to you all for the always-interesting
>discussion threads on this list.  And thanks, Hans,
>for reiserfs and reiser4.
>
>be seeing you.
>
>scott
>
>
>		
>____________________________________________________ 
>Yahoo! Sports 
>Rekindle the Rivalries. Sign up for Fantasy Football 
>http://football.fantasysports.yahoo.com
>
>
>  
>


