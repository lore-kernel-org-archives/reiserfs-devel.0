From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Reiser4 ACL-Support
Date: Wed, 15 Sep 2004 11:50:39 -0400
Message-ID: <414864CF.1080606@suse.com>
References: <200409151540.58354.marcel@hilzinger.hu> <41484A7F.5080605@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21781-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41484A7F.5080605@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Marcel Hilzinger <marcel@hilzinger.hu>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
| Marcel Hilzinger wrote:
|
|> I found this in
|>
|> http://thebsh.namesys.com/snapshots/2004.02.06/READ.ME:
|>
|> reiser4 supports extended file attributes and POSIX acls with mount
|> options
|>   "xattr", and "acl" respectively. We are not going to maintain this
|>   interface though. Reiser4 specific interface will be ultimately used
|>   instead.
|>
|> Am I right, that in the final version there is no ACL-Support?
|> No more or -- not yet...
|>
|>
|>
|>
| There is no acl support yet, and when it exists (it will) it will not
| use the xattrs interface.

Hans -

I hate to keep beating a dead horse on this, but it needs to be brought
up again. I agree with you that the xattr interface isn't as elegant as
the files-as-directories solution, but the fact of the matter is that
there is a defined method of exporting xattrs and ACLs to userspace.
Many tools have already been modified to use it, and users aren't going
to want a filesystem specific utility to manage metadata that other
filesystems provide in a standard API. I know I don't want to use
'reiser4ls' to see if files have ACLs.

I suspect that if such an interface is not provided, there will be an
external patch to implement it. It might as well be officially
supported. If, at some point, the battle is won for
files-as-directories, then you can deprecate it.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBSGTPLPWxlyuTD7IRArYSAJ9r+bS5/oJ9jT3AfGUlNdcMCaQiVgCeMxIn
YSeSc2SahHpRBHk9kyMFABk=
=Bq4z
-----END PGP SIGNATURE-----
