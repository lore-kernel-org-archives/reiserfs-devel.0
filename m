From: Ernesto =?utf-8?Q?A=2E_Fern=C3=A1ndez?= 
        <ernesto.mnd.fernandez@gmail.com>
Subject: Re: [xfstests PATCH] generic: add test of file mode when setfacl
 fails
Date: Fri, 14 Jul 2017 02:40:12 -0300
Message-ID: <20170714054011.GA4973@debian.home>
References: <cover.1499805484.git.ernesto.mnd.fernandez@gmail.com>
 <20170712114719.GA14398@infradead.org>
 <20170713094003.GA4959@debian.home>
 <20170713115507.GA10435@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <fstests-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=VKiyVvmejzBQOjoYy9RWcKBCAZ+bCwmYQqvbzpjcujQ=;
        b=Dt25tfxS4fpFW6VfIvjRPrjrZBvTc6VuSavlpGgP+Hc61KjAF4qt6a+kX95uh9BAS+
         ZAvn+kVQPzqlIv1V3mW/QY8fqsw37SAai8KG+vAbYMhtXlZaEluVK3XbFo3EzgRKOzvj
         GkTsqWylJwJdqDJUgT0fryQHaeXMGx/mLxgMMydD8QdjlSH0iUX6poKfFDKsyMBMfWJP
         FCJXIoeZF0TN9u9AES+YI0jHiLzKEjs0zEYoO9TiF1aApr/UjIWfQgqjRAnsYh7kG6EU
         cVbwLLRcxTOunVCTPm73TVcFZyyrru+SwCzDjr8cQYzsl67uAQ3K1+ZYsaki5YbJF0EP
         5ruw==
Content-Disposition: inline
In-Reply-To: <20170713115507.GA10435@infradead.org>
Sender: fstests-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Christoph Hellwig <hch@infradead.org>
Cc: Ernesto =?utf-8?Q?A=2E_Fern=C3=A1ndez?= <ernesto.mnd.fernandez@gmail.com>, Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Dave Kleikamp <shaggy@kernel.org>, linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, reiserfs-devel@vger.kernel.org, fstests@vger.kernel.org

On Thu, Jul 13, 2017 at 04:55:07AM -0700, Christoph Hellwig wrote:
> On Thu, Jul 13, 2017 at 06:40:04AM -0300, Ernesto A. Fern=C3=A1ndez wrote:
> > Check that the group permission bits of a file are not altered when set=
facl
> > fails. At the time of this patch the test fails for at least ext2, ext4=
 and
> > jfs. It is not run against reiserfs, since xfstests claims that "attrs =
are
> > not supported by this filesystem type".
>=20
> That's odd, as common/config explicitly turns on user xattrs:
>=20

xfstests decides if a filesystem supports attributes by trying to set them =
on
the root inode, but reiserfs does not allow this. If this is actually the
intended behaviour of reiserfs then xfstests should use a different check, =
but
I'm guessing it's a bug, perhaps in mkfs.reiserfs.

>=20
> >=20
> > The failure to set acls is induced by filling the device, so to save ti=
me
> > this should probably be run with a small TEST_DEV.
>=20
> If you run it on the scratch fs instead of the test fs you can use
> _scratch_mkfs_sized to hand craft a small fs, which would be nice
> to get a decent runtime.

That's much better, thank you. I will send a revision soon. For some reason
_scratch_mkfs_sized did not have support for jfs, but it was trivial to add.
