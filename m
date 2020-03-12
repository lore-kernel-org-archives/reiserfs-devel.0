From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 19/21] partitions/msdos: remove LINUX_SWAP_PARTITION
Date: Thu, 12 Mar 2020 16:19:37 +0100
Message-ID: <20200312151939.645254-20-hch@lst.de>
References: <20200312151939.645254-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-raid-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=NpF8uZr5AWwGERwkFTZV59wGub6aus9grKXZcd/rsck=; b=LFVstkzJrcfaZ7bqAcQWhdpzB9
        auAdrCTBgVHmqURa+8HFuujRXNMLozRqeenUgdhwUudYTFRA8hiJG7Hru5QlW7GoKAnIvqY0B7rYE
        NHbqE3vBobOe7Z/se2TdRpqENtjSEZw2k/g9aHxYT/pb6v/V0QiKuuDEmeubc0f22B48Sz1F+dUhp
        7eLyaYZZM6eZFg0s6g8ai45k9VKMWdRXoDyUHFQhTfqd27MCmp6uLChnE7PIFBLTW3b3kh9p9AlMG
        qDlSVQ0gt0UfXzxbBfM5QB16HOL+lE5yiAr23zx7bMOab7RBetTjmuoAjiRY7IpMv/Amra3ekc5JE
        MOUPsmMQ==;
In-Reply-To: <20200312151939.645254-1-hch@lst.de>
Sender: linux-raid-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, linux-ext4@vger.kernel.org, reiserfs-devel@vger.kernel.org

Just always use NEW_SOLARIS_X86_PARTITION and explain the situation,
as that is less confusing than two names for a single value.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/partitions/msdos.c        | 18 ++++++++++++------
 include/linux/msdos_partition.h |  3 +--
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/block/partitions/msdos.c b/block/partitions/msdos.c
index 88ee5ee7f442..e44e2f0a02cc 100644
--- a/block/partitions/msdos.c
+++ b/block/partitions/msdos.c
@@ -77,13 +77,19 @@ static int aix_magic_present(struct parsed_partitions *state, unsigned char *p)
 		p[2] == AIX_LABEL_MAGIC3 &&
 		p[3] == AIX_LABEL_MAGIC4))
 		return 0;
-	/* Assume the partition table is valid if Linux partitions exists */
+
+	/*
+	 * Assume the partition table is valid if Linux partitions exists.
+	 * Note that old Solaris/x86 partitions use the same indicator as
+	 * Linux swap partitions, so we consider that a Linux partition as
+	 * well.
+	 */
 	for (slot = 1; slot <= 4; slot++, pt++) {
-		if (pt->sys_ind == LINUX_SWAP_PARTITION ||
-			pt->sys_ind == LINUX_RAID_PARTITION ||
-			pt->sys_ind == LINUX_DATA_PARTITION ||
-			pt->sys_ind == LINUX_LVM_PARTITION ||
-			is_extended_partition(pt))
+		if (pt->sys_ind == SOLARIS_X86_PARTITION ||
+		    pt->sys_ind == LINUX_RAID_PARTITION ||
+		    pt->sys_ind == LINUX_DATA_PARTITION ||
+		    pt->sys_ind == LINUX_LVM_PARTITION ||
+		    is_extended_partition(pt))
 			return 0;
 	}
 	d = read_part_sector(state, 7, &sect);
diff --git a/include/linux/msdos_partition.h b/include/linux/msdos_partition.h
index e151af072cd1..2cb82db2a43c 100644
--- a/include/linux/msdos_partition.h
+++ b/include/linux/msdos_partition.h
@@ -27,12 +27,11 @@ enum msdos_sys_ind {
 	LINUX_EXTENDED_PARTITION = 0x85,
 	WIN98_EXTENDED_PARTITION = 0x0f,
 
-	LINUX_SWAP_PARTITION = 0x82,
 	LINUX_DATA_PARTITION = 0x83,
 	LINUX_LVM_PARTITION = 0x8e,
 	LINUX_RAID_PARTITION = 0xfd,	/* autodetect RAID partition */
 
-	SOLARIS_X86_PARTITION =	LINUX_SWAP_PARTITION,
+	SOLARIS_X86_PARTITION =	0x82,	/* also Linux swap partitions */
 	NEW_SOLARIS_X86_PARTITION = 0xbf,
 
 	DM6_AUX1PARTITION = 0x51,	/* no DDO:  use xlated geom */
-- 
2.24.1

