From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: nfsd-fh: found a name that I didn't expect
Date: Mon, 31 Mar 2003 12:49:33 +0200
Message-ID: <200303311249.33139.bernd-schubert@web.de>
References: <200303281828.55093.bernd-schubert@web.de> <200303301708.11703.bernd-schubert@web.de> <20030331142406.Q25533@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13479-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030331142406.Q25533@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>, reiserfs@nn7.de
Cc: reiserfs-list@namesys.com

On Monday 31 March 2003 12:24, Oleg Drokin wrote:

Hello Oleg!

>
> On Sun, Mar 30, 2003 at 04:08:11PM +0100, Bernd Schubert wrote:
> > Anyway I also tested the kernel-patch, but it causes problems with mounts
> > from another nfs-server. Well, mounting works fine, but e.g. running 'ls
>
> Ah, stupid me.
> I have another patch that we created before iget5_locked backport.
> It's a bit of hack to beat the race, but it works (fixes the race).
> It does not touch any code outside of reiserfs.
> So if you apply that to 2.4.20 and see if you still can see the NFS problem
> over time...
> Patch is below.


Thanks a lot for both new patches, I will try them as soon as possible, though 
it is usually more difficult to reboot during the week (so it may become the 
next weekend, before I can try it). Anyway I will also try it on our data 
server, where we also see those messages from time to time, even without 
rebooting.


Best regards,
	Bernd

