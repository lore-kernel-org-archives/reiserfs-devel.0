From: Soeren Sonnenburg <reiserfs@nn7.de>
Subject: Re: trouble with reiserfs on ppc vs-3050:
	wait_buffer_until_released ...
Date: 28 Apr 2003 21:54:44 +0200
Message-ID: <1051559684.10360.13.camel@localhost>
References: <1051258287.5564.1.camel@fortknox>
	 <1051259723.3513.7.camel@localhost> <20030425084742.GA22827@namesys.com>
	 <1051261556.3513.31.camel@localhost> <20030425091916.GG10802@namesys.com>
	 <1051263219.1642.10.camel@localhost> <20030425094630.GH10802@namesys.com>
	 <1051265575.1656.37.camel@localhost> <20030425102812.GA24352@namesys.com>
	 <1051397193.1232.4.camel@localhost>  <20030428051858.GA22805@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13881-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030428051858.GA22805@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Mon, 2003-04-28 at 07:18, Oleg Drokin wrote:
> Hello!
> 
> On Sun, Apr 27, 2003 at 12:46:53AM +0200, Soeren Sonnenburg wrote:
> 
> > > Ok, is this a new box? any chance to check if the memory is right?
> > ok, so I ran the memtest tool for a night without it finding any
> > errors... I did a full compare (not only md5sums) over network with the
> > files I have on disk... they were the same... I let bonnie run and
> > checked for corruption... nothing ... 
> > Looks like all I can do is keeping an eye on it.
> 
> Hm, and given there was another report like this recently, it seems like
> some reiserfs problem :(
> Unfortunatelly we don't even have PPC (or other bigendian) hardware to test on.

so it seems all I can do is check the fs much more regularly and see
whether I observe some corruption again...

if the problem occurs again do you have an idea how to track it down ?

Soeren (who is hoping to not see this message again).

