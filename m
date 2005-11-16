From: David Masover <ninja@slaphack.com>
Subject: Re: More Slowdown
Date: Wed, 16 Nov 2005 11:28:17 -0600
Message-ID: <437B6C31.6040706@slaphack.com>
References: <1132093347.6347.7.camel@bauerbob.hirsch.lan>	<1132098269.7652.6.camel@teratron.lan.etheus.net>	<437A811B.5000509@slaphack.com>	<200511160240.45212.biscani@pd.astro.it> <17275.9103.623119.792961@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26962-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17275.9103.623119.792961@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita Danilov <nikita@clusterfs.com>
Cc: Francesco Biscani <biscani@pd.astro.it>, Craig Shelley <craig@microtron.org.uk>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Nikita Danilov wrote:
> Francesco Biscani writes:
>  > On Wednesday 16 November 2005 01:45, David Masover wrote:
>  > > I got sick of waiting for it and nuked the fsync call.  All my kernels
>  > > have a custom patch such that sys_fsync just returns true, no matter what.
>  > 
>  > Mhh.. would it be something like this?
>  > 
>  > --- buffer.c.old        2005-11-16 02:36:46.129829994 +0100
>  > +++ buffer.c    2005-11-16 02:37:11.125079752 +0100
>  > @@ -376,7 +376,7 @@
>  > 
>  >  asmlinkage long sys_fsync(unsigned int fd)
>  >  {
>  > -       return do_fsync(fd, 0);
>  > +       return 1;
>  >  }
>  > 
>  > What are the implications of doing something like this? Is "sync" going to 

Yes, sync still works.  That, or the "sync" command has found an
entirely new way of wasting my disk bandwidth.

fsync != sync.

I also sincerely hope that no unmounting, hibernation, or other place
the system _needs_ to sync or data WILL be lost depends on fsync.  Then
again, that shouldn't matter -- the kernel seems to have fsync and
sys_fsync as separate functions.

> One implication is following:
> 
>  1 application like fetchmail downloads a mail message from the server
> 
>  2 saves message in the mailbox
> 
>  3 fsyncs the mailbox (which is a no-op in our case)
> 
>  4 sends notification to the server, which deletes message
> 
>  5 crash occurs (transaction made on the step 2 is not yet committed to
>  the disk)
> 
>  6 after reboot mailbox is restored to the state it had before step 2
> 
>  7 message is lost.

Which is why I refuse to submit my patch.  It's dangerous and shouldn't
be needed, and considering that many users don't even bother to unmount
flash drives in Windows, can you imagine how dangerous it'd be to make
them run "sync" after every time they save an important document?


Some apps do have a legitimate use for fsync, though I wish it was more
configurable -- for instance, vim, mailservers, etc.  Some don't.
Evolution fsyncing every pixel you drag a column is flat-out retarded,
and I'm glad I never needed anything beyond Thunderbird.
