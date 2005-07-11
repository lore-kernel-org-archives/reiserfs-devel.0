From: Stefan Smietanowski <stesmi@stesmi.com>
Subject: Re: reiser4 plugins
Date: Mon, 11 Jul 2005 06:07:08 +0200
Message-ID: <42D1F06C.9010905@stesmi.com>
References: <hubert@uhoreg.ca>	<200506290509.j5T595I6010576@laptop11.inf.utfsm.cl>	<87hdfgvqvl.fsf@evinrude.uhoreg.ca>	<8783be6605062914341bcff7cb@mail.gmail.com>	<878y0svj1h.fsf@evinrude.uhoreg.ca> <42C4F97B.1080803@slaphack.com> <87ll4lynky.fsf@evinrude.uhoreg.ca> <42CB0328.3070706@namesys.com> <42CB07EB.4000605@slaphack.com> <42CB0ED7.8070501@namesys.com> <42CB1128.6000000@slaphack.com> <42CB1C20.3030204@namesys.com> <42CB22A6.40306@namesys.com> <42CBE426.9080106@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25080-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42CBE426.9080106@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Hans Reiser <reiser@namesys.com>, Hubert Chan <hubert@uhoreg.ca>, Ross Biro <ross.biro@gmail.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Kyle Moffett <mrmacman_g4@mac.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>, Nate Diller <ndiller@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

> Ok, still haven't heard much discussion of metafs vs file-as-directory,
> but it seems like it'd be easier in metafs.

Why not implement it inside the directory containg the file ?

Ie the metadata for /home/stesmi/foo is in /home/stesmi/.meta/foo

This should be suit both camps I'd think?

I mean, editing something is easy and you don't have to "know" how
to navigate /meta and you don't have the clash of files vs metadata
(is /meta/vfs/home/stesmi/foo a file or an attribute called foo of
the dir stesmi ?).

/home/stesmi/foo <- dir
/home/stesmi/.meta/foo <- "dir" containing all metadata
/home/stesmi/.meta/foo/attrib <- some attribute called attrib
/home/stesmi/foo/bar <- file
/home/stesmi/foo/.meta/bar <- "dir" containg all metadata
/home/stesmi/foo/.meta/bar/attrib <- some attribute called attrib

The file is $dir/$file. The attrib dir is $dir/.meta/$file.
The attribute is $dir/.meta/$file/$attribute.

If $attrib is something user-editable it's easy to
$EDITOR $dir/.meta/$file/$attrib

If this has already been taken up, I must've missed it.

// Stefan
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (MingW32)

iD8DBQFC0fBsBrn2kJu9P78RAlt4AJ4qWik6hA4oXBNZMdZ1TkweYrJHmgCdFAY+
m+Qtg9uqBq9m0qKfRkK6iUI=
=ghWb
-----END PGP SIGNATURE-----
