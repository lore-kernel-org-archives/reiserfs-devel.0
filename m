From: Chris Mason <mason@suse.com>
Subject: Re: 2.4.20 at kernel.org and data logging
Date: 18 Jan 2003 10:57:11 -0500
Message-ID: <1042905430.31095.2343.camel@tiny.suse.com>
References: <0E18D85A21D2874080456C3B8A12E83E01009FAD@cof110avexu4.global.avaya.com>
	 <200301181125.16752.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12436-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200301181125.16752.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Russell Coker <russell@coker.com.au>
Cc: "Sewell, Cassandra D   (Cassandra)" <csewell@avaya.com>, reiserfs-list@namesys.com

On Sat, 2003-01-18 at 05:25, Russell Coker wrote:
> On Fri, 17 Jan 2003 00:51, Sewell, Cassandra D (Cassandra) wrote:
> > Is the data logging patch for 2.4.20 kernel considered
> > complete?  I see a patch at
> > ftp.suse.com/pub/people/mason/patches/data-logging/2.4.20.  Also will this
> > patch be considered working for the last stable 2.4.20 posted at the
> > kernel.org location?
> >
> > I am in the process of upgrading some machines from 2.2.x (I know way
> > overdue), and need the data-logging capability.
> 
> I am using those patches on some 2.4.20 machines running as Qmail mail 
> servers.  I have the /var file system mounted with data journalling.
> 
> I have 4 machines running each with >250,000 mail boxes with continual heavy 
> IO load (the load never goes below 100 disk writes per second).
> 
> I found the benefit to be much smaller than I had hoped.  The patches in 
> question have a number of other performance improvements which made a huge 
> and noticable difference.  data=journal seemed to make a small difference, 
> but nothing exciting.

The benefit from data=journal varies largely by the size of the files in
use.  But Russell, you might be hitting other bottlenecks having to do
with reading the directory items off disk (that many directories means
lots of inode).  

Also, we should probably try switching you to a highmem io enabled
kernel, I'm almost done with a patch to put the 2.4.21 data logging code
in the -aa kernel.

-chris


