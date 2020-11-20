From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH 051/141] reiserfs: Fix fall-through warnings for Clang
Date: Fri, 20 Nov 2020 12:32:14 -0600
Message-ID: <6859fecccd96f79612f9650fdba7a66bbff70560.1605896059.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605897128;
        bh=iulE+KLntbnkYHnpp3V6ms2NVYQETxkeP+5vYNfCD8w=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=sBu+qenmt30F7OoM3sUlnKTAqwsekFyc9baqj29e99o/ArUzPGx2hDEspU89Obts6
         jbqAMbsfYcrDWsOthAfZpyjhcKGOzj8qqk9R28nmLorBvwSH3JIZHE9ee1nQEHvMh4
         T7gp2qNgpACnhChuQFMGDOMEoD1xVahLjcugQYuU=
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a break statement instead of letting the code fall
through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 fs/reiserfs/namei.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
index 1594687582f0..90bb49bfdba0 100644
--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -132,6 +132,7 @@ int search_by_entry_key(struct super_block *sb, const struct cpu_key *key,
 			return IO_ERROR;
 		}
 		PATH_LAST_POSITION(path)--;
+		break;
 
 	case ITEM_FOUND:
 		break;
-- 
2.27.0

