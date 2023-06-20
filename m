From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH -next] reiserfs: fix blkdev_put() warning from
 release_journal_dev()
Date: Tue, 20 Jun 2023 06:23:59 +0200
Message-ID: <20230620042359.GA10255@lst.de>
References: <20230620111322.1014775-1-yukuai1@huaweicloud.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20230620111322.1014775-1-yukuai1@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: hch@lst.de, axboe@kernel.dk, jack@suse.cz, jinpu.wang@ionos.com, dchinner@redhat.com, hare@suse.de, trix@redhat.com, bvanassche@acm.org, yukuai3@huawei.com, willy@infradead.org, yi.zhang@huawei.com, dsterba@suse.com, brauner@kernel.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, yangerkun@huawei.com

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
