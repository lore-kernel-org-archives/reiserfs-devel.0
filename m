From: Soeren Sonnenburg <reiserfs@nn7.de>
Subject: Re: nfsd-fh: found a name that I didn't expect
Date: 29 Mar 2003 19:45:34 +0100
Message-ID: <1048963534.2888.24.camel@fortknox>
References: <200303281828.55093.bernd-schubert@web.de>
	 <200303291509.23681.bernd-schubert@web.de>
	 <20030329171321.A15899@namesys.com>
	 <200303291606.54910.bernd-schubert@web.de>
	 <20030329203711.A16762@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13439-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030329203711.A16762@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Bernd Schubert <bernd-schubert@web.de>, reiserfs-list@namesys.com

On Sat, 2003-03-29 at 18:37, Oleg Drokin wrote:
> Hello!
> 
> On Sat, Mar 29, 2003 at 04:06:54PM +0100, Bernd Schubert wrote:
> > > The problems seems to have something to do with strange dentries appearing
> > > in dentry cache, also you have verified that this is not because of fs
> > > error.
> > > What kernel are you running?
> > 2.4.20 with the ptrace patch.
> 
> Ok.

here it is 2.4.20 with ext3 umount patch.

> > > I think may be race with iget4 might cause this, but I am not sure.
> > > We have a patch for this iget4 race, and if you are willing to test it, I
> > > can send it to you.
> > Yes of course I am. I hope the other admins won't kill me, but I guess they 
> > know that I willing to do experiments from time to time ;-)
> > Could something worse happen when I try the patch, that could not be fixed by 
> > simple rebooting ?
> 
> See the patch below.
> It should not break anything.

Well, we keep getting this error in massess too... and in our case it is
very likely that clients access the same file from all the clients...

However I cannot quickly test that atm but if it is really safe I might
test it next week.

Soeren.

