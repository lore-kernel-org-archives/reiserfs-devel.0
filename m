From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: reiser4 plugins
Date: Wed, 06 Jul 2005 16:57:20 -0400
Message-ID: <87ekabejpr.fsf@evinrude.uhoreg.ca>
References: <42CB1E12.2090005@namesys.com> <1740726161-BeMail@cr593174-a>
	<87hdf8zqca.fsf@evinrude.uhoreg.ca> <42CB7DE0.4050200@namesys.com>
	<1120675943.13341.10.camel@localhost>
	<87mzozemqp.fsf@evinrude.uhoreg.ca>
	<1120681998.13341.23.camel@localhost>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25009-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1120681998.13341.23.camel@localhost> (Jonathan Briggs's
 message of "Wed, 06 Jul 2005 14:33:18 -0600")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: "Alexander G. M. Smith" <agmsmith@rogers.com>, ross.biro@gmail.com, vonbrand@inf.utfsm.cl, mrmacman_g4@mac.com, Valdis.Kletnieks@vt.edu, ltd@cisco.com, gmaxwell@gmail.com, jgarzik@pobox.com, hch@infradead.org, akpm@osdl.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, ndiller@namesys.com, ninja@slaphack.com, vitaly@thebsh.namesys.com

On Wed, 06 Jul 2005 14:33:18 -0600, Jonathan Briggs <jbriggs@esoft.com> said:

> On Wed, 2005-07-06 at 15:51 -0400, Hubert Chan wrote:
>> On Wed, 06 Jul 2005 12:52:23 -0600, Jonathan Briggs
>> <jbriggs@esoft.com> said:
> [snip]
>>> It still has the performance and locking problem of having to
>>> update every child file when moving a directory tree to a new
>>> parent.  On the other hand, maybe the benefit is worth the cost.

>> Every node should store the inode number(s) for its parent(s).  Not
>> the path name.  So you don't need to do any updates, since when you
>> move a tree, inode numbers don't change.

> You do need the updates if you change what inode is the parent.

> /a/b/c, /a/b/d, /a/b/e, /b
> mv /a/b /b
> Now you have to change the stored grand-parent inodes for /a/b/c,
> /a/b/d and /a/b/e so that they reference /b/b instead of /a/b.

Don't store (great)*grand-parent pointers; only parent pointers.  c
points to b, b points to a, a points to root.  c doesn't need to know
about /a or root directly.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

