From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] reiserfs: Force type conversion in xattr_hash
Date: Mon, 22 Apr 2019 12:27:05 -0700
Message-ID: <20190422122705.9df141f5c9b4e842e170e72a@linux-foundation.org>
References: <20190417115200.GA10168@bharath12345-Inspiron-5559>
        <20190418155019.ab5189e4e317df2b36861012@linux-foundation.org>
        <20190421170235.GI2217@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190421170235.GI2217@ZenIV.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Bharath Vedartham <linux.bhar@gmail.com>, jannh@google.com, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 21 Apr 2019 18:02:35 +0100 Al Viro <viro@zeniv.linux.org.uk> wrote:

> IOW, what sparse has caught here is a genuine endianness bug; images
> created on little-endian host and mounted on big-endian (or vice
> versa) will see csum mismatches when trying to fetch xattrs.

OK, thanks.  I'll drop the patch - we shouldn't hide that reminder of a
bug.

Perhaps someone could prepare a patch which adds a comment explaining
these issues, so someone else doesn't try to "fix" the sparse warning.

