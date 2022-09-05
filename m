From: "Theodore Ts'o" <tytso@mit.edu>
Subject: Re: [PATCH v2 06/14] jbd2: replace ll_rw_block()
Date: Mon, 5 Sep 2022 04:23:24 -0400
Message-ID: <YxWx/E0TIhBMhaq6@mit.edu>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
 <20220901133505.2510834-7-yi.zhang@huawei.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
        t=1662366211; bh=Opykd4NroLOvUVAS6DC0mH5AVipCgMT0W9fOrq2cA5g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=kQY2cNMKCxqeSaFySEG9If6ZtQ8BhheeiKQJIw2xRYU0mwh5KEc4n5fb1xfvPk4CZ
         mBNdt31pMRPo3WHANZ5/Ldd6KIRnX21xck+7Bwn1Fcrsc5FcAOy78knWuHYTLXAl4g
         DxocwCUAw/g0qM3+vyInmt7rzH9XEt3Rw96cWfFdL1E5K22280Elx75++itsnVc6Gr
         BQtWa317FaLTf8L+CdQ4p6Ae6qIlTOrneZoG/Z4wofU62NxWKd3WMtYF7anpMD6LxL
         vXTuclZkTdheNbZQoIMugvCv3ZQ/q2LRDpdTb2u/xsaul3tZnLnf3enunBF8CgAtMV
         Liep1iIsFATVw==
Content-Disposition: inline
In-Reply-To: <20220901133505.2510834-7-yi.zhang@huawei.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhang Yi <yi.zhang@huawei.com>
Cc: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, cluster-devel@redhat.com, ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, jack@suse.cz, akpm@linux-foundation.org, axboe@kernel.dk, viro@zeniv.linux.org.uk, rpeterso@redhat.com, agruenba@redhat.com, almaz.alexandrovich@paragon-software.com, mark@fasheh.com, dushistov@mail.ru, hch@infradead.org, chengzhihao1@huawei.com, yukuai3@huawei.com

On Thu, Sep 01, 2022 at 09:34:57PM +0800, Zhang Yi wrote:
> ll_rw_block() is not safe for the sync read path because it cannot
> guarantee that submitting read IO if the buffer has been locked. We
> could get false positive EIO after wait_on_buffer() if the buffer has
> been locked by others. So stop using ll_rw_block() in
> journal_get_superblock(). We also switch to new bh_readahead_batch()
> for the buffer array readahead path.
> 
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>

Thanks, looks good.

Reviewed-by: Theodore Ts'o <tytso@mit.edu>


					- Ted
