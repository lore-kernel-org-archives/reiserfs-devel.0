From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [xfstests PATCH] generic: add test of file mode when setfacl
 fails
Date: Thu, 13 Jul 2017 04:55:07 -0700
Message-ID: <20170713115507.GA10435@infradead.org>
References: <cover.1499805484.git.ernesto.mnd.fernandez@gmail.com>
 <20170712114719.GA14398@infradead.org>
 <20170713094003.GA4959@debian.home>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-ext4-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
        :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ey8vBuWU8G2W1JA8Q5zGXCPCC2eZQOjmLlR7By1tzQ4=; b=jbCouOEYAICTbxEWI5dCy97Nf2
        SqxCYiRgI7jYmXSO+dyQljLBlRBzS+ahfjQ9N/u3EyhcDBaBWMA3UqkLAFacjy0rpR6p5Z3XIAncE
        2b3SIdg0UCAdHnpnn0HaeRwei3UlAGa9V0P4gegIB7IVoPqXAEx671gCXIx7o7iBATh2RpCD9BcRc
        4KaTYDelUcp5SqjMuc9BoCwQhklVYYHTzejhxk8QqlrsMnSZzQdx2MDzTX1iFReD7H+3TXksabIxL
        OoqVZnTeuck5aBOXPT/tGNKzb26jvNnKpWu1kKHRIPJl1wzo9YcGtI0kbTVlKJfn3UVJoqX7PQuWC
    
Content-Disposition: inline
In-Reply-To: <20170713094003.GA4959@debian.home>
Sender: linux-ext4-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ernesto =?iso-8859-1?Q?A=2E_Fern=E1ndez?= <ernesto.mnd.fernandez@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Dave Kleikamp <shaggy@kernel.org>, linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, reiserfs-devel@vger.kernel.org, fstests@vger.kernel.org

On Thu, Jul 13, 2017 at 06:40:04AM -0300, Ernesto A. Fern=E1ndez wrote:
> Check that the group permission bits of a file are not altered when setfa=
cl
> fails. At the time of this patch the test fails for at least ext2, ext4 a=
nd
> jfs. It is not run against reiserfs, since xfstests claims that "attrs are
> not supported by this filesystem type".

That's odd, as common/config explicitly turns on user xattrs:

        reiserfs)
                # acls & xattrs aren't turned on by default on reiserfs
                export MOUNT_OPTIONS=3D"-o acl,user_xattr $REISERFS_MOUNT_O=
PTIONS"


>=20
> The failure to set acls is induced by filling the device, so to save time
> this should probably be run with a small TEST_DEV.

If you run it on the scratch fs instead of the test fs you can use
_scratch_mkfs_sized to hand craft a small fs, which would be nice
to get a decent runtime.
