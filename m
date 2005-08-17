From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Reiser 3 and ACLs slow
Date: Wed, 17 Aug 2005 14:06:31 -0400
Message-ID: <43037CA7.7090905@suse.com>
References: <430372A4.1020202@perkel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25545-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <430372A4.1020202@perkel.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marc Perkel <marc@perkel.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marc Perkel wrote:
> I'm trying Reiser 3 and ACLs and the file system got really slow. Is
> thios typical for ACLs and reiser 3 to slow dow a lot? Is there some
> trick I'm missing?
> 
> 

Sorry, but unfortunately it's typical. Reiser3 extended attributes had
to be implmented using hidden, regular files. So, when you create a file
in a directory with a default ACL, it's actually creating 3 files and a
directory. However, once the ACL is in memory, it stays there as long as
the inode is cached. For heavy creation activity, Reiser3 ACL
performance is abysmal.

Reiser3 *should* have been able to have ACLs implemented as another item
type, but the implementation has item types hard coded and it would
panic older systems if another item type was added.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFDA3ymLPWxlyuTD7IRArDnAJ99pwYlXwTkObyiWelD5WgikiChVQCeNfTV
pwMGNT9leUNOXmd2kRD9DRQ=
=1eGt
-----END PGP SIGNATURE-----
