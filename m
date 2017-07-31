From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: [PATCH 1/5] ext4: preserve i_mode if __ext4_set_acl() fails
Date: Sun, 30 Jul 2017 22:44:47 -0400
Message-ID: <20170731024447.h4fiawhm6lcavahk@thunk.org>
References: <cover.1499805484.git.ernesto.mnd.fernandez@gmail.com>
 <52152ec4b83fe0c406475bfee39efafaaa2a88fb.1499805486.git.ernesto.mnd.fernandez@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-ext4-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=thunk.org; s=ef5046eb;
        h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=sLc94oy26NMSw0QvPdCG7H+L7fIo2ccI7DYM3pRQZIA=;
        b=rMEgicgJtaliqatCkT+g3qa3XVYgblrvh60Ydn2aDNbws4/FbqqA95yqEqw00m2DnMiwHGrgpiUy/VF7LhljG+TlU6zzN5hxRR4Krgoy92zXzjSfj4IPuaemIMGvIsWWPDve491RjVDQ8773/kp/L1qyMUg+MZz0XAODOTxuXF0=;
Content-Disposition: inline
In-Reply-To: <52152ec4b83fe0c406475bfee39efafaaa2a88fb.1499805486.git.ernesto.mnd.fernandez@gmail.com>
Sender: linux-ext4-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ernesto =?iso-8859-1?Q?A=2E_Fern=E1ndez?= <ernesto.mnd.fernandez@gmail.com>
Cc: Jan Kara <jack@suse.com>, Andreas Dilger <adilger.kernel@dilger.ca>, Dave Kleikamp <shaggy@kernel.org>, linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, reiserfs-devel@vger.kernel.org

On Wed, Jul 12, 2017 at 06:53:51AM -0300, Ernesto A. Fern=E1ndez wrote:
> When changing a file's acl mask, __ext4_set_acl() will first set the group
> bits of i_mode to the value of the mask, and only then set the actual
> extended attribute representing the new acl.
>=20
> If the second part fails (due to lack of space, for example) and the file
> had no acl attribute to begin with, the system will from now on assume
> that the mask permission bits are actual group permission bits, potential=
ly
> granting access to the wrong users.
>=20
> Prevent this by only changing the inode mode after the acl has been set.
>=20
> Signed-off-by: Ernesto A. Fern=E1ndez <ernesto.mnd.fernandez@gmail.com>

Thanks, applied.

						- Ted
