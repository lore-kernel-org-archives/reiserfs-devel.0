From: Sonny Rao <sonny@burdell.org>
Subject: Re: Emergency: Is there a way to fix a partition table
Date: Tue, 28 Sep 2004 14:39:35 -0400
Message-ID: <20040928183935.GA32038@kevlar.burdell.org>
References: <231dafb504092622352b9c17d2@mail.gmail.com> <20040927065608.GA25236@kevlar.burdell.org> <231dafb5040927232866a4924f@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21949-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <231dafb5040927232866a4924f@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dark Shadow <shadowofdarkness@gmail.com>
Cc: reiserfs-list@namesys.com

On Tue, Sep 28, 2004 at 12:28:52AM -0600, Dark Shadow wrote:
> On Mon, 27 Sep 2004 02:56:08 -0400, Sonny Rao <sonny@burdell.org> wrote:
> > On Mon, Sep 27, 2004 at 01:35:55AM -0400, Dark Shadow wrote:
> > > I don't have a backup of the partition table and was wondering if
> > > there was a way to auto scan and have it come up with one. It had 2
> > > partitions both reiserfs v3 and fully functioning Linux installs
> > >
> > > I have made a dd image of the entire drive to work with
> > >
> > > This is very important that I get it fixed since even though I have a
> > > day old backup I got a couple files I really don't want to lose (9gb
> > > of tv capturecard captures)and I need the system fully functioning in
> > > a day
> > >
> > 
> > http://packages.debian.org/unstable/admin/gpart
> > 
> > This program has worked for me in the past.
> > 
> > --
> > Sonny Rao
> > 
> 
> Well using gpart to scan comes up with it guess as all unused
> I tried having it scan the backup that lilo makes but it was a really
> old version as in the file was dated 2002-04-18 which since I started
> setting up that lfs install 2002-04-17 would of been created on first
> install of lilo and has not been updated over time

That's interesting, it seemed to work almost too well for me last time
I tried it, in that it found other filesystems (i.e. in a file,
loopback, vmware, etc) that weren't occuping a "real" dos partition.
So, that seems to indicate gpart doesn't know the proper signature for
your filesystems.

Another, rather brute force attempt would be to guess the sizes and
just try to mount up the filesystems read-only.  Basically, if you get
the start point of the partition right, it should mount up at least.
Then you can go back and find the end :)

Sonny
