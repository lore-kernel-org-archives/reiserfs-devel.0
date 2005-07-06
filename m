From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: reiser4 plugins
Date: Tue, 05 Jul 2005 21:16:21 -0400
Message-ID: <87hdf8zqca.fsf@evinrude.uhoreg.ca>
References: <42CB1E12.2090005@namesys.com> <1740726161-BeMail@cr593174-a>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24977-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1740726161-BeMail@cr593174-a> (Alexander G. M. Smith's message
 of "Tue, 05 Jul 2005 20:50:08 -0400 EDT")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: ross.biro@gmail.com, vonbrand@inf.utfsm.cl, mrmacman_g4@mac.com, Valdis.Kletnieks@vt.edu, ltd@cisco.com, gmaxwell@gmail.com, jgarzik@pobox.com, hch@infradead.org, akpm@osdl.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, ndiller@namesys.com, ninja@slaphack.com

On Tue, 05 Jul 2005 20:50:08 -0400 EDT, "Alexander G. M. Smith" <agmsmith@rogers.com> said:

> That sounds equivalent to no hard links (other than the usual parent
> directory one).  If there's any directory with two links to it, then
> there will be a cycle somewhere!

What we want is no directed cycles.  That is A is the parent of B is the
parent of C is the parent of A.  We don't care about A is the parent of
B is the parent of C; A is the parent of B is the parent of C.

OK, here's a random idea that just popped into my head, and to which
I've given little thought (read: none whatsoever), and may be the
stupidest idea ever proposed on LKML, but thought I would just toss it
out to see if it could stimulate someone to come up with something
better (read: sane):  Conceptually, foo/.... is just a symlink to
/meta/[filesystem]/[inode of foo].

And a question: is it feasible to store, for each inode, its parent(s),
instead of just the hard link count?

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

