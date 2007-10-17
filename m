From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: 2.6.23-mm1: BUG in reiserfs_delete_xattrs
Date: Wed, 17 Oct 2007 10:55:03 -0400
Message-ID: <47162247.1070006__19208.385636057$1192632812$gmane$org@suse.com>
References: <20071011213126.cf92efb7.akpm@linux-foundation.org> <47129992.4040903@free.fr> <20071015084052.GA21870@infradead.org> <4713B1E7.2010504@suse.com> <20071017085832.GA8072@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20071017085832.GA8072@infradead.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>, Jeff Mahoney <jeffm@suse.com>, Laurent Riffard <laurent.riffard@free.fr>, Andrew Morton <akpm@linux-foundation.org>, Dave Hansen <haveblue@us.i>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Christoph Hellwig wrote:
> On Mon, Oct 15, 2007 at 02:31:03PM -0400, Jeff Mahoney wrote:
>> Here's a patch I worked up the other night that kills off struct file
>> completely from the xattr code. I've tested it locally.
> 
> Looks like a merge of Dave's and my patch :)
> 
> ACK from me, I don't care whether it's one or two patches.

Yeah, it probably is. I did it from scratch since it was my mess, and
the patches I saw were against -mm.

*shrug* Likewise, I don't care if it's one or two.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFHFiJHLPWxlyuTD7IRAojqAJwKS+eL1yCtUVHzBSFUxjjkW6KgPwCcDRUE
Q1V7tCPcT9h0a8ahVmYn+ms=
=5kMt
-----END PGP SIGNATURE-----
