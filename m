From: Pieter Smith <pieter@boesman.nl>
Subject: [PATCH 39/56] fs/reiserfs: support compiling out splice
Date: Thu, 13 Nov 2014 22:23:16 +0100
Message-ID: <1415913813-362-40-git-send-email-pieter@boesman.nl>
References: <pieter@boesman.nl>
 <1415913813-362-1-git-send-email-pieter@boesman.nl>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0YG5oqz4PhZ//NSSg/5cY7eCXiAVWuLWBLGebYbGahE=;
        b=BYuhN1ONEax2wvUAUo7KpOG6PiTzt8eTIJzRfXFO3NjKqigO+MZiaKczPz87xTzCDh
         tkJKx5+kzmXGDG4DmW+nK31xMracElCxh3mUGrCxr2ztzxwHN8gMrHAJZKJTpIxeomAX
         8eyZaQ5mKAyFFX5oZMxI2rToHNdBqZiqnbYYjcZApI0LvTSHshhgFTbMu5WdhlPF857+
         oydlbYcpnqv2OvVySNceyLVHAUKnjnTbeKzOm5GKoma1fRDANWckxpVnePSNb2HwirxG
         qpNB1N02vIhdVTEEPeMhhqTjZUagQo3lFAFUOZLXi0rHWsERas8/z98yS15lsSRV2yhJ
         /tzA==
In-Reply-To: <1415913813-362-1-git-send-email-pieter@boesman.nl>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pieter@boesman.nl
Cc: Josh Triplett <josh@joshtriplett.org>, Jan Kara <jack@suse.cz>, Jeff Mahoney <jeffm@suse.com>, Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@infradead.org>, Fabian Frederick <fabf@skynet.be>, "open list:REISERFS FILE SYSTEM" <reiserfs-devel@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

Compile out splice support from reiserfs when the splice-family of syscalls is
not supported by the system (i.e. CONFIG_SYSCALL_SPLICE is undefined).

Signed-off-by: Pieter Smith <pieter@boesman.nl>
---
 fs/reiserfs/file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/reiserfs/file.c b/fs/reiserfs/file.c
index 751dd3f..b716c59 100644
--- a/fs/reiserfs/file.c
+++ b/fs/reiserfs/file.c
@@ -255,8 +255,8 @@ const struct file_operations reiserfs_file_operations = {
 	.fsync = reiserfs_sync_file,
 	.read_iter = generic_file_read_iter,
 	.write_iter = generic_file_write_iter,
-	.splice_read = generic_file_splice_read,
-	.splice_write = iter_file_splice_write,
+	SPLICE_READ_INIT(generic_file_splice_read)
+	SPLICE_WRITE_INIT(iter_file_splice_write)
 	.llseek = generic_file_llseek,
 };
 
-- 
1.9.1
