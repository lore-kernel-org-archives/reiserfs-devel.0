From: Oleg Drokin <green@namesys.com>
Subject: Re: Problem with Kernel 2.4.19, reiser on sw-raid5 and rsync
Date: Wed, 5 Mar 2003 17:51:26 +0300
Message-ID: <20030305175125.B32481@namesys.com>
References: <833151992.20030305132356@edo.uni-dortmund.de> <20030305172029.A32305@namesys.com> <1046875400.2163.253.camel@tiny.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13072-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1046875400.2163.253.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: Oliver Heering <Heering@edo.uni-dortmund.de>, reiserfs-list@namesys.com

Hello!

On Wed, Mar 05, 2003 at 09:43:20AM -0500, Chris Mason wrote:
> > I suppose this is 2.4.19 shipped with SuSE? Is this the last version available from SuSE?
> > This is SuSE 8.1, I presume?
> > (and rpm -qa | grep k_i386 output please)
> > > kernel: Modules: [(reiserfs:<c1dc0060>:<c1def390>)]
> > The decoded output is just a mess.
> > You seem to need to restart klogd after reiserfs module was loaded, so that it will
> > find new module and it's symtab. (or even better: run dmesg | ksymoops immediately
> > after oops have happened). That info would be very useful.
> See that kernel: Modules line above?  That tells you were the reiserfs
> module started and ended at the time of the oops.  We can use it to
> decode the thing if Oliver sends us the output from 
> nm -n /lib/modules/2.4.19-4GB/kernel/fs/reiserfs.o

Sure, but I prefer that stuff which can be automated was done automatically. ;)

Bye,
    Oleg
