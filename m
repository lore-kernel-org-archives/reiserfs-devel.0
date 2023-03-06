From: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v3 00/10] acl: drop posix acl handlers from xattr handlers
Date: Mon, 6 Mar 2023 10:26:33 +0100
Message-ID: <20230306092633.tobpejvw7mwcx22v@wittgenstein>
References: <20230125-fs-acl-remove-generic-xattr-handlers-v3-0-f760cc58967d@kernel.org>
 <20230201133020.GA31902@lst.de>
 <20230201134254.fai2vc7gtzj6iikx@wittgenstein>
Mime-Version: 1.0
Return-path: <linux-unionfs-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678094799;
        bh=57FrCCZ2Wq+YAZlBEbTVLCXLXyHrbe4LXgxzAP6Rt70=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aGpHk5/EASsEtl4vKnAkGUaXhtbPzA/d2cXgftsQx8PVrRgVXQNsAAnUOBX1GgX6I
         G/6gfIFXfw4GETwfv8Vqa+2mueXnJba6vq4doCPeNTZ+42jYFYMi/XGYUBkeA8X/oD
         ElKS799bOnXufZBGOEBscaDcXEpJHRp87DtATu56G0m7hUhBUbQpW3gm1nxMrdfglF
         0ZbBUcHJGIkJmz/Hsybihbq8zOv2if13KJ/EEandIpN1dFYg7WzDuihAtyiEKIBsW3
         NHz3uKORaef+IPel5P8LpgPELeV5dFcgKzByHGHs4b9oIVc5RyT13xsoOqXUWsxf3W
         aynSxAyBPrijQ==
Content-Disposition: inline
In-Reply-To: <20230201134254.fai2vc7gtzj6iikx@wittgenstein>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Seth Forshee <sforshee@kernel.org>, linux-f2fs-devel@lists.sourceforge.net, linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org, reiserfs-devel@vger.kernel.org, linux-unionfs@vger.kernel.org

On Wed, Feb 01, 2023 at 02:42:54PM +0100, Christian Brauner wrote:
> On Wed, Feb 01, 2023 at 02:30:20PM +0100, Christoph Hellwig wrote:
> > This version looks good to me, but I'd really prefer if a reiserfs
> > insider could look over the reiserfs patches.
> 
> I consider this material for v6.4 even with an -rc8 for v6.3. So there's
> time but we shouldn't block it on reiserfs. Especially, since it's
> marked deprecated.

So I've applied this now. If there's still someone interested in
checking the reiserfs bits more than what we did with xfstests they
should please do so. But I don't want to hold up this series waiting for
that to happen.

> 
> Fwiw, I've tested reiserfs with xfstests on a kernel with and without
> this series applied and there's no regressions. But it's overall pretty
> buggy at least according to xfstests. Which is expected, I guess.
