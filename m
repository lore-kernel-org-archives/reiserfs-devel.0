From: James Beal <james_@catbus.co.uk>
Subject: Re: Reiser (3.6) PANIC.
Date: Thu, 28 Sep 2006 22:21:30 +0100
Message-ID: <451C3CDA.1030309@catbus.co.uk>
References: <451860D5.2060305@catbus.co.uk> <4518DB3B.3070808@namesys.com> <45191F61.90406@catbus.co.uk> <45193922.7040504@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29985-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <45193922.7040504@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Edward Shishkin wrote:
> James Beal wrote:
>
>> Edward Shishkin wrote:
>>
>> >James Beal wrote:
>>
>> >>This occurrs when trying to delete some files, repeatedly even
>> after a
>> >>/sbin/reiserfsck --rebuild-tree ?
>> >>Any hints ?
>> >>
>> >Would you please upgrade your kernel to the latest stable version.
>> >I believe this bug is fixed there.
>>
The bug is fixed in 2.6.18 which I built. But not
(2.6.9-42.0.2.plus.c4) which is the latest standard centos/redhat
kernel that support reiserfs.

Thank you.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (Darwin)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFFHDza3PHqsTsIeJ4RAjIjAKCFFOAOHvLn7CHaS+Nk6dN0YIKNzwCdHr5x
QHZvGAuzRqpU89g44mtcDT4=
=HXzp
-----END PGP SIGNATURE-----

