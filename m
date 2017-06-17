From: Tahsin Erdogan <tahsin@google.com>
Subject: Re: [PATCH 28/28] quota: add extra inode count to dquot transfer functions
Date: Fri, 16 Jun 2017 18:50:58 -0700
Message-ID: <CAAeU0aNgon_ERWyUNmAGaBCuk3dU9qAxA7QnZ4D8cb5g6JZcPg@mail.gmail.com>
References: <20170531081517.11438-1-tahsin@google.com> <20170531081517.11438-28-tahsin@google.com>
 <20170615075735.GB1764@quack2.suse.cz>
Mime-Version: 1.0
Return-path: <linux-ext4-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=LmPDSLF0xoG5zQTJoa0+pDct/03K8a/n8qNFZufg/go=;
        b=phdBxbBSOJ41VkzNy3EKQ8coGQQvhmUcIZSDJiSP5HCatq5vVNQGJiB9qLqZ9T9Uqr
         Wux1GuHbEfirp+I9eEcez8/146/MD8rHPBbk06Ewl5oWzipDutfeCYSwOzT+5rNgh0bc
         pMR73JHO18y2T7GRln2Xkg0FdxBLXbOI0AMlKsdNBkvFBrYchFXR2Ev5wlZLrdlq+bpY
         xi2UZCiq49t6VuB98+W/tiNio40HErjwuZqwYE310ZWqBL/2eznR5YhdlR5aL6MJaEd6
         bUB+s8QGiQWcYQUetqGAZ5StucMB3mVYfMGK2DR1lxKmtqpSB5kcIGvy0R2XwG6Zaz/J
         nQgg==
In-Reply-To: <20170615075735.GB1764@quack2.suse.cz>
Sender: linux-ext4-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Dave Kleikamp <shaggy@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Mark Fasheh <mfasheh@versity.com>, Joel Becker <jlbec@evilplan.org>, Jens Axboe <axboe@fb.com>, Deepa Dinamani <deepa.kernel@gmail.com>, Mike Christie <mchristi@redhat.com>, Fabian Frederick <fabf@skynet.be>, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, jfs-discussion@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org

On Thu, Jun 15, 2017 at 12:57 AM, Jan Kara <jack@suse.cz> wrote:
> Hum, rather handle this similarly to how we handle delalloc reserved space.
> Add a callback to dq_ops to get "inode usage" of an inode and then use it
> in dquot_transfer(), dquot_free_inode(), dquot_alloc_inode().

I tried that approach by adding a "int get_inode_usage(struct inode
*inode, qsize_t *usage)" callback to dquot_operations. Unfortunately,
ext4 code that calculates the number of internal inodes
(ext4_xattr_inode_count()) is subject to failures so the callback has
to be able to report errors. And, that itself is problematic because
we can't afford to have errors in dquot_free_inode(). If you have
thoughts about how to address this please let me know.

Alternatively, I could try to make this patch less intrusive by
keeping the existing dquot_transfer() signature and add a new
dquot_transfer_usage() that accepts inode_usage as a parameter. What
do you think?
