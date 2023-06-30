From: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH] reiserfs: Check the return value from __getblk()
Date: Fri, 30 Jun 2023 11:03:05 +0200
Message-ID: <20230630-kerbholz-koiteich-a7395bc04eae@brauner>
References: <ZJ32+b+3O8Z6cuRo@casper.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688115795;
        bh=BAEdB9AU2UhM5oIx7SMy+OVSnZV+XbGLw1XDnZhbfjQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G3AWj7zC6tSuEDvbCtpbrqx0/vLrEbpPa5n0slRgbYVhKNidm5e6nZOqZKKpFXkks
         G1j1Kn072ZE/kqYrA5VDJpnbhN1UXySSKshSHq0Rn8OOnmyCVRZXRfmEstJIFpBuY+
         qjtvLg6LrI8++QgT0/4rUfkTYPrCyPL/2gLY9NnzBIwzUC9BiPIN0XZDqz43hkYYC/
         JJKl4VWQcJnrMNbduVKBx8hDvtyE2v0TR9yzaYG1zNFOrgF8I60koQpbSEaRtv8dUr
         0jcCi3faGa7ZUCBwVwIJ2c5CrXjjwwsw69T+EUICOzuAr9aHsBhqP7b92Abun9tdql
         +2hYNuJZkulVQ==
In-Reply-To: <ZJ32+b+3O8Z6cuRo@casper.infradead.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1274; i=brauner@kernel.org; h=from:subject:message-id; bh=DCdt8XEWQ1l0xHmVcCmWOPuYByMfuib7CuZ1rw+h1tc=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaTMm2VbO5Oj/XrCxup3B3d05v6fUmTIMPlOg07CxR1TskSc DOef7ChlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZjI5NWMDD+/djrUxPhNcN9s/33jtB uiTxXWhcmFn77mXvrmZ+KmtB2MDP/XB8/fVvuryCWU79jM6tjTRUXnul1mXXyyXkTx2SoBeQYA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>, butt3rflyh4ck <butterflyhuangxx@gmail.com>

From: Matthew Wilcox <willy@infradead.org>

On Thu, 29 Jun 2023 23:26:17 +0200, Matthew Wilcox wrote:
> __getblk() can return a NULL pointer if we run out of memory or if
> we try to access beyond the end of the device; check it and handle it
> appropriately.
> 
> [...]

Willy's original commit with message id
<20230605142335.2883264-1-willy@infradead.org> didn't show up on lore.
Might be because reiserfs-devel isn't a list tracked by lore; not sure.
So I grabbed this from somewhere else.

In any case, I picked this up now.

---

Applied to the vfs.misc branch of the vfs/vfs.git tree.
Patches in the vfs.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.misc

[1/1] reiserfs: Check the return value from __getblk()
      commit: https://git.kernel.org/vfs/vfs/c/958c5fee0047
