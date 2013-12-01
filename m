From: Vyacheslav Dubeyko <slava@dubeyko.com>
Subject: Re: [PATCH 10/18] hfsplus: use generic posix ACL infrastructure
Date: Sun, 1 Dec 2013 17:36:51 +0300
Message-ID: <3F8D73A0-9449-42FB-8CFA-D1E4C86FF0B2@dubeyko.com>
References: <20131201115903.910559036@bombadil.infradead.org>
	<20131201120655.410590428@bombadil.infradead.org>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <xfs-bounces@oss.sgi.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dubeyko.com;
	s=default; 
	h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Content-Type:Mime-Version:Subject;
	bh=MpRxkmXsepWvRADYL8kM+X7RTBGRO0SonETcKpOE38w=; 
	b=T8nzO2O6p5m850TLOVgJDDSq1PmglLkRO6GNOPNv9rRqesyzz/gFvkTB/EEu5FtvTDFbpnk4ndIBEg5Gv2p9R+bPQYvbr4vM3XXv/sgzilwAc35ZgDa9xypFuvkqwuzw;
In-Reply-To: <20131201120655.410590428@bombadil.infradead.org>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <http://oss.sgi.com/mailman/options/xfs>,
	<mailto:xfs-request@oss.sgi.com?subject=unsubscribe>
List-Archive: <http://oss.sgi.com/pipermail/xfs>
List-Post: <mailto:xfs@oss.sgi.com>
List-Help: <mailto:xfs-request@oss.sgi.com?subject=help>
List-Subscribe: <http://oss.sgi.com/mailman/listinfo/xfs>,
	<mailto:xfs-request@oss.sgi.com?subject=subscribe>
Errors-To: xfs-bounces@oss.sgi.com
Sender: xfs-bounces@oss.sgi.com
To: Christoph Hellwig <hch@infradead.org>
Cc: xfs@oss.sgi.com, Mark Fasheh <mfasheh@suse.com>, reiserfs-devel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com, linux-mtd@lists.infradead.org, viro@zeniv.linux.org.uk, jfs-discussion@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>


On Dec 1, 2013, at 2:59 PM, Christoph Hellwig wrote:

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
> fs/hfsplus/acl.h       |    9 +--
> fs/hfsplus/dir.c       |    1 +
> fs/hfsplus/inode.c     |    3 +-
> fs/hfsplus/posix_acl.c |  161 +++++-------------------------------------------
> fs/hfsplus/xattr.c     |    5 +-
> fs/hfsplus/xattr.h     |    2 -
> 6 files changed, 24 insertions(+), 157 deletions(-)
> 

Reviewed-by: Vyacheslav Dubeyko <slava@dubeyko.com>

The patch looks correct. I think only that it makes sense to add debug messages
in hfsplus_get_posix_acl() and hfsplus_set_posix_acl(). Previously, debug
messages were in hfsplus_xattr_get_posix_acl() and hfsplus_xattr_set_posix_acl()
but the patch removes these methods.

Thanks,
Vyacheslav Dubeyko.

_______________________________________________
xfs mailing list
xfs@oss.sgi.com
http://oss.sgi.com/mailman/listinfo/xfs
