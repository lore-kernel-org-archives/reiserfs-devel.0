From: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v3 00/10] acl: drop posix acl handlers from xattr handlers
Date: Wed, 1 Feb 2023 14:42:54 +0100
Message-ID: <20230201134254.fai2vc7gtzj6iikx@wittgenstein>
References: <20230125-fs-acl-remove-generic-xattr-handlers-v3-0-f760cc58967d@kernel.org>
 <20230201133020.GA31902@lst.de>
Mime-Version: 1.0
Return-path: <linux-unionfs-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675258979;
        bh=236qP/C90Z1wdMee922mWauOTL0WF+oXGDgnJ96vQFg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lMMF4aTsthtPu0qSDZz5BvWT3Pmxnz+NILt33rgl1+vXpJfzqEv41DYzKsqYGtoGo
         RfbSM457WNfz2Hj+9ntpXQApKcCjAJVksXRu34iUU27WSsyzFHxu28zKksBwqEgFjq
         bEmZWftDL1skahY8fxJIf/X2bYWhUr5/ruKGAoT6wF16to0EWnPfOxShNm4aNuTyFH
         TllIEyGeIvTdR60qHVy/Feh2ApS62j8QtGi5QRujJzXjmj7KFrOB8C3HaUwsJdZUwf
         P83wP7ZfiBKmcU8JDkWwvICV8r+9vwyn/20bGSvqbW6MrkafLuuV0989PpLRqSWgss
         U+lNph1qFbXHw==
Content-Disposition: inline
In-Reply-To: <20230201133020.GA31902@lst.de>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Seth Forshee <sforshee@kernel.org>, linux-f2fs-devel@lists.sourceforge.net, linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org, reiserfs-devel@vger.kernel.org, linux-unionfs@vger.kernel.org

On Wed, Feb 01, 2023 at 02:30:20PM +0100, Christoph Hellwig wrote:
> This version looks good to me, but I'd really prefer if a reiserfs
> insider could look over the reiserfs patches.

I consider this material for v6.4 even with an -rc8 for v6.3. So there's
time but we shouldn't block it on reiserfs. Especially, since it's
marked deprecated.

Fwiw, I've tested reiserfs with xfstests on a kernel with and without
this series applied and there's no regressions. But it's overall pretty
buggy at least according to xfstests. Which is expected, I guess.
