From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCH 3/3] reiser4: in our own sync writes, mark pages dirty
 before marking them writeback.
Date: Fri, 09 Oct 2015 20:14:02 +0300
Message-ID: <1444410842.2213.5.camel@gmail.com>
References: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>
	 <1444389417-14929-4-git-send-email-intelfx100@gmail.com>
	 <5617C0C1.6060806@gmail.com> <1444398642.6030.3.camel@gmail.com>
	 <5617D55D.2040908@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-dixjV4fxnrHl7R9CDbog"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=NwrvvUXnOp4gqvvoVx0sRW3jEe5n5iLxvJyQ4igyjS4=;
        b=sU1iZ9VXhPEU9eEfgzGJGeHkj2YYuVwKx93NriBL3zwyvEEw1WqX5FbotzPlbo3QHf
         2WF+m8wXNGh8S6945QwYnLzuW9rFPgYOcMBaVnPAmLFzYZIEyp+dlqC2qBCB6BrSftoR
         mM2fsCUhIeuq+CuhmgGzl4Wl16z/C+BgXnFDzX+XyC6l+MDdl6DTKcIbDw2NFcDaBJii
         vHeEjAxsvHLtnnIYjkzjDXV3vqOrqQWMMX2WWge2S2JKRbh+9jvdoSUKwbVBucnykvhU
         sccHjfaBmTxECKuhDfWEyxIykeAsLaADobcNCzjTbvFjAZ9+EylkLr3s1ZKriVkIFUYh
         SMOA==
In-Reply-To: <5617D55D.2040908@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org
Cc: Oleg Drokin <green@linuxhacker.ru>


--=-dixjV4fxnrHl7R9CDbog
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-10-09 at 16:55 +0200, Edward Shishkin wrote:
>=20
> On 10/09/2015 03:50 PM, Ivan Shapovalov wrote:
> > On 2015-10-09 at 15:27 +0200, Edward Shishkin wrote:
> > > Hi Ivan,
> > >=20
> > > On 10/09/2015 01:16 PM, Ivan Shapovalov wrote:
> > > > Ref.: https://www.mail-archive.com/linux-f2fs-devel%40lists.sou
> > > > rcef
> > > > orge.net/msg02745.html
> > > Do you have a stack trace for reiser4?
> > > How to reproduce it?
> > I'll rebuild the kernel without the fix and provide you with the
> > oops'
> > stacktrace asap.
> >=20
> > I guess that it's tied to the config. In my case, it is
> > reproducible on
> > each boot, just as the DE starts up and something issues the first
> > fsync().
>=20
>=20
> Yes, let's try to find the culprit who doesn't set i_wb...

So, here are the traces I've got after adding an
assert(PageDirty(node->pg)) to queue_jnode():
/* captured by hand as these are panics, not oopses */

1.

queue_jnode()
unformatted_make_reloc()
assign_real_blocknrs()
forward_relocate_unformatted()
forward_alloc_unformatted_journal()
? coord_num_units()
handle_pos_on_twig()
flush_current_atom()
flush_some_atom()
reiser4_writeout()
reiser4_writeback_inodes()
<...>

2.

znode_make_reloc()
forward_alloc_formatted_wa()
? zload_ra()
allocate_znode()
alloc_pos_and_ancestors()
flush_current_atom()
reiser4_txn_end()
? reiser4_txn_end()
reiser4_txn_restart_current()
force_commit_atom()
? reiser4_txn_restart_current()
txnmgr_force_commit_all()
writepages_cryptcompress()
reiser4_writepages_dispatch()
<...>
sys_fsync()

--=20
Ivan Shapovalov / intelfx /


--=-dixjV4fxnrHl7R9CDbog
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlYX9doACgkQxUKljSIMAnCgeAD/WAsG6KTa/6DuuY6bJvm0gDDK
6uHkqJpeoYoOaUDmCKgBANrGD1sR7CN3VxzU9yYlPvlIzaJ7qsjU2jPaatdrHb5n
=NcmI
-----END PGP SIGNATURE-----

--=-dixjV4fxnrHl7R9CDbog--

