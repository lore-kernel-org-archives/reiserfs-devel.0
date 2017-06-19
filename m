From: Tahsin Erdogan <tahsin@google.com>
Subject: Re: [PATCH 28/28] quota: add extra inode count to dquot transfer functions
Date: Mon, 19 Jun 2017 04:46:00 -0700
Message-ID: <CAAeU0aM=QDb-iCnr5KVatQmmbQy8A7XmbyFBttK72SGt3oNTUg@mail.gmail.com>
References: <20170531081517.11438-1-tahsin@google.com> <20170531081517.11438-28-tahsin@google.com>
 <20170615075735.GB1764@quack2.suse.cz> <CAAeU0aNgon_ERWyUNmAGaBCuk3dU9qAxA7QnZ4D8cb5g6JZcPg@mail.gmail.com>
 <20170619090329.GE11837@quack2.suse.cz>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=KwOnGCm7WM15yuz9sU69te2XI2wZrJTDBV8TflkOiJI=;
        b=gBxMPcl2Zv6BqOlKCxXIWKtVfMSbtljCqUBf+5SnhnzYRi5Vx86MZGoWRxB2n4sEDZ
         x4FUE++Q843/Kun9j/Atude4MCcgKp3fFhcZIt7Lqmp6thq2mOk7FaQtxUbeKydrCv8t
         O/bmg4LDEJhcpGPfPRsv6p0H5DTazPO8wbDivH4sUjI63L9F4Za7DazILiwwVN+fs+nc
         76s3A4HYqOxqKPobglt/Tdmowoowdfj5x1ZgCaDh77aWtXTo0v30M2bkNawCIhm0+Qrv
         UXiWjh5PxpczniupdJdM0aBGRiDuz1OjSCE0Yf5e3DmmgXiMGK5NsAJomGXJJ2LC7LTN
         EL5A==
In-Reply-To: <20170619090329.GE11837@quack2.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Dave Kleikamp <shaggy@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Mark Fasheh <mfasheh@versity.com>, Joel Becker <jlbec@evilplan.org>, Jens Axboe <axboe@fb.com>, Deepa Dinamani <deepa.kernel@gmail.com>, Mike Christie <mchristi@redhat.com>, Fabian Frederick <fabf@skynet.be>, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, jfs-discussion@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org

>> I tried that approach by adding a "int get_inode_usage(struct inode
>> *inode, qsize_t *usage)" callback to dquot_operations. Unfortunately,
>> ext4 code that calculates the number of internal inodes
>> (ext4_xattr_inode_count()) is subject to failures so the callback has
>> to be able to report errors. And, that itself is problematic because
>> we can't afford to have errors in dquot_free_inode(). If you have
>> thoughts about how to address this please let me know.
>
> Well, you can just make dquot_free_inode() return error. Now most callers
> won't be able to do much with an error from dquot_free_inode() but that's
> the case also for other things during inode deletion - just handle it as
> other fatal failures during inode freeing.
>
I just checked dquot_free_inode() to see whether it calls anything
that could fail. It calls mark_all_dquot_dirty() and ignores the
return code from it. I would like to follow the same for the
get_inode_usage() as the only use case for get_inode_usage() (ext4)
should not fail at inode free time.

Basically, I want to avoid changing return type from void to int
because it would create a new responsibility for the filesystem
implementations who do not know how to deal with it.
