From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Multiple data streams...
Date: Wed, 02 Apr 2003 11:12:29 -0500
Message-ID: <3E8B0BED.2070004@suse.com>
References: <6167696812.20030402112847@tnonline.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig84EDE68C224D5C573A0EB4C2"
Return-path: <reiserfs-list-return-13530-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <6167696812.20030402112847@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

--------------enig84EDE68C224D5C573A0EB4C2
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Anders Widman wrote:
>    Is this supported, or will it be supported by ReiserFS?
>    I  use  this  feature quite quite much.. Maybe this is something to
>    add to ReiserFS?
> 
>    There is very brief info at Microsoft's website:
> 
>    http://www.microsoft.com/windows2000/techinfo/reskit/en-us/core/fncc_fil_khzt.asp

	I have an implementation of extended attributes that has been included 
in the SuSE kernel for some time now. It's not at all suitable for 
filestreams with a lot of data, as the Linux extended attribute 
interface requires that the entire attribute be read and written in one 
chunk. However, for small things, such as mime type, email sender, and 
perhaps even small thumbprints, this wouldn't be a problem. The sizes of 
xattrs in my implementation aren't limited in size, as they are 
implemented as regular files in a hidden tree. [*]

	The patches are against the SuSE kernel at the moment, but if there's 
enough interest, I could split them out to depend on the generic  ACL/EA 
patches from Andreas Gruenbacher and Chris Mason's data logging and 
quota patches.

	I suppose that since the xattr files are normal files, it would be 
pretty easy to implement a "datastream" xattr that could be accessed 
using normal tools. The semantics could be similar to the windows 
implementation, e.g. /foo/bar/file:datastream1 (Lookup the file verbatim 
first, then try datastreams) However, since most of the userspace tools 
are unaware of xattrs, the same restrictions that apply for any other 
xattr apply: they'll be lost if you copy/backup with tools that don't 
know about them.

	-Jeff

[*] My design requirements included not forking the filesystem in an 
incompatible manner, this was the best way I came up with. If a 
filesystem with xattrs on it is mounted with them disabled or by a 
kernel that doesn't support them, the xattrs appear in a tree owned by 
root (mode 700), with all the files owned by the user owning the file 
that the xattr is associated with.

-- 
jeffm@suse.com
jeffm@csh.rit.edu

--------------enig84EDE68C224D5C573A0EB4C2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE+iwvxLPWxlyuTD7IRArCCAKCHM+qBNE0nYLc7CQw5mV7L2tbyKACdH4WO
UzE+2Xu844qrQe87NzPe5gs=
=fAMt
-----END PGP SIGNATURE-----

--------------enig84EDE68C224D5C573A0EB4C2--

