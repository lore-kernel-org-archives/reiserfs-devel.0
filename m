From: Chris Mason <mason@suse.com>
Subject: Re: Feature request: online fsync disable
Date: 24 Aug 2002 15:15:21 -0400
Message-ID: <1030216521.17780.83.camel@tiny>
References: <3D661C89.C8A805D7@baldauf.org>
	<15718.8710.244926.960377@laputa.namesys.com>
	<20020823155658.A962@namesys.com> <3D6623BE.4040500@namesys.com> 
	<15718.9718.736822.978374@laputa.namesys.com>
	<1030108119.17778.8.camel@tiny>  <3D667A7D.5BD60783@baldauf.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11316-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D667A7D.5BD60783@baldauf.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Xuan Baldauf <xuan--reiserfs@baldauf.org>
Cc: Nikita Danilov <Nikita@namesys.com>, Hans Reiser <reiser@namesys.com>, Oleg Drokin <green@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>, zam@thebsh.namesys.com

On Fri, 2002-08-23 at 14:10, Xuan Baldauf wrote:

> > Xuan, you could try the data logging patches in either data=writeback or
> > data=journal.  Either one will be significantly faster than stock
> > 2.4.19.
> 
> Thank you. I guess "data=writeback" will result in the desired behaviour.
> 
> Are these patches tested?

Yes, although I've now got 3 or 4 bug fixes from testing in the suse
kernel that I need to put into the pure 2.4.19 patch.  I'm doing the
last of the fixes today, and I'll start merging back into the main code
on monday.  This was all supposed to happen last week, but I got
diverted by some important other suse work.

If your application is very fsync heavy and doesn't do many non-fsync
writes data=journal will probably be much faster.

-chris


