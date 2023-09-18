From: Peter Lafreniere <peter@n8pjl.ca>
Subject: [PATCH 6/7] arch: arm: remove ReiserFS from defconfig
Date: Mon, 18 Sep 2023 17:57:37 +0000
Message-ID: <20230918175529.19011-7-peter@n8pjl.ca>
References: <20230918175529.19011-1-peter@n8pjl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n8pjl.ca;
        s=protonmail2; t=1695059863; x=1695319063;
        bh=I+KgQHw8hJyaw6uzs72VPeTNHvbX24xU2dGCApKFeAY=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=Ir6Sf8pqh4NJ2RuUSkDzy7LaLnRMiRCTJ/s7ocycKiKrNHTSWPDItcTujRIOkbkFX
         Vk2pX+enOpdPlTlwQ6kqr6dokgxl3rBcUsv8ZxSBgzk3xrHyztOOl+vHxIBiBpqwuK
         LNkszEU4TBgIaAyd82vnrU7TCjn6/ZRTftFdsyrpGNsHDe2toYRLoZL973gcdlbidb
         libz0mgCxFQXnVX6BxCZLgdsbCcgsCy5UN3ebKJqxjLL6lhF6yBpPRpKLqmU8gH8cS
         Z1NkSuBA0LZ4gJPN2/8nVfRbWUvoc7ZNc9vWb6T4nc7iWqU19hL/OKcL65Zl+1VEs9
         soYUNb1hqOoIA==
In-Reply-To: <20230918175529.19011-1-peter@n8pjl.ca>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-arm-kernel@lists.infradead.org
Cc: Peter Lafreniere <peter@n8pjl.ca>, jack@suse.cz, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, linux@armlinux.org.uk

ReiserFS has been deprecated for a year and a half, yet is still built
as part of a defconfig kernel.

According to commit eb103a51640e ("reiserfs: Deprecate reiserfs"), the
filesystem is slated to be removed in 2025. Remove it from the pxa=20
defconfig profile now, as part of its deprecation process.

Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>
---
 arch/arm/configs/pxa_defconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfi=
g
index 23c131b0854b..607420f7ea27 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -584,10 +584,6 @@ CONFIG_EXT2_FS_SECURITY=3Dy
 CONFIG_EXT3_FS=3Dy
 CONFIG_EXT3_FS_POSIX_ACL=3Dy
 CONFIG_EXT3_FS_SECURITY=3Dy
-CONFIG_REISERFS_FS=3Dm
-CONFIG_REISERFS_FS_XATTR=3Dy
-CONFIG_REISERFS_FS_POSIX_ACL=3Dy
-CONFIG_REISERFS_FS_SECURITY=3Dy
 CONFIG_XFS_FS=3Dm
 CONFIG_AUTOFS_FS=3Dm
 CONFIG_FUSE_FS=3Dm
--=20
2.42.0


