From: Peter Lafreniere <peter@n8pjl.ca>
Subject: [PATCH 4/7] arch: mips: remove ReiserFS from defconfig
Date: Mon, 18 Sep 2023 17:57:10 +0000
Message-ID: <20230918175529.19011-5-peter@n8pjl.ca>
References: <20230918175529.19011-1-peter@n8pjl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n8pjl.ca;
        s=protonmail2; t=1695059850; x=1695319050;
        bh=JDjRiSWJTFYH8PD2dsxNGLZbrcHGdPkUJwg1xfwDJyE=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=UiH8zlNQV4EfGcXtLn6o+BWQmdaIhHe4qkC+6PW4uRqWDrgWJSGYQSDSrmH/oh5gD
         +743EUp4OvrK7/ue6YqnjeHRLVe2B1CX1EZO6PdNf0Gk3aHDaAw7tIvQPRvQ2jtpXx
         7gIHr05bK6WuJ94pLuN6OXjUjWPYLslTC5lNqJ1/o2NwBQDtMs4ghs9cvXD2kT6+1Q
         38lzm2a2O59naRzFSwTWF6isgSuFE146udcUPlWi+Z2ioT53DCSGVg7811Y7ig8akz
         0sAFqzmU5cfcHYFBhvRRkvNLbIzN+nAwGyDNxqy0cD4MjeLxs9/lf8vix/RCFE90ie
         tNsRzgDnfc+LA==
In-Reply-To: <20230918175529.19011-1-peter@n8pjl.ca>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-mips@vger.kernel.org
Cc: Peter Lafreniere <peter@n8pjl.ca>, jack@suse.cz, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, tsbogend@alpha.franken.de

ReiserFS has been deprecated for a year and a half, yet is still built
as part of a defconfig kernel.

According to commit eb103a51640e ("reiserfs: Deprecate reiserfs"), the
filesystem is slated to be removed in 2025. Remove it from the defconfig
profiles now, as part of its deprecation process.

Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>
---
 arch/mips/configs/fuloong2e_defconfig   | 1 -
 arch/mips/configs/jazz_defconfig        | 4 ----
 arch/mips/configs/lemote2f_defconfig    | 3 ---
 arch/mips/configs/malta_defconfig       | 5 -----
 arch/mips/configs/malta_kvm_defconfig   | 5 -----
 arch/mips/configs/maltaup_xpa_defconfig | 5 -----
 arch/mips/configs/rm200_defconfig       | 4 ----
 7 files changed, 27 deletions(-)

diff --git a/arch/mips/configs/fuloong2e_defconfig b/arch/mips/configs/fulo=
ong2e_defconfig
index 1843468f84a3..00329bb5de5a 100644
--- a/arch/mips/configs/fuloong2e_defconfig
+++ b/arch/mips/configs/fuloong2e_defconfig
@@ -177,7 +177,6 @@ CONFIG_EXT2_FS=3Dy
 CONFIG_EXT3_FS=3Dy
 CONFIG_EXT4_FS_POSIX_ACL=3Dy
 CONFIG_EXT4_FS_SECURITY=3Dy
-CONFIG_REISERFS_FS=3Dm
 CONFIG_AUTOFS_FS=3Dy
 CONFIG_FUSE_FS=3Dy
 CONFIG_ISO9660_FS=3Dm
diff --git a/arch/mips/configs/jazz_defconfig b/arch/mips/configs/jazz_defc=
onfig
index fdf374574105..65adb538030d 100644
--- a/arch/mips/configs/jazz_defconfig
+++ b/arch/mips/configs/jazz_defconfig
@@ -70,10 +70,6 @@ CONFIG_FRAMEBUFFER_CONSOLE=3Dy
 # CONFIG_HWMON is not set
 CONFIG_EXT2_FS=3Dm
 CONFIG_EXT3_FS=3Dy
-CONFIG_REISERFS_FS=3Dm
-CONFIG_REISERFS_FS_XATTR=3Dy
-CONFIG_REISERFS_FS_POSIX_ACL=3Dy
-CONFIG_REISERFS_FS_SECURITY=3Dy
 CONFIG_XFS_FS=3Dm
 CONFIG_XFS_QUOTA=3Dy
 CONFIG_AUTOFS_FS=3Dm
diff --git a/arch/mips/configs/lemote2f_defconfig b/arch/mips/configs/lemot=
e2f_defconfig
index 83d9a8ff4270..38f17b658421 100644
--- a/arch/mips/configs/lemote2f_defconfig
+++ b/arch/mips/configs/lemote2f_defconfig
@@ -229,9 +229,6 @@ CONFIG_EXT2_FS=3Dm
 CONFIG_EXT3_FS=3Dy
 CONFIG_EXT3_FS_POSIX_ACL=3Dy
 CONFIG_EXT3_FS_SECURITY=3Dy
-CONFIG_REISERFS_FS=3Dm
-CONFIG_REISERFS_PROC_INFO=3Dy
-CONFIG_REISERFS_FS_XATTR=3Dy
 CONFIG_JFS_FS=3Dm
 CONFIG_JFS_POSIX_ACL=3Dy
 CONFIG_XFS_FS=3Dm
diff --git a/arch/mips/configs/malta_defconfig b/arch/mips/configs/malta_de=
fconfig
index ae1a7793e810..6f8046024557 100644
--- a/arch/mips/configs/malta_defconfig
+++ b/arch/mips/configs/malta_defconfig
@@ -317,11 +317,6 @@ CONFIG_UIO=3Dm
 CONFIG_UIO_CIF=3Dm
 CONFIG_EXT2_FS=3Dy
 CONFIG_EXT3_FS=3Dy
-CONFIG_REISERFS_FS=3Dm
-CONFIG_REISERFS_PROC_INFO=3Dy
-CONFIG_REISERFS_FS_XATTR=3Dy
-CONFIG_REISERFS_FS_POSIX_ACL=3Dy
-CONFIG_REISERFS_FS_SECURITY=3Dy
 CONFIG_JFS_FS=3Dm
 CONFIG_JFS_POSIX_ACL=3Dy
 CONFIG_JFS_SECURITY=3Dy
diff --git a/arch/mips/configs/malta_kvm_defconfig b/arch/mips/configs/malt=
a_kvm_defconfig
index c07e30f63d8b..16a91eeff67f 100644
--- a/arch/mips/configs/malta_kvm_defconfig
+++ b/arch/mips/configs/malta_kvm_defconfig
@@ -323,11 +323,6 @@ CONFIG_UIO=3Dm
 CONFIG_UIO_CIF=3Dm
 CONFIG_EXT2_FS=3Dy
 CONFIG_EXT3_FS=3Dy
-CONFIG_REISERFS_FS=3Dm
-CONFIG_REISERFS_PROC_INFO=3Dy
-CONFIG_REISERFS_FS_XATTR=3Dy
-CONFIG_REISERFS_FS_POSIX_ACL=3Dy
-CONFIG_REISERFS_FS_SECURITY=3Dy
 CONFIG_JFS_FS=3Dm
 CONFIG_JFS_POSIX_ACL=3Dy
 CONFIG_JFS_SECURITY=3Dy
diff --git a/arch/mips/configs/maltaup_xpa_defconfig b/arch/mips/configs/ma=
ltaup_xpa_defconfig
index 0a5701020d3f..264aba29ea4f 100644
--- a/arch/mips/configs/maltaup_xpa_defconfig
+++ b/arch/mips/configs/maltaup_xpa_defconfig
@@ -323,11 +323,6 @@ CONFIG_UIO=3Dm
 CONFIG_UIO_CIF=3Dm
 CONFIG_EXT2_FS=3Dy
 CONFIG_EXT3_FS=3Dy
-CONFIG_REISERFS_FS=3Dm
-CONFIG_REISERFS_PROC_INFO=3Dy
-CONFIG_REISERFS_FS_XATTR=3Dy
-CONFIG_REISERFS_FS_POSIX_ACL=3Dy
-CONFIG_REISERFS_FS_SECURITY=3Dy
 CONFIG_JFS_FS=3Dm
 CONFIG_JFS_POSIX_ACL=3Dy
 CONFIG_JFS_SECURITY=3Dy
diff --git a/arch/mips/configs/rm200_defconfig b/arch/mips/configs/rm200_de=
fconfig
index 5c5e2186210c..08e1c1f2f4de 100644
--- a/arch/mips/configs/rm200_defconfig
+++ b/arch/mips/configs/rm200_defconfig
@@ -310,10 +310,6 @@ CONFIG_USB_LD=3Dm
 CONFIG_USB_TEST=3Dm
 CONFIG_EXT2_FS=3Dm
 CONFIG_EXT3_FS=3Dy
-CONFIG_REISERFS_FS=3Dm
-CONFIG_REISERFS_FS_XATTR=3Dy
-CONFIG_REISERFS_FS_POSIX_ACL=3Dy
-CONFIG_REISERFS_FS_SECURITY=3Dy
 CONFIG_XFS_FS=3Dm
 CONFIG_XFS_QUOTA=3Dy
 CONFIG_AUTOFS_FS=3Dm
--=20
2.42.0


