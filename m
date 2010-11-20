From: Jeff Mahoney <jeffm@suse.com>
Subject: [RFC] reiserfs 3.7
Date: Sat, 20 Nov 2010 11:05:23 -0500
Message-ID: <4CE7F1C3.2010701@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi all -

I recently posted about wanting to extend the maximum supported file
size from the 2 TB limit it currently has to the advertised maximum of 8
TB. This turned out to be a flop since the file system format uses 512
byte blocks in the stat data's sd_blocks field. The format supports
larger file sizes in general, but this field is a stumbling block. Users
are trying to work within reiserfs's advertised limits and discovering
that the limits aren't as accurate as we thought.

I commented during that thread about how I should have created a v3.7
years ago when I first wrote the hack that is extended attributes.

So, I have. See the following posts. The initial version doesn't have
any extended features - it just adds a new magic number and the feature
bitmasks to the superblock. It follows the ext[234] system of feature
bits to define which features are supported on the file system.

I also have fsck support written but it is pretty untested still. Before
I invest more effort in this, I'd like to get a consensus of whether or
not this is desirable feature.

My intention is that, once this is upstream, to backport it to our
earlier products to enable things like the 8 TB limit.

The idea is to be able to convert an existing 3.6 file system to 3.7 ,
just like the 3.5->3.6 conversion. For features like the blocksize
sd_blocks field, fsck --fix-fixable would adjust all the sd_blocks
values on the file system.

- -Jeff

- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org/

iEYEARECAAYFAkzn8cMACgkQLPWxlyuTD7IbVQCeLzzKRNY6qUrmVFVBDRGoUOCQ
WmQAoJ0oqGcLGfcNSmWxuwoF1du0jUFz
=HlOp
-----END PGP SIGNATURE-----
