From: Hans Reiser <reiser@namesys.com>
Subject: Re: warning: Invalid hash for xattr (system.posix_acl_access) associated
 with [1070 1541 0x0 SD] after extending device
Date: Sun, 21 Nov 2004 09:06:50 -0800
Message-ID: <41A0CB2A.1000602@namesys.com>
References: <200411171931.52943.js@jetsys.de> <419BCCCB.40103@novell.com> <200411210905.36202.js@jetsys.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22467-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200411210905.36202.js@jetsys.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?J=F6rg_Spilker?= <js@jetsys.de>
Cc: Jeff Mahoney <jeffm@novell.com>, reiserfs-list@namesys.com

J=F6rg Spilker wrote:

>Am Mittwoch, 17. November 2004 23:12 schrieben Sie:
>
>Hello Jeff,
>
> =20
>
>>You can use debugreiserfs to track down the file with that key by using
>>debugreiserfs -d <device> and looking for the objectid. Once you find
>>the directory listing with that key, you should be able to find the file.
>>
>>When you've located the filename, a setfattr -x system.posix_acl_access
>><file> followed by the appropriate setfacl command will reset the ACL.
>>   =20
>>
>
>thanks for your help. I could fix the problem using debugreiserfs
>
>Greetings, J=F6rg
>
>btw: your email is bouncing (unknown user).
>
>
> =20
>
I am concerned that this constitutes ignoring a bug report by fixing the=20
symptoms and not finding the bug.
