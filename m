From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: rebuild-tree working for more then 3 days- what to do?
Date: Fri, 07 Jan 2005 13:20:55 +0300
Message-ID: <1105093253.3616.34.camel@tribesman.namesys.com>
References: <2AEAD962-6089-11D9-A3E5-003065C0167C@xslf.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23060-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2AEAD962-6089-11D9-A3E5-003065C0167C@xslf.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shoshannah Forbes <xslf@xslf.com>
Cc: reiserfs-list@namesys.com

Hello

On Fri, 2005-01-07 at 11:50, Shoshannah Forbes wrote:
> Hi all. Newbie here :-)
> Here is my problem:
> I have a Linux gentoo box with a 60GB HD using ReiserFS 3.6. Last 
> Sunday, I attempted to do an emerge sync (which is HD intensive), and 
> my system froze. After the 2nd time my system froze doing an emerge 
> sync, I booted without X and attempted again. This time, just before 
> the system froze, I got a panic error about trouble writing to the HD 
> (I didn't write it down, so I don't have the exact error message).
> 
> So I booted from a DSL CD which I had, and ran reiserfsck, whic 
> complained about a few problems. So I ran reiserfsck --fix-fixable, 
> which told me that there are problems that it will need to run 
> --rebuild-tree in order to fix.
> 
> I googled a bit, and as DSL has an old version of the reiserFS tools, I 
> went ahead, and using another machine downloaded the latest version of 
> knoppix, booted from it, and ran reiserfsck --rebuild-tree. I switched 
> to another desktop, but when I attempted to switch back to the original 
> one to see the progress, X didn't let me, so I left the reiserfsck 
> running, thinking that I would return to it when it will finish.
> After 3 days, the HD stopped making noise, but the HD light (and the 
> cdrom light, where knoppix is running from) are still on. 

Hmm, 3 days for 60gb? I believe something is wrong there.

I would move the problem hard disk to mashine which has (or can
download) latest reiserfsck
(http://thebsh.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.19.tar.gz),
make sure that it performs I/O of that disk decently (hdparm -t
/dev/problem-disk) and run reiserfsck --rebuild-tree for broken
filesystem there.

> The Machine 
> does answer pings, but still doesn't let me switch to the other 
> desktop, and CTRL+ALT+Fx doesn't switch out of X into a virtual 
> terminal.
> 
> So, I am wondering- what to do now? How to minimize (and hopefully fix) 
> any damage to that disk?
> 
> Thanks!
> 
> ---
> Shoshannah Forbes
> http://www.xslf.com
> 
> 

