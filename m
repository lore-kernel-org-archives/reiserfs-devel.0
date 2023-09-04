From: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH] reiserfs: Replace 1-element array with C99 style flex-array
Date: Mon,  4 Sep 2023 13:49:18 +0200
Message-ID: <20230904-besuchen-aufgaben-26aa43101255@brauner>
References: <20230821043312.1444068-1-syoshida@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693828165;
        bh=3aY1ZemcCH+DmD8wlavtiJU3GHr/szhhOTN+39gCg1I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O5lmdvMfRyX8MGh1z77HMSA+tE/JEyvm3agM7dnlDgGePu/Pl+qaflJSekwy+/9J2
         z//e4244pPFCsBb7fKV8KTjkwMRiVMrKDQoeENRxLuCgNJtmAVKBygWkj325YuXvAO
         k1eOvWeQtBUXaxTl09upFIBh9UEP65cp9LJxqxbmHxzSAVyNPNWfuiUzcOwhyE1vo2
         IDPO87PCRUaUdikF46c9kNY5e+3QLleOMzpL/yGzWELz0ciNd/eIHskKM495d6Pi2p
         vAkjLClhBXrDPpHRjaM/gqAs7ufMz05k1yRuM18WrqivnqmrSUrUfG5pPV3iPixhXt
         Td5M7EWGeMQXg==
In-Reply-To: <20230821043312.1444068-1-syoshida@redhat.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211; i=brauner@kernel.org; h=from:subject:message-id; bh=3aY1ZemcCH+DmD8wlavtiJU3GHr/szhhOTN+39gCg1I=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaR8PWIgHnBb8dbbVWr/7stfPePHt/Yi/6F3UUJd23ltb6e3 P27x7ShlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZiISCfD/7quyQZGB/6v2Pj1ymueSe Kb7S8dkp730XxpddXatJPbE64wMhx7M5F3/YTC00HNop23fhh/23DsoZwKz9NVzzLvLH3wKYkTAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shigeru Yoshida <syoshida@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, dchinner@redhat.com, dsterba@suse.com, axboe@kernel.dk, viro@zeniv.linux.org.uk, reiserfs-devel@vger.kernel.org

On Mon, 21 Aug 2023 13:33:12 +0900, Shigeru Yoshida wrote:
> UBSAN found the following issue:
> 
> ================================================================================
> UBSAN: array-index-out-of-bounds in fs/reiserfs/journal.c:4166:22
> index 1 is out of range for type '__le32 [1]'
> 
> This is because struct reiserfs_journal_desc uses 1-element array for
> dynamically sized array member, j_realblock.
> 
> [...]

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

[1/1] reiserfs: Replace 1-element array with C99 style flex-array
      https://git.kernel.org/vfs/vfs/c/a7cb8be34170
