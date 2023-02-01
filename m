From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v3 00/10] acl: drop posix acl handlers from
 xattr handlers
Date: Wed, 1 Feb 2023 14:30:20 +0100
Message-ID: <20230201133020.GA31902@lst.de>
References: <20230125-fs-acl-remove-generic-xattr-handlers-v3-0-f760cc58967d@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OVU9+n3wSvSuANAsouaV/u270liNHHgsPlHI9v82c/A=; b=K49Wkxh2FIxBqrE4JfJPT67KHH
 tbUCAKR5tvpE1nWBG77JlNuFBEz0bP4lC/S0EWtPM1SAQC2hf4YXzNVxAROpHi7S59UFPdGajlHbi
 Agd7IgsRV84twsfK39xTuh/r4oqyBLwGDnltvpw7lQODnJqMh1KmeOFIZ4DuTExTtMBo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OVU9+n3wSvSuANAsouaV/u270liNHHgsPlHI9v82c/A=; b=hmfGacWmnDDR8POkn+J2CRdAG7
 gSRYB2jJhbh1wtpZPiul3P1gob9gjU8/gcxISp+lq2af4iPMor2JQM7xqlz0L+GvfMxDMnIooB8JM
 9luahvX/t2MgOkXpEf5Q6jYTL6W7kaOzOHS2RHA8uMyNXqSo9Qj7E2oQto/jkPTd0mXo=;
Content-Disposition: inline
In-Reply-To: <20230125-fs-acl-remove-generic-xattr-handlers-v3-0-f760cc58967d@kernel.org>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
To: Christian Brauner <brauner@kernel.org>
Cc: linux-unionfs@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org, Seth Forshee <sforshee@kernel.org>, linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>

This version looks good to me, but I'd really prefer if a reiserfs
insider could look over the reiserfs patches.
