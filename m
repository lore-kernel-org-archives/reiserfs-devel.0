From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Help on reiserfs documentation
Date: Tue, 21 Sep 2004 17:02:22 -0400
Message-ID: <415096DE.8090705@suse.com>
References: <1095797478.862934535@as03.coolgoose.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21868-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1095797478.862934535@as03.coolgoose.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mpriyan <mpriyan@coolgoose.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Mpriyan wrote:
| Hello All,
|
| I'm learning about reiserfs. So, I'm looking for some documentation
that can
| explain how the file data is organized on disk in reiserfs 3.6. The
| documentation that is available in www.namesys.com says that it is for
reiserfs 4.
|
| Do reiserfs 3.6 and reiserfs 4 have same ondisk structure ? I
understand that
| they differ in the way they provide the atomicity. But other than that
do they
| have the same layout ?
|
| Does reiserfs 3.6 use B+ tree for storing its data ? In the source code,
| it looks like they use some stree. Are there standard definitions of stree
| ? Or is it a variant of B+ tree with a different name ?
|
| If someone can point me to some documentation, it would be of great help.

There used to be documentation that described this very nicely.
Fortunately, the wayback machine still has it.

Check out:
http://web.archive.org/web/20021013181038/www.namesys.com/content_table.html

Another good source for understanding the format is the reiserfs code in
grub. It's read-only support, which makes the implementation quite small
since it removes most of the complexity in the kernel implementation. If
I recall correctly, the format is even described in the comments.

Hans - Is this information still available at namesys.com? I understand
that you're primarily supporting reiser4, but all the information
previously online about reiser3 is still valuable.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBUJbeLPWxlyuTD7IRAhDiAJ9K/L2sM3T7z4cU9t/oI/8NuXUiXwCfZmuN
W4W60G5XqtO03rHjD4oVhq4=
=lVWJ
-----END PGP SIGNATURE-----
