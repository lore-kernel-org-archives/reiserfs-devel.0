From: John Gilmore <jgilmore@glycou.com>
Subject: Re: More Slowdown
Date: Wed, 16 Nov 2005 13:28:33 +0000
Message-ID: <200511161328.33330.jgilmore@glycou.com>
References: <1132093347.6347.7.camel@bauerbob.hirsch.lan> <200511160240.45212.biscani@pd.astro.it> <17275.9103.623119.792961@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26967-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17275.9103.623119.792961@gargle.gargle.HOWL>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

That "return 1;" should be "return 0;"

a return value of 1 indicates failure.

Also, maybe this should be applied also to the 

asmlinkage long sys_fdatasync(unsigned int fd)

function as well? There isn't much to choose from between these two 
functions...

On Wednesday 16 November 2005 12:18, Nikita Danilov wrote:
> Francesco Biscani writes:
>  > On Wednesday 16 November 2005 01:45, David Masover wrote:
>  > > I got sick of waiting for it and nuked the fsync call.  All my kernels
>  > > have a custom patch such that sys_fsync just returns true, no matter
>  > > what.
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
>  > What are the implications of doing something like this? Is "sync" going
>  > to
>
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
>
>  > stop working or isn't it using this function?
>  >
>  > Thanks,
>  >
>  >   Francesco
>
> Nikita.
