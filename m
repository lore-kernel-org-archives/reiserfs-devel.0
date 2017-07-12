From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 0/5] Failure to set acl may alter group permissions
Date: Wed, 12 Jul 2017 04:47:19 -0700
Message-ID: <20170712114719.GA14398@infradead.org>
References: <cover.1499805484.git.ernesto.mnd.fernandez@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
        :Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:References:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=vICnftoOZUmdUfFRpKHzZuqMRLGlFDke6FJCv+2WPJ4=; b=GsJa4htuoaIa93U8rjwX83JFZJ
        ecyfszly3PD1TnFyV1tXDkbsCTkYhLUMolGeMRKWS3yq3HZorHJiWpA3E10QcgHNJLRHYuQD3EQu5
        Q6J1oeVJ5bqDMWdokzZxHG/hyYG86+WYyaIPwTUwXJ7qKQdEaqsnCu4sku+ubJ/wsxhG7PlU9E8Oj
        fsBbAkfG+0Wj6HlNVSucUfoBNMwnklT06KFpcm3c5Isj5uLNdzjh7uBYWulWMcu6yjOXSgA7FnGcZ
        5lNIqxuewdetvG3DbWxrrqawhgIuqOOZiSbEsYT7jm6wBsBWFHzJC/nCuD1hXO5ckClIZivH8Ux1k
    
Content-Disposition: inline
In-Reply-To: <cover.1499805484.git.ernesto.mnd.fernandez@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ernesto =?iso-8859-1?Q?A=2E_Fern=E1ndez?= <ernesto.mnd.fernandez@gmail.com>
Cc: Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Dave Kleikamp <shaggy@kernel.org>, linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, reiserfs-devel@vger.kernel.org, fstests@vger.kernel.org

On Wed, Jul 12, 2017 at 06:53:22AM -0300, Ernesto A. Fern=E1ndez wrote:
> If your working directory is on a filesystem mounted with extended user
> attributes (and acl of course), this script will trigger the issue by
> filling the drive:
>=20
>=20
> touch test.file
> chmod go-rwx test.file
> yes xxxxxxxxxx > test.file
> i=3D1
> while setfattr -n user.$i test.file; do
>   ((++i))
> done
> setfacl -m m:r test.file

Can you please wire this up for xfstests?
