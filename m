From: Christoph Hellwig <hch@lst.de>
Subject: cleanup the partitioning code v2
Date: Tue, 24 Mar 2020 08:25:09 +0100
Message-ID: <20200324072530.544483-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=sQdGzcjtu/OHKLduBOWEwidcFsI1MjEMWz8/QYw8Sz8=; b=Z/YFQKyRlB/lTbApkMRU4pDjNf
        Z+LFq1mRmB88pv8W+WaubwDyzFA582A/8gJgxzQqaId6LhcamOWEgXi5o7sFnaNGpJTPCSeNFkvmj
        +BIp+8KUQd6Y5gzOROVUrEiothgAMYYMHdMvLIuqRo16cbirhTXCwMSAv0PuPE6eh/X471WEfYksa
        wmyg/BSWNI4rGJUhlTuELJgPWluksXT98/uEVnQ3pVOvHmMWfmvwfYFBhA7lxho/JfVGxTANC9vJg
        W3tBUtNAULRVlDB2NVfJxGjDmJdkte1AwAQ6o1C1MYOyxBpv9mxeto6e1R/4iat6Z8bv9Na9F5v7o
        Hy7mNs2A==;
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, reiserfs-devel@vger.kernel.org

Hi Jens,

this series cleans up the partitioning code.

Changes sinve v1:
 - rebased to for-5.7/block
