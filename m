From: =?iso-8859-1?q?J=F6rg_Spilker?= <js@jetsys.de>
Subject: Re: warning: Invalid hash for xattr (system.posix_acl_access) associated with [1070 1541 0x0 SD] after extending device
Date: Sun, 21 Nov 2004 09:05:35 +0100
Message-ID: <200411210905.36202.js@jetsys.de>
References: <200411171931.52943.js@jetsys.de> <419BCCCB.40103@novell.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22459-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <419BCCCB.40103@novell.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jeff Mahoney <jeffm@novell.com>
Cc: reiserfs-list@namesys.com

Am Mittwoch, 17. November 2004 23:12 schrieben Sie:

Hello Jeff,

> You can use debugreiserfs to track down the file with that key by using
> debugreiserfs -d <device> and looking for the objectid. Once you find
> the directory listing with that key, you should be able to find the file.
>
> When you've located the filename, a setfattr -x system.posix_acl_access
> <file> followed by the appropriate setfacl command will reset the ACL.

thanks for your help. I could fix the problem using debugreiserfs

Greetings, J=F6rg

btw: your email is bouncing (unknown user).
