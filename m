From: Oleg Drokin <green@namesys.com>
Subject: Re: 2.6.0-test4 reiserfs oops
Date: Wed, 27 Aug 2003 10:46:13 +0400
Message-ID: <20030827064613.GB29131@namesys.com>
References: <200308252047.36054.l.allegrucci@tiscali.it> <200308261146.47241.l.allegrucci@tiscali.it> <20030826103851.GA14676@namesys.com> <200308261559.20668.l.allegrucci@tiscali.it>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15455-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200308261559.20668.l.allegrucci@tiscali.it>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lorenzo Allegrucci <l.allegrucci@tiscali.it>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Aug 26, 2003 at 03:59:20PM +0000, Lorenzo Allegrucci wrote:
> > > > > I have got this oops running fsstress and fsx-linux
> > > > > on a 20Gb reiserfs partition.  Fully reproducible.
> > > > What are the options to fsx and fsstress?
> > > fsx-linux linux-2.5.0.tar.bz2 :)
> > > mkdir d
> > > fsstress -d d -n 1000000 -p 10
> > > The oops follows immediately.
> > works for me without any patches.
> 
> This is easier to reproduce:
> touch file
> mkdir d
> fsstress -d d -n 1000000 -p 10
> As soon as I run "fsx-linux file" on another console I get the oops.
> (However fsx-linux without fsstress is not sufficient)

Well, actually I was able to reproduce it yesterday later after replying to you.
And we got some other similar reports under different workloads.
My initial suspiction about the cause was right. and that fix I sent to you
on the second try is the correct thing to do.
The actual problem came from AIO people merging incorrect patch
into reiserfs code.

Bye,
    Oleg
