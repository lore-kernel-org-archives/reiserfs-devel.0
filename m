From: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH 0/8] Convert reiserfs from b_page to b_folio
Date: Sat, 17 Dec 2022 15:39:56 -0800
Message-ID: <Y55TTKG2tgWL7UsQ@iweiny-mobl>
References: <20221216205348.3781217-1-willy@infradead.org>
 <11295613.F0gNSz5aLb@suse>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671320403; x=1702856403;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=uyGg/O0AErkhsARyN5rJ6h5Q7ntE2Ln5p81fG+DeuGs=;
  b=hKzNWwOqFboao9CEh/JqrgTNpAhkID3MDpl7GK5cxGKvEP2m9DFY55BI
   L3IMk9/idDRDf6J+XZJOLZZIMuP+B/ngHwliOC1dfuz9uunIYNK6GIVvV
   iiXJ2wSBy7ECCs7h4Wv25tzJ+GuMWyHkGnvGlBt8IglMBBvekRo9HWy3J
   6aM7BNMfp+m3YSuKJZTlVJX0FOlV3U2V3DE5FHPKduDfY8b+tnn5svTA0
   Fb1otzVI6Dr9MMM/jVLNbbmFdehBNrWiAqY+EGBFC29NrdN2MXZEv91HN
   BqSeJniTichvmZTiaR1tMEhoe8BLTdQkM4OdZFHbRLcjC7/DssokyaUoN
   A==;
Content-Disposition: inline
In-Reply-To: <11295613.F0gNSz5aLb@suse>
List-ID: <reiserfs-devel.vger.kernel.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org

On Sat, Dec 17, 2022 at 09:43:11PM +0100, Fabio M. De Francesco wrote:
> On venerd=EC 16 dicembre 2022 21:53:39 CET Matthew Wilcox (Oracle) wrote:
> > These patches apply on top of
> > https://lore.kernel.org/linux-fsdevel/20221215214402.3522366-1-willy@in=
fradead
> > .org/
> >=20
> > The non-trivial ones mostly revolve around uses of kmap()/kmap_atomic(),
> > so review from the experts on those would be welcome.
>=20
> I took a quick look at your conversions and they made me recall that mont=
hs=20
> ago you converted to kmap_local_folio() a previous conversion from kmap()=
 to=20
> kmap_local_page() in ext2_get_page(): commit 37ce0b319b287 ("ext2: Use a =
folio=20
> in ext2_get_page()").
>=20
> So I just saw kmap_local_folio again. Unfortunately, because of my=20
> inexperience,  I'm not able to see why we should prefer the use of this=20
> function instead of kmap_local_page().
>=20
> Can you please tell me why and when we should prefer kmap_local_folio() i=
n=20
> those cases too where kmap_local_page() can work properly? I'm asking bec=
ause=20
> these days I'm converting other *_get_page() from kmap() (including the s=
eries=20
> to fs/ufs that I sent today).

Fabio kmap_local_folio() works on folios and handles determining which page=
 in
the folio is the correct one to map.

AFAICT (from a quick grep) fs/ufs does not have folio support.  I am sure
Mathew would appreciate converting fs/ufs to folios if you have the time and
want to figure it out.

Ira

>=20
> > If these all look
> > good to people, I can pass them off to Andrew for the 6.3 merge window.
> >=20
> > Running xfstests against reiserfs gives me 313/701 failures before and
> > after this set of patches.
>=20
> It has happened several times to me too. Some patches of mine have failur=
es=20
> from xfstests whose amounts and types don't change with or without my cha=
nges.
>=20
> Several of them have already been merged. I guess that if they don't add =

> further failures everything is alright.
>=20
> However, something is broken for sure... xfstests or the filesystems? :-/=
=20
>=20
> Thanks,
>=20
> Fabio
>=20
> > I don't have a huge amount of confidence
> > that we're really getting good coverage from that test run!
> >=20
> > Matthew Wilcox (Oracle) (8):
> >   reiserfs: use b_folio instead of b_page in some obvious cases
> >   reiserfs: use kmap_local_folio() in _get_block_create_0()
> >   reiserfs: Convert direct2indirect() to call folio_zero_range()
> >   reiserfs: Convert reiserfs_delete_item() to use kmap_local_folio()
> >   reiserfs: Convert do_journal_end() to use kmap_local_folio()
> >   reiserfs: Convert map_block_for_writepage() to use kmap_local_folio()
> >   reiserfs: Convert convert_tail_for_hole() to use folios
> >   reiserfs: Use flush_dcache_folio() in reiserfs_quota_write()
> >=20
> >  fs/reiserfs/inode.c           | 73 +++++++++++++++++------------------
> >  fs/reiserfs/journal.c         | 12 +++---
> >  fs/reiserfs/prints.c          |  4 +-
> >  fs/reiserfs/stree.c           |  9 +++--
> >  fs/reiserfs/super.c           |  2 +-
> >  fs/reiserfs/tail_conversion.c | 19 ++++-----
> >  6 files changed, 59 insertions(+), 60 deletions(-)
> >=20
> > --
> > 2.35.1
>=20
>=20
>=20
>=20
