From: Peter Lafreniere <peter@n8pjl.ca>
Subject: [PATCH 1/7] arch: um: remove ReiserFS from defconfig
Date: Mon, 18 Sep 2023 17:56:28 +0000
Message-ID: <20230918175529.19011-2-peter@n8pjl.ca>
References: <20230918175529.19011-1-peter@n8pjl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n8pjl.ca;
        s=protonmail2; t=1695059802; x=1695319002;
        bh=xVm1VEcG0Jf60xZTTkEDLftCnF2hja54aFLZBR2s6LI=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=EI+Pcu4xlBcbm7xi8sQefjkznJb+t0yOcTzcR7GCwcbD/Bgq4r8qo9LND/1XqGsYE
         r6bwgq0KMGhpwo86vEFwMizDSnOH1UQyvzTgYeIBKKRT8/fAQ1E3pr9vigrUzsEFxd
         t1lo4Lx5FuoaCczvX8nIumi/sCzC5EouuckLXXUyaAf0EyPox3ZZEorp5NZa1MZSMS
         0AVS5ElXsCWPhdxkZ1DhDodgLLPOt/CbCMV+giomeLSozCHfJxaq0G8uFbg628dNT5
         WxSPpkbjG4CsDDdiuqLFQSptaLQ85qOuR7ZnGHP4dsq3WlNfKqlcn7u/h4AyqSjYEO
         hKTpuS5aqZiPw==
In-Reply-To: <20230918175529.19011-1-peter@n8pjl.ca>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-um@lists.infradead.org
Cc: Peter Lafreniere <peter@n8pjl.ca>, jack@suse.cz, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net

ReiserFS has been deprecated for a year and a half, yet is still built
as part of a defconfig UML kernel.

According to commit eb103a51640e ("reiserfs: Deprecate reiserfs"), the
filesystem is slated to be removed in 2025. Remove it from the defconfig
profiles now, as part of its deprecation process.

Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>
Acked-by: Richard Weinberger <richard@nod.at>
---
 arch/um/configs/i386_defconfig   | 1 -
 arch/um/configs/x86_64_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/um/configs/i386_defconfig b/arch/um/configs/i386_defconfi=
g
index e543cbac8792..9c9c77f1255a 100644
--- a/arch/um/configs/i386_defconfig
+++ b/arch/um/configs/i386_defconfig
@@ -61,7 +61,6 @@ CONFIG_UML_NET_DAEMON=3Dy
 CONFIG_UML_NET_MCAST=3Dy
 CONFIG_UML_NET_SLIRP=3Dy
 CONFIG_EXT4_FS=3Dy
-CONFIG_REISERFS_FS=3Dy
 CONFIG_QUOTA=3Dy
 CONFIG_AUTOFS_FS=3Dm
 CONFIG_ISO9660_FS=3Dm
diff --git a/arch/um/configs/x86_64_defconfig b/arch/um/configs/x86_64_defc=
onfig
index 939cb12318ca..03b10d3f6816 100644
--- a/arch/um/configs/x86_64_defconfig
+++ b/arch/um/configs/x86_64_defconfig
@@ -59,7 +59,6 @@ CONFIG_UML_NET_DAEMON=3Dy
 CONFIG_UML_NET_MCAST=3Dy
 CONFIG_UML_NET_SLIRP=3Dy
 CONFIG_EXT4_FS=3Dy
-CONFIG_REISERFS_FS=3Dy
 CONFIG_QUOTA=3Dy
 CONFIG_AUTOFS_FS=3Dm
 CONFIG_ISO9660_FS=3Dm
--=20
2.42.0


