From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: shrink reiserfs
Date: Mon, 24 Jan 2005 00:23:16 +0300
Message-ID: <20050123212315.GK10921@backtop.namesys.com>
References: <17956.62.135.89.53.1106495294.squirrel@mail.infinitylimited.net> <20050123171105.GG10921@backtop.namesys.com> <18298.62.135.89.53.1106502596.squirrel@mail.infinitylimited.net> <20050123190735.GH10921@backtop.namesys.com> <18682.62.135.89.53.1106507496.squirrel@mail.infinitylimited.net> <20050123194918.GI10921@backtop.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23197-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20050123194918.GI10921@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jake Hawkes <jake@infinitylimited.net>
Cc: reiserfs-list@namesys.com

On Sun, Jan 23, 2005 at 10:49:18PM +0300, Alex Zarochentcev wrote:
> On Sun, Jan 23, 2005 at 12:11:36PM -0700, Jake Hawkes wrote:
> > Alex Zarochentsev said:
> > > On Sun, Jan 23, 2005 at 10:49:56AM -0700, Jake Hawkes wrote:
> > >> Alex Zarochentsev said:
> > >> > Hello,
> > >> >
> > >> > On Sun, Jan 23, 2005 at 08:48:14AM -0700, Jake Hawkes wrote:
> > >> >> Hi.
> > >> >>
> > >> >>  resize_reiserfs says that there are already too many allocated
> > >> blocks.
> > >> >
> > >> > which resize_reiserfs command produces the error message?
> > >>
> > >> resize_reiserfs -v -s -1G /dev/hda4
> > >>
> > >> and when that failed, I tried
> > >>
> > >> resize_reiserfs -v -s -1M /dev/hda4
> > >
> > > and it failed too?
> > 
> > yep
> > 
> > 
> > >
> > > which reiserfsprogs version are you using?  It is possible
> > > that this bug is fixed already in the latest release of
> > > reiserfsprogs (3.6.19).
> > 
> > jacobh log # esearch reiserfsprogs
> > [ Results for search key : reiserfsprogs ]
> > [ Applications found : 1 ]
> > 
> > *  sys-fs/reiserfsprogs
> >       Latest version available: 3.6.19
> >       Latest version installed: 3.6.18
> >       Size of downloaded files: [no/bad digest]
> >       Homepage:    http://www.namesys.com/
> >       Description: Reiserfs Utilities
> 
> yes, it see, new reiserfsprogs has this bug (v3.0.9 does not :-/) .

oops, i can't reproduce the bug anymore, seems i forgot '-' in  
"-s -1G" option in my first resize attempt.  3.6.19, 3.6.18 work well
for me.

> As a workaround  I suggest don't use relative values in current resizer.
> please try resize_reiserfs -v -s 21G /dev/hda4 .
> 
> > I'm using 3.6.18
> 
> Thanks for the report.
> 
> -- 
> Alex.

-- 
Alex.
