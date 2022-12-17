From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: Re: [PATCH 0/8] Convert reiserfs from b_page to b_folio
Date: Sat, 17 Dec 2022 21:43:11 +0100
Message-ID: <11295613.F0gNSz5aLb@suse>
References: <20221216205348.3781217-1-willy@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AU2IHu9IHMCR1i1u9LEoX9i/onRwkHb2knf00zrEks4=;
        b=GCR5sXlcaFKQMc4NLH4mTaeumKn6omx6zF4b3X1iJAolWtsv6akZkBhaS/+8e2U5gp
         kDsdkyIc6DN2OXHSpjMhKMFaBrzxyvm1vj9wVrghsu5aUWshsN2sx7zYLXWQofplaROy
         m6WZqjRom1vzLPgb1MdZj6RBVjo8m1mpQ/RKvbgqac+FcMXF0VJETpqox6Frw1oVp+rk
         AU3xddx/oB0e9Y2kqkdiXKKGm7Dd9wWeAuppLjUef7dmFaWrvI/ERqYqjdhPr+deM4K6
         bHEgsePwoYWpNkXCt3yFGTjqt4EGs+REeXIMvTRakv7zCLwuGXxNS9OECyob4Q6grnK4
         H3Jw==
In-Reply-To: <20221216205348.3781217-1-willy@infradead.org>
List-ID: <reiserfs-devel.vger.kernel.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>

On venerd=EC 16 dicembre 2022 21:53:39 CET Matthew Wilcox (Oracle) wrote:
> These patches apply on top of
> https://lore.kernel.org/linux-fsdevel/20221215214402.3522366-1-willy@infr=
adead
> .org/
>=20
> The non-trivial ones mostly revolve around uses of kmap()/kmap_atomic(),
> so review from the experts on those would be welcome.

I took a quick look at your conversions and they made me recall that months=
=20
ago you converted to kmap_local_folio() a previous conversion from kmap() t=
o=20
kmap_local_page() in ext2_get_page(): commit 37ce0b319b287 ("ext2: Use a fo=
lio=20
in ext2_get_page()").

So I just saw kmap_local_folio again. Unfortunately, because of my=20
inexperience,  I'm not able to see why we should prefer the use of this=20
function instead of kmap_local_page().

Can you please tell me why and when we should prefer kmap_local_folio() in=
=20
those cases too where kmap_local_page() can work properly? I'm asking becau=
se=20
these days I'm converting other *_get_page() from kmap() (including the ser=
ies=20
to fs/ufs that I sent today).

> If these all look
> good to people, I can pass them off to Andrew for the 6.3 merge window.
>=20
> Running xfstests against reiserfs gives me 313/701 failures before and
> after this set of patches.

It has happened several times to me too. Some patches of mine have failures=
=20
from xfstests whose amounts and types don't change with or without my chang=
es.

Several of them have already been merged. I guess that if they don't add=20
further failures everything is alright.

However, something is broken for sure... xfstests or the filesystems? :-/=20

Thanks,

=46abio

> I don't have a huge amount of confidence
> that we're really getting good coverage from that test run!
>=20
> Matthew Wilcox (Oracle) (8):
>   reiserfs: use b_folio instead of b_page in some obvious cases
>   reiserfs: use kmap_local_folio() in _get_block_create_0()
>   reiserfs: Convert direct2indirect() to call folio_zero_range()
>   reiserfs: Convert reiserfs_delete_item() to use kmap_local_folio()
>   reiserfs: Convert do_journal_end() to use kmap_local_folio()
>   reiserfs: Convert map_block_for_writepage() to use kmap_local_folio()
>   reiserfs: Convert convert_tail_for_hole() to use folios
>   reiserfs: Use flush_dcache_folio() in reiserfs_quota_write()
>=20
>  fs/reiserfs/inode.c           | 73 +++++++++++++++++------------------
>  fs/reiserfs/journal.c         | 12 +++---
>  fs/reiserfs/prints.c          |  4 +-
>  fs/reiserfs/stree.c           |  9 +++--
>  fs/reiserfs/super.c           |  2 +-
>  fs/reiserfs/tail_conversion.c | 19 ++++-----
>  6 files changed, 59 insertions(+), 60 deletions(-)
>=20
> --
> 2.35.1




