From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: nfsd-fh: found a name that I didn't expect
Date: Sat, 29 Mar 2003 16:06:54 +0100
Message-ID: <200303291606.54910.bernd-schubert@web.de>
References: <200303281828.55093.bernd-schubert@web.de> <200303291509.23681.bernd-schubert@web.de> <20030329171321.A15899@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13433-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030329171321.A15899@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Hello,

> > As noted in my other e-email, /usr/sbin/logrotate was also affected. I
> > don't like it to say, but after rebooting everything was fine, so those
> > messages doesn't  appear any longer.
> > Does this mean memory problems again ? We even have loaded the
>
> Not likely.

The first good message this day! :) I was really worried again.

>
> The problems seems to have something to do with strange dentries appearing
> in dentry cache, also you have verified that this is not because of fs
> error.
> What kernel are you running?

2.4.20 with the ptrace patch.

> I think may be race with iget4 might cause this, but I am not sure.
> We have a patch for this iget4 race, and if you are willing to test it, I
> can send it to you.

Yes of course I am. I hope the other admins won't kill me, but I guess they 
know that I willing to do experiments from time to time ;-)
Could something worse happen when I try the patch, that could not be fixed by 
simple rebooting ?

The problems is to detect if this is really caused by this race. Since I still 
don't know a way how to reliable trigger this and  even a reboot can fix it, 
it is difficult to get to know if the patch would be really helpful. 
Do you see a way  to enable your patch via proc interface ? So I could try to 
reboot the server and run 'find /' on the client as loop until the problem 
occurs. When I see the problem, I could enable it via proc and check if it 
works.

Update: While I was writing and thinking about how to trigger it, I just again 
saw the problem for /usr/bin/uptime and another file and again a reboot could 
fix it for those files.


Thanks a lot for your help,
	Bernd

