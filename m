From: Oleg Drokin <green@namesys.com>
Subject: Re: nfsd-fh: found a name that I didn't expect
Date: Sat, 29 Mar 2003 17:13:21 +0300
Message-ID: <20030329171321.A15899@namesys.com>
References: <200303281828.55093.bernd-schubert@web.de> <200303291254.02498.bernd-schubert@web.de> <20030329145920.B28628@namesys.com> <200303291509.23681.bernd-schubert@web.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13432-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200303291509.23681.bernd-schubert@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Schubert <bernd-schubert@web.de>
Cc: reiserfs-list@namesys.com

Hello!

On Sat, Mar 29, 2003 at 03:09:23PM +0100, Bernd Schubert wrote:
> > Ok, let us know of the results.
> As I expected, 'reiserfsck --check' didn't find any problems.

Ok.

> As noted in my other e-email, /usr/sbin/logrotate was also affected. I don't 
> like it to say, but after rebooting everything was fine, so those messages 
> doesn't  appear any longer. 
> Does this mean memory problems again ? We even have loaded the 

Not likely.

> ecc-kernel-module since last week, to be able to problems befor the 
> filesystem is affected, but it didn't show any memory-problem on this 
> machine.
> Or could it be that we have 3GB RAM and the vanilla kernel is not suitable for 
> this (I read something like this in the LKML, but can't remember the 
> details).

The problems seems to have something to do with strange dentries appearing in dentry cache,
also you have verified that this is not because of fs error.
What kernel are you running?
I think may be race with iget4 might cause this, but I am not sure.
We have a patch for this iget4 race, and if you are willing to test it, I can
send it to you.

Bye,
    Oleg
