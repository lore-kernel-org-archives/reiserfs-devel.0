From: Oleg Drokin <green@namesys.com>
Subject: Re: trouble with reiserfs on ppc vs-3050: wait_buffer_until_released ...
Date: Tue, 29 Apr 2003 09:21:17 +0400
Message-ID: <20030429052117.GG1231@namesys.com>
References: <20030425084742.GA22827@namesys.com> <1051261556.3513.31.camel@localhost> <20030425091916.GG10802@namesys.com> <1051263219.1642.10.camel@localhost> <20030425094630.GH10802@namesys.com> <1051265575.1656.37.camel@localhost> <20030425102812.GA24352@namesys.com> <1051397193.1232.4.camel@localhost> <20030428051858.GA22805@namesys.com> <1051559684.10360.13.camel@localhost>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13889-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1051559684.10360.13.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Soeren Sonnenburg <reiserfs@nn7.de>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Apr 28, 2003 at 09:54:44PM +0200, Soeren Sonnenburg wrote:
> > > errors... I did a full compare (not only md5sums) over network with the
> > > files I have on disk... they were the same... I let bonnie run and
> > > checked for corruption... nothing ... 
> > > Looks like all I can do is keeping an eye on it.
> > Hm, and given there was another report like this recently, it seems like
> > some reiserfs problem :(
> > Unfortunatelly we don't even have PPC (or other bigendian) hardware to test on.
> so it seems all I can do is check the fs much more regularly and see
> whether I observe some corruption again...

Probably so.

> if the problem occurs again do you have an idea how to track it down ?

Well, if you'd have fs in some predefined state (metadata snapshot of that state),
then there is sequence of actions you do that ultimately leads to corruption,
that would be the best possible case for debugging.
Well, if we assume this is endianness issue, you will probably see some corruptions after
writieng say 1-2 gigabytes to the FS. Can you try that? I mean mount the fs, write
to it, unmount, run reiserfsck --check to see if there are any bitmap mismatches.
If there are, try to mount with alloc=preallocmin=16 and see if that changes anything.

Bye,
    Oleg
