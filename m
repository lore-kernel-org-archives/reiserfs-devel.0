From: Chris Mason <mason@suse.com>
Subject: Re: Problem with Kernel 2.4.19, reiser on sw-raid5 and rsync
Date: 05 Mar 2003 09:43:20 -0500
Message-ID: <1046875400.2163.253.camel@tiny.suse.com>
References: <833151992.20030305132356@edo.uni-dortmund.de>
	 <20030305172029.A32305@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13071-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030305172029.A32305@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Oliver Heering <Heering@edo.uni-dortmund.de>, reiserfs-list@namesys.com

On Wed, 2003-03-05 at 09:20, Oleg Drokin wrote:
> Hello!
> 
> On Wed, Mar 05, 2003 at 01:23:56PM +0100, Oliver Heering wrote:
> 
> > we've got a big problem with one of our servers using Kernel 2.4.19
> > (SuSE 8.1 standard kernel), rsync and reiserfs on a software-raid5
> > array consisting of 6x75GB (= 375GB usable capacity) harddrives.
> 
> I suppose this is 2.4.19 shipped with SuSE? Is this the last version available from SuSE?
> This is SuSE 8.1, I presume?
> (and rpm -qa | grep k_i386 output please)

> > kernel: Modules: [(reiserfs:<c1dc0060>:<c1def390>)]
> 
> The decoded output is just a mess.
> You seem to need to restart klogd after reiserfs module was loaded, so that it will
> find new module and it's symtab. (or even better: run dmesg | ksymoops immediately
> after oops have happened). That info would be very useful.
> 

See that kernel: Modules line above?  That tells you were the reiserfs
module started and ended at the time of the oops.  We can use it to
decode the thing if Oliver sends us the output from 
nm -n /lib/modules/2.4.19-4GB/kernel/fs/reiserfs.o

Oliver, you might also want to look in the update directory on
ftp.suse.com for an updated kernel, there have been fixes since
September.  

On some machines, ACPI causes bugs and crashes in strange places, so you
could also trying booting with acpi=off or acpi=oldboot

-chris


