From: Christoph Hellwig <hch@lst.de>
Subject: cleanup the partitioning code
Date: Thu, 12 Mar 2020 16:19:18 +0100
Message-ID: <20200312151939.645254-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-raid-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=b3RXsv2Nj0w6mo5snr4nzMkxAesLBKH5E0NpaP9zKiw=; b=R1rpb4mbwYVS0YcV9SIkvfKlEB
        /ixd3jBPhHxBkidFliarHs2e+ag+JOZdBakRJ1MnrtGIOO1ih/twSwfNek1+uEy5g49lhNi1l1L3q
        6KT+Jt7IVTb1IqCHVrYX2Ee5q14/P1opgCesbnkWxyK1hQ9RFgws8cOT5Qsl8t8uK4PtNnr59y/iA
        rKO/cBNsIlODPpSjvU5A0JB2+QozpJoo0xy62UHTJo6WJsxPSscEJlY8TXzPXHmBH6dvaRJPDuuMe
        qmEiEKtKJ6LH2b5NJn49+o4VrVU9HyNFhKdk3olY0kvEugeOTqNJEXNho6yxAxPRdavm6rXbpQ4qB
        Khat2zog==;
Sender: linux-raid-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, linux-ext4@vger.kernel.org, reiserfs-devel@vger.kernel.org

Hi Jens,

this series cleans up the partitioning code.
