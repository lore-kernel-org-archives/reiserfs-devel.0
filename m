From: Edward Shishkin <edward@namesys.com>
Subject: Re: External journals and NVRAM devices
Date: Sat, 02 Nov 2002 00:45:20 +0300
Sender: edward
Message-ID: <3DC2F5F0.2D459C66@namesys.com>
References: <3DC21358.5040808@fastmail.fm> <3DC2E6A7.3060801@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11898-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Jeremy Howard <jh_lists@fastmail.fm>, ReiserFS List <reiserfs-list@namesys.com>, mose Jadon <mose@uMEM.COM>, Nikita Danilov <Nikita@Namesys.COM>

Hans Reiser wrote:
> 
> Jeremy Howard wrote:
> 
> > Hi all,
> >
> > I'm looking at buying solid state drives / NVRAM drives for our servers
> > to hold an external ReiserFS journal.
> >
> > We are using 2.4.20pre11, and Chris Mason's data logging patches.
> >
> > I'm looking for any tips on how large the journal is when using
> > data=journal, and whether the external log patches are stable and work OK
> > in data=journal mode. Is there a command to show the current journal
> > size? Does the size vary over time? We need to ensure we buy a card with
> > enough memory so this is important information for us.
> >
> > Is anyone currently using NVRAM for the journal? If so, how do you find
> > the performance of this configuration?
> >
> > TIA,
> >   Jeremy
> >
> >
> >
> >
> You might contact the umem folks.  They are working with us.
> 
> Edward, I want those benchmarks produced in a readable form.  Nikita,
> make sure that this happens, and that Edward produces a benchmark with
> an explanation of the significance of what was measured that is
> understandable to persons who aren't him.

Ok, I'll try to make something on next week.
Edward.

> 
> --
> Hans
