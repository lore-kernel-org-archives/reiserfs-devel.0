From: Chris Mason <mason@suse.com>
Subject: Re: precise characterization of ext3 atomicity
Date: 05 Sep 2003 09:47:20 -0400
Message-ID: <1062769640.31951.209.camel@tiny.suse.com>
References: <3F574A49.7040900@namesys.com>
	 <20030904085537.78c251b3.akpm@osdl.org> <3F576176.3010202@namesys.com>
	 <20030904091256.1dca14a5.akpm@osdl.org> <3F57676E.7010804@namesys.com>
	 <20030904181540.GC13676@matchmail.com> <3F578656.60005@namesys.com>
	 <20030904132804.D15623@schatzie.adilger.int> <3F57AF79.1040702@namesys.com>
	 <20030904160344.E15623@schatzie.adilger.int>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15576-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030904160344.E15623@schatzie.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Dilger <adilger@clusterfs.com>
Cc: Hans Reiser <reiser@namesys.com>, Mike Fedyk <mfedyk@matchmail.com>, Andrew Morton <akpm@osdl.org>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

On Thu, 2003-09-04 at 18:03, Andreas Dilger wrote:
> On Sep 05, 2003  01:32 +0400, Hans Reiser wrote:
> > Andreas Dilger wrote:
> > >It is possible to do the same with ext3, namely exporting journal_start()
> > >and journal_stop() (or some interface to them) to userspace so the application
> > >can start a transaction for multiple operations.  We had discussed this in
> > >the past, but decided not to do so because user applications can screw up in
> > >so many ways, and if an application uses these interfaces it is possible to
> > >deadlock the entire filesystem if the application isn't well behaved.
> >
> > That's why we confine it to a (finite #defined number) set of 
> > operations within one sys_reiser4 call.  At some point we will allow 
> > trusted user space processes to span multiple system calls (mail server 
> > applicances, database appliances, etc., might find this useful).  You 
> > might consider supporting sys_reiser4 at some point.

Please rename sys_reiser4 if you want it to be a generic use syscall ;-)

-chris


