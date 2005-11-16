From: David Masover <ninja@slaphack.com>
Subject: Re: More Slowdown
Date: Tue, 15 Nov 2005 18:45:15 -0600
Message-ID: <437A811B.5000509@slaphack.com>
References: <1132093347.6347.7.camel@bauerbob.hirsch.lan>	 <437A674E.2060407@ursynow.2a.pl>	 <8e021e1b0511151509k3e77cdd9qaec7698a2fa00e48@mail.gmail.com>	 <3aa654a40511151513y2285b55aj2d749551a67492a2@mail.gmail.com> <1132098269.7652.6.camel@teratron.lan.etheus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26955-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1132098269.7652.6.camel@teratron.lan.etheus.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Craig Shelley <craig@microtron.org.uk>
Cc: reiserfs-list@namesys.com

Craig Shelley wrote:
> On Tue, 2005-11-15 at 15:13 -0800, Avuton Olrich wrote:
> 
>>It's funny that you mention vim. vim seems to be what _really_ makes
>>my reiser4 do the 'slowdown'. I call it harddrive thrashing cause
>>that's what my wife calls it when she hears it from 5 yards away :)
>>Right before saving or saving/exiting it really does this thrashing,
>>Thank god you said this because I didn't think this 'slowdown' was the
>>same thing I was experiencing.
> 
> 
> This looks to be a similar thing with fsync(). It took approx 10 sec to
> save a file containing the string "Hello World" 
> The results indicate that the time was spent in the fsync() call.

I got sick of waiting for it and nuked the fsync call.  All my kernels
have a custom patch such that sys_fsync just returns true, no matter what.

Why?

Because vim shouldn't fsync, and neither should Evolution.  It's been so
abused that I prefer to just manually run "sync" when I want something
flushed.

Even if fysnc was fast (only flushing the file that needed to flush),
that kind of abuse -- resizing a column -- kind of kills any advantage
of lazy writes.

