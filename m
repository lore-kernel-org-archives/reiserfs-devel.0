From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCH 3/3] reiser4: in our own sync writes, mark pages dirty
 before marking them writeback.
Date: Wed, 14 Oct 2015 13:55:48 +0300
Message-ID: <1444820148.4077.1.camel@gmail.com>
References: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>
	 <1444389417-14929-4-git-send-email-intelfx100@gmail.com>
	 <5617C0C1.6060806@gmail.com> <1444398642.6030.3.camel@gmail.com>
	 <5617D55D.2040908@gmail.com> <1444410842.2213.5.camel@gmail.com>
	 <56182257.7060304@gmail.com> <1444473863.4257.10.camel@gmail.com>
	 <561B7857.1030000@gmail.com> <1444817147.5346.10.camel@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-gbD+Swp/FffjCRfy668F"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=gD95KqXHHmKvlVuhUwKTadi+2tvekEbGltwmtNnnlAs=;
        b=sBBOUurQTicKv/wACSXzw9eg+l9tJSUSa4aQMnESWUY8POQomxIRQxvIRVobfAGMbT
         njk8uVgkGs/v9gpTUR9hY7rvIk3bc1Z7cLBvghJdX183FsExq5Di+DfHUyHFYXD/PTJ4
         Vi4bVn2cdJ/RB5l5/6Bp9mJmxpOqzPdXdp2G4BDjX6F2cQhS+5jLvF9nBATuKUTl/+cn
         b1O4OhRKPS/58UoZL73gEvco9aJFq7N3O63dR0mFcICGB3yP2J+sM4Acm3aq7TPoeBOY
         iOmyIhhVaDStu2nVCwxPJLOtX3p1ptrBcjbGKtQGgxcW3DEoeoqFYfawh11i2z+1q68c
         +4pQ==
In-Reply-To: <1444817147.5346.10.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Oleg Drokin <green@linuxhacker.ru>, reiserfs-devel@vger.kernel.org


--=-gbD+Swp/FffjCRfy668F
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-10-14 at 13:05 +0300, Ivan Shapovalov wrote:
> On 2015-10-12 at 11:07 +0200, Edward Shishkin wrote:
> > [...]
>=20
> So, I've added three non-fatal checks right before
> set_page_writeback():
> - PageDirty(pg)
> - JF_ISSET(cur, JNODE_DIRTY)
> - pg->mapping->host->i_wb !=3D NULL
>=20
> In almost all times when either of the checks is triggered,
> the first two checks are triggered at once (i. e. neither page nor
> jnode is dirty, but i_wb is not NULL). This happens with both
> formatted
> nodes (jnode_is_znode), unformatted nodes (jnode_is_unformatted) and
> other nodes.
>=20
> And, finally, there are very few warnings where jnode _is_ dirty, but
> the page _isn't_. On the first such warning i_wb is also NULL. And,
> just as you've suspected, this happens with an unformatted node.
>=20
> I'll try to add a backtrace buffer into struct jnode and generate a
> backtrace there on each jnode dirtying attempt... and then print it
> for
> the problematic jnode.
>=20

So, here it is. On all occurrences the backtrace is the same.

Oct 14 13:51:54 intelfx-laptop kernel: reiser4[xdg-user-dirs-g(2040)]: writ=
e_jnodes_to_disk_extent (fs/reiser4/wander.c:807)[intelfx-8888]:
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0WARNING: on writeback: jnode (unformatted): BAD-PAGE BAD-INODE-i_w=
b
Oct 14 13:51:54 intelfx-laptop kernel: BAD-INODE-i_wb, stacktrace of last j=
node dirtying follows:=C2=A0=C2=A0=C2=A0[<ffffffff8101119a>] save_stack_tra=
ce+0x2a/0x50
Oct 14 13:51:54 intelfx-laptop kernel:=C2=A0=C2=A0=C2=A0=C2=A0[<ffffffffc03=
a5e6f>] jnode_make_dirty_locked+0xcf/0x770 [reiser4]
Oct 14 13:51:54 intelfx-laptop kernel:=C2=A0=C2=A0=C2=A0=C2=A0[<ffffffffc04=
550a1>] insert_first_extent+0x211/0x610 [reiser4]
Oct 14 13:51:54 intelfx-laptop kernel:=C2=A0=C2=A0=C2=A0=C2=A0[<ffffffffc04=
58c21>] reiser4_update_extent+0xe1/0x300 [reiser4]
Oct 14 13:51:54 intelfx-laptop kernel:=C2=A0=C2=A0=C2=A0=C2=A0[<ffffffffc04=
02125>] find_or_create_extent+0xa5/0x800 [reiser4]
Oct 14 13:51:54 intelfx-laptop kernel:=C2=A0=C2=A0=C2=A0=C2=A0[<ffffffffc04=
0733b>] replace+0x11b/0x290 [reiser4]
Oct 14 13:51:54 intelfx-laptop kernel:=C2=A0=C2=A0=C2=A0=C2=A0[<ffffffffc04=
0825a>] tail2extent+0x66a/0xcc0 [reiser4]
Oct 14 13:51:54 intelfx-laptop kernel:=C2=A0=C2=A0=C2=A0=C2=A0[<ffffffffc03=
ffe51>] unpack.isra.6+0x121/0x270 [reiser4]
Oct 14 13:51:54 intelfx-laptop kernel:=C2=A0=C2=A0=C2=A0=C2=A0[<ffffffffc04=
0516d>] mmap_unix_file+0x12d/0x1c0 [reiser4]
Oct 14 13:51:54 intelfx-laptop kernel:=C2=A0=C2=A0=C2=A0=C2=A0[<ffffffffc04=
0bb9e>] reiser4_mmap_dispatch+0x7e/0x320 [reiser4]
Oct 14 13:51:54 intelfx-laptop kernel:=C2=A0=C2=A0=C2=A0=C2=A0[<ffffffff811=
18131>] mmap_region+0x3d1/0x670
Oct 14 13:51:54 intelfx-laptop kernel:=C2=A0=C2=A0=C2=A0=C2=A0[<ffffffff811=
18723>] do_mmap_pgoff+0x353/0x400
Oct 14 13:51:54 intelfx-laptop kernel:=C2=A0=C2=A0=C2=A0=C2=A0[<ffffffff811=
03861>] vm_mmap_pgoff+0x71/0xc0
Oct 14 13:51:54 intelfx-laptop kernel:=C2=A0=C2=A0=C2=A0=C2=A0[<ffffffff811=
16c3d>] SyS_mmap_pgoff+0x1dd/0x250
Oct 14 13:51:54 intelfx-laptop kernel:=C2=A0=C2=A0=C2=A0=C2=A0[<ffffffff810=
08406>] SyS_mmap+0x16/0x20
Oct 14 13:51:54 intelfx-laptop kernel:=C2=A0=C2=A0=C2=A0=C2=A0[<ffffffff814=
63e17>] entry_SYSCALL_64_fastpath+0x12/0x6a

--=20
Ivan Shapovalov / intelfx /


--=-gbD+Swp/FffjCRfy668F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlYeNLQACgkQxUKljSIMAnAoWgEAoQVkOr0jljRzhB+mH+SuEeyP
KyWZJ0CW/X8/xV3sA1MBAIL0n7X0eBFRyURNDO5lyAPdKzEGNBoiMLKHo2AF4vTy
=qGpA
-----END PGP SIGNATURE-----

--=-gbD+Swp/FffjCRfy668F--

