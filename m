From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: 2.6.23-mm1: BUG in reiserfs_delete_xattrs
Date: Mon, 15 Oct 2007 16:23:15 -0400
Message-ID: <4713CC33.4040900@suse.com>
References: <20071011213126.cf92efb7.akpm@linux-foundation.org> <47129992.4040903@free.fr> <20071015084052.GA21870@infradead.org> <4713B1E7.2010504@suse.com> <4713C82C.7020609@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4713C82C.7020609@free.fr>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Laurent Riffard <laurent.riffard@free.fr>
Cc: Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Dave Hansen <haveblue@us.ibm.com>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Laurent Riffard wrote:
> Le 15.10.2007 20:31, Jeff Mahoney a =E9crit :
>> Christoph Hellwig wrote:
>>> On Mon, Oct 15, 2007 at 12:34:58AM +0200, Laurent Riffard wrote:
>>>> reiserfs_delete_xattrs
>>>> reiserfs_delete_inode
>>>> generic_delete_inode
>>>> generic_drop_inode
>>>> iput
>>>> do_unlinkat
>>>> sys_unlink
>>>> sys_enter_past_esp
>>>>
>>>> I reported a similar BUG in 2.6.22-rc8-mm2 (see
>>>> http://lkml.org/lkml/2007/9/27/235). Dave Hansen sent a patch for =
it, I
>>>> tested it and it was OK for 2.6.22-rc8-mm2.
>>>>
>>>> I tried this patch on 2.6.23-mm1, and it fixed the BUGs here too.
>>> The delete path is a similar case as the one Dave fixed, also cause=
 by
>>> a NULL vfsmount passed to dentry_open, but through a different code=
-path.
>>>
>>> Untested fix for this problem below:
>> Here's a patch I worked up the other night that kills off struct fil=
e
>> completely from the xattr code. I've tested it locally.
>=20
> Sorry Jeff, your patch does not apply on 2.6.23-mm1. The 'struct file=
'
> removal from reiserfs_xattr_ function is already in -mm
> (make-reiserfs-stop-using-struct-file-for-internal.patch).
>=20
> The Dave's patch I was refering to is this one:=20

I'd guess not. This patch was actually against mainline. I should've
specified. I can work up one against -mm later today if it's needed.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFHE8wyLPWxlyuTD7IRAiJrAJ4nC6gwH1cFjWx6BI04O5fDIRftmACcD2wb
whyXThHlIBK2phnZ6Pf8Pb8=3D
=3DKx6k
-----END PGP SIGNATURE-----
-
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
