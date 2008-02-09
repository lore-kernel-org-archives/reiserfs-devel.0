From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: [PATCH] REISERFS: Remove commented __KERNEL__ test from
 reiser_fs.h.
Date: Sat, 9 Feb 2008 12:40:33 -0500 (EST)
Message-ID: <alpine.LFD.1.00.0802091238210.10903@localhost.localdomain>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org


Remove the superfluous, commented test for __KERNEL__ from
include/linux/reiser_fs.h.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/include/linux/reiserfs_fs.h b/include/linux/reiserfs_fs.h
index 8e7eff2..3ebd6db 100644
--- a/include/linux/reiserfs_fs.h
+++ b/include/linux/reiserfs_fs.h
@@ -1540,7 +1540,6 @@ struct reiserfs_iget_args {
 /*                    FUNCTION DECLARATIONS                                */
 /***************************************************************************/

-/*#ifdef __KERNEL__*/
 #define get_journal_desc_magic(bh) (bh->b_data + bh->b_size - 12)

 #define journal_trans_half(blocksize) \


========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

Home page:                                         http://crashcourse.ca
Fedora Cookbook:    http://crashcourse.ca/wiki/index.php/Fedora_Cookbook
========================================================================
