From: Oleg Drokin <green@namesys.com>
Subject: Re: nfsd-fh: found a name that I didn't expect
Date: Mon, 31 Mar 2003 12:37:05 +0400
Message-ID: <20030331123705.F25533@namesys.com>
References: <200303281828.55093.bernd-schubert@web.de> <200303291509.23681.bernd-schubert@web.de> <20030329171321.A15899@namesys.com> <200303291606.54910.bernd-schubert@web.de> <20030329203711.A16762@namesys.com> <1048963534.2888.24.camel@fortknox>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13460-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1048963534.2888.24.camel@fortknox>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Soeren Sonnenburg <reiserfs@nn7.de>
Cc: reiserfs-list@namesys.com

Hello!

On Sat, Mar 29, 2003 at 07:45:34PM +0100, Soeren Sonnenburg wrote:
> > > > I think may be race with iget4 might cause this, but I am not sure.
> > > > We have a patch for this iget4 race, and if you are willing to test it, I
> > > > can send it to you.
> > > Yes of course I am. I hope the other admins won't kill me, but I guess they 
> > > know that I willing to do experiments from time to time ;-)
> > > Could something worse happen when I try the patch, that could not be fixed by 
> > > simple rebooting ?
> > See the patch below.
> > It should not break anything.
> Well, we keep getting this error in massess too... and in our case it is
> very likely that clients access the same file from all the clients...

Are all of your NFS exports where these errors happens reiserfs?

> However I cannot quickly test that atm but if it is really safe I might
> test it next week.

Well, there is a problem reported with that 2.4.20 backport, that I am going to look into.
If you can try 2.4.21-pre6 with iget5_locked.diff (I just sent to the list in this same
thread) that would be great.

Thank you.

Bye,
    Oleg
