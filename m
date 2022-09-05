From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 12/14] fs/buffer: remove
 ll_rw_block() helper
Date: Sun, 4 Sep 2022 22:56:30 -0700
Message-ID: <YxWPjmoiYuRpAVkT@infradead.org>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
 <20220901133505.2510834-13-yi.zhang@huawei.com>
Mime-Version: 1.0
Return-path: <cluster-devel-bounces@redhat.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662357399;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=MWKN5ka0SyJzkxR9UjV+6AsvmPCWjCC7EqfVn/XAeLtxyv5N9HmNYB5X7ashgpvIB6nGQG
	IQFmI7T+sHhvFJMDvcXsU24UWrOPRqoicu/nEgSjCGckoMLQ7xSnmK1s4u0OLi262S7Nzq
	1PJrUWXx73j3vv4JUv5uciqSCSp2RtQ=
In-Reply-To: <20220901133505.2510834-13-yi.zhang@huawei.com>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhang Yi <yi.zhang@huawei.com>
Cc: axboe@kernel.dk, almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev, jack@suse.cz, chengzhihao1@huawei.com, mark@fasheh.com, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, cluster-devel@redhat.com, viro@zeniv.linux.org.uk, yukuai3@huawei.com, linux-fsdevel@vger.kernel.org, tytso@mit.edu, akpm@linux-foundation.org, linux-ext4@vger.kernel.org, dushistov@mail.ru, ocfs2-devel@oss.oracle.com

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

