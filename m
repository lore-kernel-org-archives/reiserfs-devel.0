From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 15:35:05 +0200
Message-ID: <200408261535.05452.christian.mayrhuber@gmx.net>
References: <20040824202521.GA26705@lst.de> <20040826134415.A19244@infradead.org> <20040826124929.GW1284@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20667-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040826124929.GW1284@nysv.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Markus =?iso-8859-1?q?T=F6rnqvist?= <mjt@nysv.org>, Christoph Hellwig <hch@infradead.org>, Olivier Galibert <galibert@pobox.com>, linux-fsdevel@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

On Thursday 26 August 2004 14:49, Markus T=F6rnqvist wrote:
> On Thu, Aug 26, 2004 at 01:44:15PM +0100, Christoph Hellwig wrote:
> >On Thu, Aug 26, 2004 at 02:43:34PM +0200, Olivier Galibert wrote:
> >> He's not proposing to add it to 2.4, is he?
> >
> >We're talking about 2.6 here.  2.4 is the obsolete kernel series these
> > days.
>
> So run it in -mm or fork it to 2.7.
>
> 2.7 might not be a bad idea for trying such bleeding edge revolution
> stuff as this.

If I remember right, there are now some reasons for a 2.7:

1) udev / dynamic device numbers
2) enhanced filesystem semantics
maybe resulting in
3) visible automounter mountpoints

=2D-=20
lg, Chris
