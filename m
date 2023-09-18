From: Peter Lafreniere <peter@n8pjl.ca>
Subject: [PATCH RESEND] um: Remove CONFIG_REISERFS_FS from defconfig
Date: Mon, 18 Sep 2023 12:58:26 +0000
Message-ID: <20230918125744.4342-1-peter@n8pjl.ca>
References: <20230910232640.113938-1-peter@n8pjl.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fza+UVpdAE1DmMs1AaE7RFF9cYJXOrRqsvTSex7d50k=; b=YFXiDlgAVv8Agh
	Y0tERZ9VcxTlNJ6xAuWxw/JSAU4jGjwLorcos0LfCCby3LTfG1B7jA+87DvuzT6lluQO+DyUIlv/a
	kgzCGR0hMBMXc0ptzobqXvgGgwF89pCSjZU/6qjejmU+4GEzk057Gva4xYGr+0DM1ivUBVD0qp1/d
	tou2Rb9ODFN0HSLWzecJBWdwIRXrDa7eGHthhgl0MnNW9zq7rm6e/1hpAwMsykJHG5NGJnqCrZASB
	uY2pDt9aNAB+bKkFHesh6HZ5NWw66Bk9eAy7bzqBHB1pNyV/wSGBFAyWNcvU6+NVMIecOESG6S4/V
	RIuJyqJ+D9WBm2hFAG3A==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n8pjl.ca;
	s=protonmail2; t=1695041922; x=1695301122;
	bh=jFSuVM37gBzzT3DlSXH+u3vj6sxnz1gtZhD0blEKUx0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GQAKpSTbQf+pySgjFZNHQICah6ZILzxAU9AfMv5pQAjyU66s0cZYbmz8rQ3+PYlq8
	 oVoFVbOeIsQao1ujOQR/gG9egtf8zBxaFZiuFEWZr8HbSJ2tdieT+7BlrwSzJSo9a0
	 7HYc2nXVPue9w6ysyPH8ZErcqaXU1x7lPvSJztJk/xK+wbzfeRsRZzh1xIgzg7N2Zb
	 MUnwqjmTJYKxKCITC9Q5F8qVI+DS/nFctPrkUW63TubposSC6dq04/U232yCCRpQNT
	 6Jg8VUWY1qD0C8vnWSOCI5cYs2C4tvYs54l6JP61O/qyOvFwL79rFWCY4Y8PP9WCA0
	 C2itn0Hub3BWQ==
In-Reply-To: <20230910232640.113938-1-peter@n8pjl.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-um/>
List-Post: <mailto:linux-um@lists.infradead.org>
List-Help: <mailto:linux-um-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=subscribe>
Sender: "linux-um" <linux-um-bounces@lists.infradead.org>
Errors-To: linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org
To: linux-um@lists.infradead.org
Cc: Peter Lafreniere <peter@n8pjl.ca>, richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, reiserfs-devel@vger.kernel.org, jack@suse.cz

ReiserFS has been deprecated for a year and a half, yet is still built
as part of a defconfig UML kernel.

According to commit eb103a51640e ("reiserfs: Deprecate reiserfs"), the
filesystem is slated to be removed in 2025. Remove it from the defconfig
profile now, as part of its deprecation process.

Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>
---
Fixed invalid DKIM settings causing the previous patch to be rejected.

 arch/um/configs/i386_defconfig   | 1 -
 arch/um/configs/x86_64_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/um/configs/i386_defconfig b/arch/um/configs/i386_defconfig
index e543cbac8792..9c9c77f1255a 100644
--- a/arch/um/configs/i386_defconfig
+++ b/arch/um/configs/i386_defconfig
@@ -61,7 +61,6 @@ CONFIG_UML_NET_DAEMON=y
 CONFIG_UML_NET_MCAST=y
 CONFIG_UML_NET_SLIRP=y
 CONFIG_EXT4_FS=y
-CONFIG_REISERFS_FS=y
 CONFIG_QUOTA=y
 CONFIG_AUTOFS_FS=m
 CONFIG_ISO9660_FS=m
diff --git a/arch/um/configs/x86_64_defconfig b/arch/um/configs/x86_64_defconfig
index 939cb12318ca..03b10d3f6816 100644
--- a/arch/um/configs/x86_64_defconfig
+++ b/arch/um/configs/x86_64_defconfig
@@ -59,7 +59,6 @@ CONFIG_UML_NET_DAEMON=y
 CONFIG_UML_NET_MCAST=y
 CONFIG_UML_NET_SLIRP=y
 CONFIG_EXT4_FS=y
-CONFIG_REISERFS_FS=y
 CONFIG_QUOTA=y
 CONFIG_AUTOFS_FS=m
 CONFIG_ISO9660_FS=m
-- 
2.42.0
