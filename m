From: Matthew Wilcox <willy@infradead.org>
Subject: Re: A null-ptr-deref bug in reiserfs_breada in fs/reiserfs/journal.c
Date: Sun, 4 Jun 2023 12:16:06 +0100
Message-ID: <ZHxydoL06XHR1bOx@casper.infradead.org>
References: <CAFcO6XOacq3hscbXevPQP7sXRoYFz34ZdKPYjmd6k5sZuhGFDw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=wV+lTMaC3z644k/Yk/InRSq/6/07bZzUxmzLJgoLbjo=; b=Dsdlr2BLmVqV3RBisOg/nK3OdP
        tOCh/wYU5HDWFk4JuckrcEaYNaH9ZMYgs3fBBh+3Ueuhz48NuCyDuFI7NfWrid4XL/85iwvzacwN9
        VjTjfiFWVHV9XQZwfhhfGzw+Orq83LawvtclvKFsi0dmqfaAoGIQAg/rYsp3LMB3VBu/J5JLhq7lg
        vxCTkzMq3QuD6IqMBt46tN+Pj0t7mU2az3i3yOJHckmSgGmCsPiUOCYu5ihoSyrCivmfZkAkNYTIO
        2iWuhVl2TdMbtsLaBOXVDhDhBf/54wGDw3khF8u0augaBLOgtGMt7pIhL3S4aUDUHRQvlmPz5hUyF
        0jpZIDyA==;
Content-Disposition: inline
In-Reply-To: <CAFcO6XOacq3hscbXevPQP7sXRoYFz34ZdKPYjmd6k5sZuhGFDw@mail.gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: butt3rflyh4ck <butterflyhuangxx@gmail.com>
Cc: Jan Kara <jack@suse.cz>, akpm@linux-foundation.org, yi.zhang@huawei.com, trix@redhat.com, song@kernel.org, bvanassche@acm.org, reiserfs-devel@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sun, Jun 04, 2023 at 04:12:56PM +0800, butt3rflyh4ck wrote:
> Hi, there is a null-ptr-deref  bug in reiserfs_breada in
> fs/reiserfs/journal.c, I reproduce it in the latest kernel too.

does this fix the problem?

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 4d11d60f493c..dd58e0dca5e5 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -2326,7 +2326,7 @@ static struct buffer_head *reiserfs_breada(struct block_device *dev,
 	int i, j;
 
 	bh = __getblk(dev, block, bufsize);
-	if (buffer_uptodate(bh))
+	if (!bh || buffer_uptodate(bh))
 		return (bh);
 
 	if (block + BUFNR > max_block) {
@@ -2336,6 +2336,8 @@ static struct buffer_head *reiserfs_breada(struct block_device *dev,
 	j = 1;
 	for (i = 1; i < blocks; i++) {
 		bh = __getblk(dev, block + i, bufsize);
+		if (!bh)
+			break;
 		if (buffer_uptodate(bh)) {
 			brelse(bh);
 			break;
