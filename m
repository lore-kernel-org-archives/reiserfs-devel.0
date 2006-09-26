From: James Beal <james_@catbus.co.uk>
Subject: Re: Reiser (3.6) PANIC.
Date: Tue, 26 Sep 2006 13:38:57 +0100
Message-ID: <45191F61.90406@catbus.co.uk>
References: <451860D5.2060305@catbus.co.uk> <4518DB3B.3070808@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29982-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4518DB3B.3070808@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Edward Shishkin wrote:
> James Beal wrote:
>
>> This occurrs when trying to delete some files, repeatedly even after a
>> /sbin/reiserfsck --rebuild-tree ?
>> Any hints ?
>>
>
> Would you please upgrade your kernel to the latest stable version.
> I believe this bug is fixed there.

Thanks for the quick reply.

Once I have upgraded the Kernel do I need to.

1) Upgrade the support utilities
2) Re-do a reiserfsck on the partition?

james

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (Darwin)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFFGR9h3PHqsTsIeJ4RAumrAJ46KovCECnHcANTosNX1sNNEBa01gCdHAAO
cR+mydu6/YLk93n1wbfb/FU=
=AYqO
-----END PGP SIGNATURE-----
