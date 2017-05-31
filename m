From: Tahsin Erdogan <tahsin@google.com>
Subject: Re: [PATCH 07/28] ext4: call journal revoke when freeing ea_inode blocks
Date: Wed, 31 May 2017 14:01:26 -0700
Message-ID: <CAAeU0aNS-xT4rNPKrO7kG5dLep+xqbVFGRWw8NaiXBbAYf1-=w@mail.gmail.com>
References: <20170531081517.11438-1-tahsin@google.com> <20170531081517.11438-7-tahsin@google.com>
 <20170531161257.GI4510@birch.djwong.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=P2WMGZ3IEnAexD0rmE1JKnKXhv3al8VqUdRglsv0+pw=;
        b=qbRiMqEF5ixijdlCzhiOQiFVVx3na+K5Ew4ILeypGlEQAZOjwmzNe+Bph1CsGKFhKo
         aXxZtjb7sD6ipL3WKS8ZmRMFBE/Bc/J7IycgpiFGze3++k83ST+g81HQM/3qz0mhN+kw
         /Vi5p18Y64dOcb8XpOYRgvR2R/N8UZasJiylIZmuibszMDk3VWBrWF2fb3/fpzPx1BvT
         RqUGNmGZJw0djn6S/7QtMrWmTkfpayDzCM3K0lbDcgbkE1FKLBPCLZldPhua3cmS4wan
         iaLnWh/M+8Vk0FT2x91Pkg23un7bdvLGNA65Ol84K6u5ZzNuRr6iyeSyAjN32EHkqjnZ
         BYYA==
In-Reply-To: <20170531161257.GI4510@birch.djwong.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Dave Kleikamp <shaggy@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Mark Fasheh <mfasheh@versity.com>, Joel Becker <jlbec@evilplan.org>, Jens Axboe <axboe@fb.com>, Deepa Dinamani <deepa.kernel@gmail.com>, Mike Christie <mchristi@redhat.com>, Fabian Frederick <fabf@skynet.be>, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, jfs-discussion@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org

> I think it would be wise not to support !extents && ea_inode,
> particularly since blockmaps aren't protected by metadata_csum and so in
> the long run it's probably best to minimize the introduction of new
> blockmap files (on ext4 anyway).

Sounds good. I will add that to e2fsprogs patches. thanks
