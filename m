From: Valdis.Kletnieks@vt.edu
Subject: Re: Writeback cache, SCSI, and ReiserFS
Date: Wed, 16 Oct 2002 02:59:53 -0400
Message-ID: <200210160659.g9G6xrCH004869@turing-police.cc.vt.edu>
References: <20021016053312.CCE9A1AEC187@server5.fastmail.fm>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_31944878P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11713-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Wed, 16 Oct 2002 05:33:12 -0000."
             <20021016053312.CCE9A1AEC187@server5.fastmail.fm> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: JP Howard <jh_lists@fastmail.fm>
Cc: ReiserFS List <reiserfs-list@namesys.com>, Rob Mueller <robm@fastmail.fm>

--==_Exmh_31944878P
Content-Type: text/plain; charset=us-ascii

On Wed, 16 Oct 2002 05:33:12 -0000, JP Howard said:

> Now, according to our RAID controller (MegaRAID Series 475), we have
> writeback cache turned on. 

OK.. that's a good start..

> Curiously, scsiinfo says that write cache is *not* turned on, despite

but bad news here..

> Has anyone dealt with this issue before? Are we correct that fsync()
> should return immediately when using writeback cache? Any ideas on where
> to look for a solution?

If your kernel is convinced you don't have writeback cache, it doesn't have
much choice but to actually do something when you call fsync().  I'd start
by figuring out why scsiinfo thinks it's off - you won't get anyplace until
you get that issue resolved.

Even if you have a writeback cache, I don't think it does you any good.
Looking in fs/buffer.c, and the code in drivers/scsi/*, it looks like you
don't have a choice but to sit and wait in sync_buffers() if any blocks
have been dirtied but are still in the in-buffer cache.  If there's any
dirtied buffers, you *have* to wait.  At *best*, you can stop waiting when
the disk reports the buffer is in the writeback cache, rather than being
paranoid and waiting until the disk reports the buffer is actually scribed
on the oxide of the platter.  However, my 2:30AM reading of the scsi driver
code doesn't indicate any way to detect anything more specific than "the
disk drive said it got there OK" (and the disk is allowed to waffle on
what the definition of 'there' is).
-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_31944878P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE9rQ5pcC3lWbTT17ARAvgOAKD7DuJs5IlR1vIv6+zSGoeksg8vpgCfXdgH
XEXn3lG+P/VJSoDphVA225Q=
=v3DX
-----END PGP SIGNATURE-----

--==_Exmh_31944878P--
