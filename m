From: Piotr Neuman <sikkh@wp.pl>
Subject: Re: Reiser4 journal replay stats
Date: Wed, 20 Oct 2004 23:31:08 +0200
Message-ID: <200410202331.08984.sikkh@wp.pl>
References: <200410162209.12163.sikkh@wp.pl> <41757737.3050604@namesys.com> <41757DD8.5020105@linspireinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22116-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41757DD8.5020105@linspireinc.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Clifford Beshers <clifford.beshers@linspireinc.com>
Cc: Alex Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com

> Hans Reiser wrote:
> > Piotr Neuman wrote:
> >> Hi
> >>
> >> This small patch is will print out nuber of transartions replied from
> >> logs after a crash, quite like reiserfs 3.6 does:
> >>
> >> http://kem.p.lodz.pl/~peter/reiser4_replay_stats.patch
> >>
> >> Thanks to Nikita Danilov for guidance.
> >
> > Do the members of the list view this as useful?  I worry that to
> > average persons, who don't know what a transaction is, this is vaguely
> > scary.
> >
> > Clifford, I cc'd you because your intuition is better than mine for this.
> >
> > Perhaps it should say something reassuring, like "All went well in the
> > filesystem aspect of recovering from what seems to have been an
> > improperly shutdown or crashed system."

[cut]

> I don't know if this text already exists, but I would make sure there
> are messages that indicate:
>
>     * that the file system was improperly shutdown;
>     * that an improper shutdown is no big deal for Reiser4 and we'll
>       happily clean things up;
>     * give an indication that no data was lost (if you can determine
>       that) and that all is well with the world.
>
> Probably a longer answer than you wanted, but I'm not going to take the
> time to edit it down. ;-)

Updated patch to reflect above suggestions. There is only one technical thing, 
since reiser4 uses wandering logs I find it very hard to crash in such a way 
that it will reply even a single transaction, so I don't really know if this 
patch is usefull ;-).

Download:

http://kem.p.lodz.pl/~peter/reiser4_replay_stats-2.patch

Regards

Piotr Neuman
