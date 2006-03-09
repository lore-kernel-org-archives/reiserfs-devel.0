From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH 00/11] reiserfs: xattr rework
Date: Thu, 09 Mar 2006 14:11:33 -0500
Message-ID: <44107DE5.7040707@suse.com>
References: <20060301123406.GA20367@atrey.karlin.mff.cuni.cz> <44076975.70609@suse.com> <20060303002917.GD4261@atrey.karlin.mff.cuni.cz> <4407944F.5030206@suse.com> <20060303100407.GF2855@atrey.karlin.mff.cuni.cz> <4408C080.4070600@suse.com> <20060306115926.GL1175@atrey.karlin.mff.cuni.cz> <440DFD7A.9040000@suse.com> <20060308182014.GC14184@atrey.karlin.mff.cuni.cz> <440F2C81.3@suse.com> <20060308231426.GI14934@schatzie.adilger.int> <44107366.5090407@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28239-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44107366.5090407@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Andreas Dilger <adilger@clusterfs.com>, Jan Kara <jack@suse.cz>, ReiserFS List <reiserfs-list@namesys.com>, "E. Gryaznova" <grev@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
> All of this is why xattrs should not be implemented without first
> implementing plugins.:-/
> 
> Really guys, there was a reason for my not wanting xattrs to go into
> V3.  Do you see it now?  This is what happens when marketing determines
> feature ship schedules.  You could implement this xattr stuff in V4 in
> 1/5th the time, 5 times the performance, and twice the elegance.   Of
> course, implementing them as pseudo files would be far more elegant
> still....

And as I've said before, Hans, if the original code base was capable of
supporting the plethora of items the white paper hyped, we wouldn't have
run into this problem either.

I would have loved to have implemented xattrs as another item type, but
as soon as I did that, the kernel crashed almost instantly on not
recognizing the new item type in the balance code. While it was
certainly fixable in that version, properly fixing it would have
required a ReiserFS 3.7 with capability bits similar to ext[23]. Looking
back, maybe that wouldn't have been such a bad thing.

As for waiting for v4, we've been through this before. Users wanted ACLs
on ReiserFS yesterday, and I'd hardly brush aside features that users
have been demanding as marketing. There's no denying that a
reiser4-based solution would have been cleaner, but sometimes we just
have to make do with what we've got.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFEEH3lLPWxlyuTD7IRAgz6AJ4l4/f92LJAKs65OqAbl8cIIL1PRACdE5Yb
MmQcruV2Nmd2l3RS+V0TYrI=
=ujKr
-----END PGP SIGNATURE-----
