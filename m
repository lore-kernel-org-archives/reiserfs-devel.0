From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCH 3/3] reiser4: in our own sync writes, mark pages dirty
 before marking them writeback.
Date: Sat, 10 Oct 2015 13:44:23 +0300
Message-ID: <1444473863.4257.10.camel@gmail.com>
References: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>
		 <1444389417-14929-4-git-send-email-intelfx100@gmail.com>
		 <5617C0C1.6060806@gmail.com> <1444398642.6030.3.camel@gmail.com>
		 <5617D55D.2040908@gmail.com> <1444410842.2213.5.camel@gmail.com>
	 <56182257.7060304@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-i70BvAXYpzCVjP4BSaDs"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=IuDpJ/NkZWHuEi4OuAPr0Hh6W9JyguVRTOjr+yHXLxc=;
        b=NHqX788uqMPnxLZI5fPm32O5DP5uNovRFss4owek7gRHoJXc742UyCTVNg7y2RIpfL
         l0x8EcysHUo3fobifT5oBUYFeu2oWQtjUz8AY7xNDIEHFAQFiSOMCV1e0U5/TK3cwor0
         G/eQ8aNowlbzLSBnwP6CtpOW1ddhBSOgyhE9JxxhAgqtmfuxuMd05BG09BP3P4k4FPno
         rAriDmh/gLy28JW/jgIulX4UiRwFuQfBvvwIPXYO94xQLFJBrdZpd6X0OAs0m8TXizxB
         Iamo//Cc6zEIoAfWqjr4jK7Lr480ANP0L8R70oKnKzJY4o7MRQtnlRVg00g+CuEY1ISS
         HQnw==
In-Reply-To: <56182257.7060304@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Oleg Drokin <green@linuxhacker.ru>, reiserfs-devel@vger.kernel.org


--=-i70BvAXYpzCVjP4BSaDs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-10-09 at 22:23 +0200, Edward Shishkin wrote:
> On 10/09/2015 07:14 PM, Ivan Shapovalov wrote:
> > On 2015-10-09 at 16:55 +0200, Edward Shishkin wrote:
> > > On 10/09/2015 03:50 PM, Ivan Shapovalov wrote:
> > > > On 2015-10-09 at 15:27 +0200, Edward Shishkin wrote:
> > > > > Hi Ivan,
> > > > >=20
> > > > > On 10/09/2015 01:16 PM, Ivan Shapovalov wrote:
> > > > > > Ref.: https://www.mail-archive.com/linux-f2fs-devel%40lists
> > > > > > .sou
> > > > > > rcef
> > > > > > orge.net/msg02745.html
> > > > > Do you have a stack trace for reiser4?
> > > > > How to reproduce it?
> > > > I'll rebuild the kernel without the fix and provide you with
> > > > the
> > > > oops'
> > > > stacktrace asap.
> > > >=20
> > > > I guess that it's tied to the config. In my case, it is
> > > > reproducible on
> > > > each boot, just as the DE starts up and something issues the
> > > > first
> > > > fsync().
> > >=20
> > > Yes, let's try to find the culprit who doesn't set i_wb...
> > So, here are the traces I've got after adding an
> > assert(PageDirty(node->pg)) to queue_jnode():
> > /* captured by hand as these are panics, not oopses */
> >=20
> > 1.
> >=20
> > queue_jnode()
> > unformatted_make_reloc()
> > assign_real_blocknrs()
> > forward_relocate_unformatted()
> > forward_alloc_unformatted_journal()
> > ? coord_num_units()
> > handle_pos_on_twig()
> > flush_current_atom()
> > flush_some_atom()
> > reiser4_writeout()
> > reiser4_writeback_inodes()
> > <...>
> >=20
> > 2.
> >=20
> > znode_make_reloc()
> > forward_alloc_formatted_wa()
> > ? zload_ra()
> > allocate_znode()
> > alloc_pos_and_ancestors()
> > flush_current_atom()
> > reiser4_txn_end()
> > ? reiser4_txn_end()
> > reiser4_txn_restart_current()
> > force_commit_atom()
> > ? reiser4_txn_restart_current()
> > txnmgr_force_commit_all()
> > writepages_cryptcompress()
> > reiser4_writepages_dispatch()
> > <...>
> > sys_fsync()
> >=20
>=20
>=20
> Thanks Ivan.
> Not a good news, TBH...
>=20
> For formatted nodes we can continue to narrow down the problem
> (see the attached patch).

Having applied the patch, I saw loads and loads of warnings (in ~10
distinct stacktraces), but no panics or oopses in the initial location.
The false positives are possible, right?

The traces:

1.
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffff8145ddac>] dump=
_stack+0x4c/0x6e
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc033cc88>] long=
term_unlock_znode+0x738/0xe80 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc036de5c>] scan=
_by_coord+0x62c/0xed0 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc036e86d>] scan=
_unformatted+0x16d/0x320 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc032b1f0>] ? in=
cr_load_count+0x20/0xd0 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc036ed9b>] scan=
_common+0x37b/0x790 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc0370074>] flus=
h_current_atom+0xec4/0x1b40 [reiser4]
<...>

2.
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffff8145ddac>] dump=
_stack+0x4c/0x6e
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc033cc88>] long=
term_unlock_znode+0x738/0xe80 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc036b952>] neig=
hbor_in_slum.constprop.12+0x82/0x1c0 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc036bc4a>] hand=
le_pos_on_formatted+0x1ba/0xa40 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc036c546>] hand=
le_pos_on_leaf+0x16/0x80 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc0370400>] flus=
h_current_atom+0x1250/0x1b40 [reiser4]
<...>

3.
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffff8145ddac>] dump=
_stack+0x4c/0x6e
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc033cc88>] long=
term_unlock_znode+0x738/0xe80 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc032f0c3>] unlo=
ck_carry_level+0xb3/0xd80 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc032fdb0>] done=
_carry_level+0x20/0x1f0 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc0332036>] reis=
er4_carry+0x396/0x7b0 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc032bc0c>] ? re=
iser4_add_obj+0x9c/0x370 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc033fb4a>] inse=
rt_into_item+0x1fa/0x610 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc033ffd4>] reis=
er4_resize_item+0x74/0x190 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc03ec314>] add_=
entry_cde+0x104/0x2f0 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc0329af5>] ? zn=
ode_invariant+0x3a5/0xd50 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc03aa19e>] reis=
er4_rename2_common+0xbce/0x1140 [reiser4]
<...>

4.
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffff8145ddac>] dump=
_stack+0x4c/0x6e
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc033cc88>] long=
term_unlock_znode+0x738/0xe80 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc03f48af>] free=
_item_convert_data+0x3f/0x150 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc03f5656>] deta=
ch_convert_idata+0x26/0x110 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc03fd0f6>] conv=
ert_ctail+0x1016/0x2060 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc03648ba>] conv=
ert_node+0x22a/0xd30 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc032b40d>] ? zr=
else+0x1d/0x70 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc036bfc2>] hand=
le_pos_on_formatted+0x532/0xa40 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc036c546>] hand=
le_pos_on_leaf+0x16/0x80 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc0370400>] flus=
h_current_atom+0x1250/0x1b40 [reiser4]
<...>

5.
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc033cc88>] long=
term_unlock_znode+0x738/0xe80 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc032f0c3>] unlo=
ck_carry_level+0xb3/0xd80 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc032fdb0>] done=
_carry_level+0x20/0x1f0 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc0332036>] reis=
er4_carry+0x396/0x7b0 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc032bc0c>] ? re=
iser4_add_obj+0x9c/0x370 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc033edda>] inse=
rt_with_carry_by_coord+0xea/0x250 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc03d6016>] ? fr=
ee_space_node40+0x16/0x170 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc033f3c6>] inse=
rt_by_coord+0x166/0x360 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc03fa16f>] ctai=
l_insert_unprepped_cluster+0x1df/0x750 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc03c98e3>] prep=
are_logical_cluster+0x753/0x17f0 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc03cabdf>] do_w=
rite_cryptcompress+0x25f/0xed0 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc0347a69>] ? is=
_in_reiser4_context+0x19/0x30 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc03ce8d1>] writ=
e_cryptcompress+0xa1/0x1d0 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc03477fa>] ? _r=
eiser4_init_context+0x6a/0xf0 [reiser4]
Oct 10 00:28:42 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc03bcc66>] reis=
er4_write_dispatch+0x166/0x4f0 [reiser4]
<...>

6.
Oct 10 00:28:43 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffff8145ddac>] dump=
_stack+0x4c/0x6e
Oct 10 00:28:43 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc033cc88>] long=
term_unlock_znode+0x738/0xe80 [reiser4]
Oct 10 00:28:43 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc036611a>] move=
_flush_pos+0xba/0x2c0 [reiser4]
Oct 10 00:28:43 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc036c10e>] hand=
le_pos_on_formatted+0x67e/0xa40 [reiser4]
Oct 10 00:28:43 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc036c546>] hand=
le_pos_on_leaf+0x16/0x80 [reiser4]
Oct 10 00:28:43 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc0370400>] flus=
h_current_atom+0x1250/0x1b40 [reiser4]
<...>

7.
Oct 10 00:28:43 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffff8145ddac>] dump=
_stack+0x4c/0x6e
Oct 10 00:28:43 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc033cc88>] long=
term_unlock_znode+0x738/0xe80 [reiser4]
Oct 10 00:28:43 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc03f48af>] free=
_item_convert_data+0x3f/0x150 [reiser4]
Oct 10 00:28:43 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc03f5656>] deta=
ch_convert_idata+0x26/0x110 [reiser4]
Oct 10 00:28:43 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc03fd0f6>] conv=
ert_ctail+0x1016/0x2060 [reiser4]
Oct 10 00:28:43 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc03648ba>] conv=
ert_node+0x22a/0xd30 [reiser4]
Oct 10 00:28:43 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc0363b9e>] ? zn=
ode_check_flushprepped+0xfe/0x360 [reiser4]
Oct 10 00:28:43 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc036bb28>] hand=
le_pos_on_formatted+0x98/0xa40 [reiser4]
Oct 10 00:28:43 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc036c546>] hand=
le_pos_on_leaf+0x16/0x80 [reiser4]
Oct 10 00:28:43 intelfx-laptop kernel:=C2=A0=C2=A0[<ffffffffc0370400>] flus=
h_current_atom+0x1250/0x1b40 [reiser4]
<...>

...and so on.

I didn't check the code yet; I'll probably try with that assertion converte=
d into warning and split into two
(one for formatted and another for unformatted nodes), so that I could chec=
k what type of nodes is responsible
for generating the final oops in set_page_writeback().

> For unformatted nodes only code review
> can help. Normally, all modifications of unformatted nodes should
> look like the following:
>=20
> struct page *page =3D jnode_page(node);
> lock_page(page);
> char *data =3D kmap(page);
> /* modifications are going here */
> kunmap(page);
> set_page_dirty_nobuffers(page); /* somebody forgets to do this */
> unlock_page(page);
>=20
> Modifications of formatted nodes should look like the following:
>=20
> longterm_lock_znode(node);
> zload(node);
> /* modifications are going here */
> zrelse(node);
> znode_make_dirty(node); /* somebody forgets to do this */
> longterm_unlock_znode();
>=20
> Anyway, we can use your patch 3 as a temporal fixup.

The most persistent things are those conseived as the most temporary
ones... ;)

--=-i70BvAXYpzCVjP4BSaDs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlYY7AcACgkQxUKljSIMAnATUgD+M/hIIw2exjH0WLiHcCyLdCNq
AqbYEfa6FYc1s109Xz4A/22zyc98sRR/wHAtzveC5KGtacsNRSB92GZgkh6cvaQ8
=xTob
-----END PGP SIGNATURE-----

--=-i70BvAXYpzCVjP4BSaDs--

