From: Bron Gondwana <brong@fastmail.fm>
Subject: Re: BUG: at fs/reiserfs/inode.c:2868 reiserfs_releasepage()
Date: Mon, 3 Sep 2007 22:14:58 +1000
Message-ID: <20070903121458.GA13335@brong.net>
References: <1d7601c7edf6$40655930$8700a8c0@robmhp> <2f4958ff0709030500w2bc8d064q351c1b8e05e71b31@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2f4958ff0709030500w2bc8d064q351c1b8e05e71b31@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Grzegorz =?utf-8?Q?Ja=C5=9Bkiewicz?= <gryzman@gmail.com>
Cc: Rob Mueller <robm@fastmail.fm>, reiserfs-devel@vger.kernel.org, "Vladimir V. Saveliev" <vs@namesys.com>

On Mon, Sep 03, 2007 at 01:00:15PM +0100, Grzegorz Ja=C5=9Bkiewicz wrot=
e:
> On 9/3/07, Rob Mueller <robm@fastmail.fm> wrote:
> > This is linux 2.6.20.11 with one patch applied to work around this =
bug
> > http://lists.linuxcoding.com/kernel/2006-q1/msg32508.html, the patc=
h is:
> >
> > -----
> > --- linux/fs/reiserfs/file.c   2006-11-29 16:57:37.000000000 -0500
> > +++ linux-syncwrite/fs/reiserfs/file.c 2007-02-02 01:01:36.00000000=
0 -0500
> > @@ -1358,6 +1358,8 @@
> >                 return result;
> >         }
> >
> > +       return do_sync_write(file, buf, count, ppos);
> > +
> >         if (unlikely((ssize_t) count < 0))
> >                 return -EINVAL;
>=20
> that's the dead code than, because you put return upfront. this ain't
> any fix, problem probably lies somewhere else - and is exposed by
> 'unlikely()' function.

Hmm - that's not what Vladamir said on 2 Feb.

It wasn't posted anywhere I can find a public archive, but here's
the important bit:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

=46rom: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Reiserfs and MMAP (was: How many people are using 2.6.16?)
Cc: reiserfs-dev@namesys.com
To: Bron Gondwana <brong@fastmail.fm>

Hello

On Wednesday 31 January 2007 13:42, Bron Gondwana wrote:
> On Wed, Jan 31, 2007 at 08:02:37AM +0100, Adrian Bunk wrote:
> [ snip stuff about reiserfs changes ]
>
> Referring back to: <43BE1EDF.3010305@namesys.com> (which went
> to reiserfs-dev and a couple of the ever-growing CC list above)
> we're still not 100% sure if it's safe to remove the patch that
> I attached there:
>
> >>>>--- file.c~ 2004-10-02 12:29:33.223660850 +0400
> >>>>+++ file.c 2004-10-08 10:03:03.001561661 +0400
> >>>>@@ -1137,6 +1137,8 @@
> >>>>return result;
> >>>>  }
> >>>>
> >>>>+    return generic_file_write(file, buf, count, ppos);
> >>>>+
> >>>>  if ( unlikely((ssize_t) count < 0 ))
> >>>>      return -EINVAL;
>
> which Hans asserted was about 5% slower than the resierfs custom
> write implementation, but we countered at least meant that we
> didn't crash in a steaming pile of processes stuck in D state
> with no way out every few days.
>
> It doesn't apply against 2.6.19 any more,

use do_sync_write instead of generic_file_write.
This patch is needed, custom reiserfs write may deadlock writing proces=
s

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Which looks to me like we should have the same return statement
except with do_sync_write as the new function name.

Did we misinterpret?  Does anyone have a better solution?  Steaming
piles of processes in D state are much less our friend than occasional
stack traces in dmesg.

Thanks,

Bron.
-
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
