From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCH 3/3] reiser4: in our own sync writes, mark pages dirty
 before marking them writeback.
Date: Wed, 14 Oct 2015 13:05:47 +0300
Message-ID: <1444817147.5346.10.camel@gmail.com>
References: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>
	 <1444389417-14929-4-git-send-email-intelfx100@gmail.com>
	 <5617C0C1.6060806@gmail.com> <1444398642.6030.3.camel@gmail.com>
	 <5617D55D.2040908@gmail.com> <1444410842.2213.5.camel@gmail.com>
	 <56182257.7060304@gmail.com> <1444473863.4257.10.camel@gmail.com>
	 <561B7857.1030000@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-JYj5ZE19qK2r5bhifA9i"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=CYrU3LJsqAcamY8FYcq1yaDQ+5/PUVrBwl/DebeBc0U=;
        b=mCrbHqFG8jsNmrHKFNyA3X+ROCjjZWTLKAjDLkvVDN7F3ffZw725N5mCnYDgleEiIF
         6Vnquga27u9uYrlRo4Q0wN6m+7fF/+vkKCCf1el2glD9RVAhb42t9rCtrnLtpC+KKgMu
         YRcpGLJ/w43z3ZwFc9VmTiLpVBJ72peSFlbngNKvU9IriZX13Cu0EuNktGvS5b+yFc60
         of2ojb8yDU+6wNWz5AR/1c+O97tUQprp0KnbgLxhVlTCM0JSiFK9K7fYcX4GQoR5gl9e
         t6GGC7pzQJ1kjB5joBD6aESXCmThbq7PZFeVwn+9fiZzswCRP/hTNZ/e4Eb0xrjTzmt5
         +3Hg==
In-Reply-To: <561B7857.1030000@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Oleg Drokin <green@linuxhacker.ru>, reiserfs-devel@vger.kernel.org


--=-JYj5ZE19qK2r5bhifA9i
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-10-12 at 11:07 +0200, Edward Shishkin wrote:
> On 10/10/2015 12:44 PM, Ivan Shapovalov wrote:
> [...]
> > I didn't check the code yet; I'll probably try with that assertion
> > converted into warning and split into two
> > (one for formatted and another for unformatted nodes), so that I
> > could check what type of nodes is responsible
> > for generating the final oops in set_page_writeback().
>=20
> I suppose that oops happens on unformatted nodes, because
> all formatted nodes have the same host - a special "fake" inode
> with number 1, which gets i_wb at mount time (init_fake_inode()
> calls inode_attach_wb()).
>=20
> Edward.

So, I've added three non-fatal checks right before
set_page_writeback():
- PageDirty(pg)
- JF_ISSET(cur, JNODE_DIRTY)
- pg->mapping->host->i_wb !=3D NULL

In almost all times when either of the checks is triggered,
the first two checks are triggered at once (i. e. neither page nor
jnode is dirty, but i_wb is not NULL). This happens with both formatted
nodes (jnode_is_znode), unformatted nodes (jnode_is_unformatted) and
other nodes.

And, finally, there are very few warnings where jnode _is_ dirty, but
the page _isn't_. On the first such warning i_wb is also NULL. And,
just as you've suspected, this happens with an unformatted node.

I'll try to add a backtrace buffer into struct jnode and generate a
backtrace there on each jnode dirtying attempt... and then print it for
the problematic jnode.

--=20
Ivan Shapovalov / intelfx /

>=20
> >=20
> > > For unformatted nodes only code review
> > > can help. Normally, all modifications of unformatted nodes should
> > > look like the following:
> > >=20
> > > struct page *page =3D jnode_page(node);
> > > lock_page(page);
> > > char *data =3D kmap(page);
> > > /* modifications are going here */
> > > kunmap(page);
> > > set_page_dirty_nobuffers(page); /* somebody forgets to do this */
> > > unlock_page(page);
> > >=20
> > > Modifications of formatted nodes should look like the following:
> > >=20
> > > longterm_lock_znode(node);
> > > zload(node);
> > > /* modifications are going here */
> > > zrelse(node);
> > > znode_make_dirty(node); /* somebody forgets to do this */
> > > longterm_unlock_znode();
> > >=20
> > > Anyway, we can use your patch 3 as a temporal fixup.
> > The most persistent things are those conseived as the most
> > temporary
> > ones... ;)
--=-JYj5ZE19qK2r5bhifA9i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlYeKPsACgkQxUKljSIMAnCJIQEA4tJjU36c0bNxHf4M2rFEyvJI
/KhuPgVPQCdFoHRcdwcBAMHBVndII5Hhpn3kI6chiarf5pitHod+3PxS+MBg7APe
=wRa6
-----END PGP SIGNATURE-----

--=-JYj5ZE19qK2r5bhifA9i--

