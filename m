From: Valdis.Kletnieks@vt.edu
Subject: Re: Snapshots a la NetApp?
Date: Wed, 26 Mar 2003 17:45:32 -0500
Message-ID: <200303262245.h2QMjWBa012814@turing-police.cc.vt.edu>
References: <200303221822.34401.phma@webjockey.net> <33433.10.20.2.148.1048390681.squirrel@alpha> <1048411014.1427.5.camel@wusel.schnulli.de> <3E7F6F66.5050808@namesys.com> <1048542143.1332.31.camel@wusel.schnulli.de> <3E7FC055.2030903@namesys.com> <1048688107.8495.29.camel@kakapo.schnulli.de>
            <3E81F356.8090002@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_240648888P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13401-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Wed, 26 Mar 2003 21:37:10 +0300."
             <3E81F356.8090002@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

--==_Exmh_240648888P
Content-Type: text/plain; charset=us-ascii

On Wed, 26 Mar 2003 21:37:10 +0300, Hans Reiser said:
> Heinz-Josef Claes wrote:
> >btw: The only handycap of the used method is that all the links to a
> >file can have only *one* set of permissions (chmod, chown). Will it be
> >possible to change this with a loadable module in reiser4?

> I am not sure if we will support that.  If someone wanted to write the 
> code to do it, then I could examine the problem more closely and it 
> could be done.....

Please don't.

There is just *WAY* too much Unix/Linux semantics that are dependent on the
concept that an inode describes a file, with all it implies - the fact that all
hard links have the same owner/perms (hint - how would you store 2 inodes that
had different owner/perm/mtime/ctime/etc but the same block list, and still
have it fsck correctly?  If you have a linked list of owners/perms, how do you
determine which one to use? etc etc..)  I'm not even going into the aspects
like programs that creat() and then unlink() in order to get a anonymous temp
file that goes away at last close, etc etc....

You want different permissions, use ACLs.


--==_Exmh_240648888P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE+gi2McC3lWbTT17ARAknZAJ9tOD40qJF0rJnGVkMjO1VD0XgdvgCfZWn5
Zxxx5anLMdI57Yskd5pLtbY=
=MVLm
-----END PGP SIGNATURE-----

--==_Exmh_240648888P--
