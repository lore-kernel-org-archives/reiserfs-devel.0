From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH?] reiserfs: prevent panic: don't allow %-char in journal dev.
 name
Date: Wed, 4 Apr 2018 18:25:16 -0700
Message-ID: <d9b518a5-287a-72b3-05f1-ea89e25563ba@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Cc:Subject:From:To:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=BOatZjLQUOVLk7Pofer6nDcLn+IRRL4enqQtTjAfYH8=; b=eNPJvgNVg5GVDCcDFsrxBGbWP
        2j2IQY0ELZorRN6fropazPvNLnH0YDDH644Rm6ZT/Jf9+OamE0St9vQvFFu+XanMZyVN0IPadGwSM
        rH9CsBVsdkPlt2prVlGXeJxbgYDB86Zb6ATy+Ixa9MRDlgaQ1hCGaH4RDBtBW5ch1/00WEhV4nmLY
        sOyoL8Kn90y5a6aFyOsfTIEMAKIyIYvGdAr5P4jFUYRNmLmQQnpP4o3sNElBMCjv2J7B/a76sJNEy
        zR6SPApqDqscSsj2wKfLh05zwmJjQZuzGHKScNsu5VHwzwBGpSPBioV2ufHVuPQEtPb6xIMY9+rr7
    
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: LKML <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jeff Mahoney <jeffm@suse.com>, Jan Kara <jack@suse.com>, Frederic Weisbecker <fweisbec@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, syzkaller-bugs@googlegroups.com, syzbot+6bd77b88c1977c03f584@syzkaller.appspotmail.com

From: Randy Dunlap <rdunlap@infradead.org>

If the reiserfs mount option's journal name contains a '%' character,
it can lead to a WARN_ONCE() in lib/vsprintf.c::format_decode(),
saying: "Please remove unsupported %/ in format string."
That's OK until panic_on_warn is set, at which point it's dead, Jim.

To placate this situation, check the journal name string for a '%'
character and return an error if one is found. Also print a warning
(one that won't panic the kernel) about the invalid journal name (e.g.):

  reiserfs: journal device name is invalid: %/file0

(In this example, the caller app specified the journal device name as
"%/file0".)

Fixes: https://syzkaller.appspot.com/bug?id=0627d4551fdc39bf1ef5d82cd9eef587047f7718

Reported-by: syzbot+6bd77b88c1977c03f584@syzkaller.appspotmail.com
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: stable@vger.kernel.org # many kernel versions
Cc: reiserfs-devel@vger.kernel.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Jeff Mahoney <jeffm@suse.com>
Cc: Jan Kara <jack@suse.com>
Cc: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Andrew Morton <akpm@linuxfoundation.org>
---
 fs/reiserfs/super.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

--- lnx-416.orig/fs/reiserfs/super.c
+++ lnx-416/fs/reiserfs/super.c
@@ -1239,6 +1239,8 @@ static int reiserfs_parse_options(struct
 		}
 
 		if (c == 'j') {
+			char *badfmt;	// jdev_name (arg) cannot contain '%'
+
 			if (arg && *arg && jdev_name) {
 				/* Hm, already assigned? */
 				if (*jdev_name) {
@@ -1248,6 +1250,15 @@ static int reiserfs_parse_options(struct
 							 "be %s", *jdev_name);
 					return 0;
 				}
+
+				badfmt = strchr(arg, '%');
+				if (badfmt) {
+					printk(KERN_WARNING "reiserfs: "
+						 "journal device name "
+						 "is invalid: %s",
+						 arg);
+					return 0;
+				}
 				*jdev_name = arg;
 			}
 		}

