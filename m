From: Chris Mason <mason@suse.com>
Subject: Re: Reiserfs concurrent write problems
Date: Fri, 30 Apr 2004 16:24:10 -0400
Message-ID: <1083356649.30344.479.camel@watt.suse.com>
References: <20040426172648.GA22918@em.ca>
	 <1083000970.30344.50.camel@watt.suse.com> <20040427161544.GA27873@em.ca>
	 <1083088841.30344.131.camel@watt.suse.com>  <20040430195405.GB23648@em.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18337-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040430195405.GB23648@em.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bruce Guenter <lists-reiserfs-list@bruce-guenter.dyndns.org>
Cc: reiserfs-list@namesys.com

On Fri, 2004-04-30 at 15:54, Bruce Guenter wrote:
> On Tue, Apr 27, 2004 at 02:00:41PM -0400, Chris Mason wrote:
> > Good to hear, could I trouble you to ping me (or better yet
> > reiserfs-list) when you have the graphs updated?
> 
> I've updated the benchmarking web page to include the new results from
> the 2.6.6-rc2-mm2 kernel:
> 	http://untroubled.org/benchmarking/2004-04/

Thanks.  One thing I didn't notice before:

Filesystem partition: 72GB on a software RAID-1 array of Fujitsu SCSI
15kRPM disks. 

Journal partition: 400MB on a software RAID-1 array of Quantum Atlas 10K
SCSI disks. 

So the external log is on slower disks?  That might explain why it is
sometimes slower to have reiserfs on the external log.

-chris


