From: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH -next] reiserfs: fix blkdev_put() warning from
 release_journal_dev()
Date: Tue, 20 Jun 2023 12:34:56 +0200
Message-ID: <20230620-baden-antrieb-23bb65a2ac86@brauner>
References: <20230620111322.1014775-1-yukuai1@huaweicloud.com>
 <20230620042359.GA10255@lst.de>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687257303;
        bh=mSNmNKjU1+q7lSL0XI4fm9/XsSbvmqYX9+lrHnaptR4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ebr5UIF6mTBrOZiECk/zFRlWZNbul9E0LOL9hUl4Ct0NEEc4cdiTFvWPiU3mYflgK
         EnkvOuQsA+nsoNTAI7e1Q14dQ3d7d0N0t0r6rgR6LfBMLxgb4q+7pF07K6OtmuW6Ga
         qkmpXcV0bdCbXvT+bhyU/r62yiNKKMBx1PfcpNYPISDLb46SZBLz6rnr/ZoOIAQrPV
         E5OlhMMrpQaMNUwXD/+M71ox8PRNyLSniDL795rg/+oI6sHALQh0auzYvaJM5wE/IT
         2Xep04M9xLotJ9c6yQh62O58oPqc3+wdWvZoeZfwbNPovhEaVjPp2NxrTSj1s2nDtI
         fxvkEAJz65s6w==
Content-Disposition: inline
In-Reply-To: <20230620042359.GA10255@lst.de>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: Yu Kuai <yukuai1@huaweicloud.com>, axboe@kernel.dk, jack@suse.cz, jinpu.wang@ionos.com, dchinner@redhat.com, hare@suse.de, trix@redhat.com, bvanassche@acm.org, yukuai3@huawei.com, willy@infradead.org, yi.zhang@huawei.com, dsterba@suse.com, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, yangerkun@huawei.com

On Tue, Jun 20, 2023 at 06:23:59AM +0200, Christoph Hellwig wrote:
> Looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>

This needs to go on top of the FMODE_* cleanup series in Jens tree.

Looks good to me,
Reviewed-by: Christian Brauner <brauner@kernel.org>
