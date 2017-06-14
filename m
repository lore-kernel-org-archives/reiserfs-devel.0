From: Tahsin Erdogan <tahsin@google.com>
Subject: Re: [PATCH 29/31] ext4: reserve space for xattr entries/names
Date: Wed, 14 Jun 2017 16:39:37 -0700
Message-ID: <CAAeU0aPBotudmaexDh60tBZUcFYk5ZDE2S9byMdD+u1Q34AXnA@mail.gmail.com>
References: <20170614172326.18670-1-tahsin@google.com> <20170614230518.GA4518@birch.djwong.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=3shzr4otjC0w3rTqLTKOSbmF//RLRcZfamFnIuWQ89w=;
        b=U2f3VfRlodnURWzVbh+NhYo/sdRTXAkC5tkGtFB4IIrabg4tNV8/mvheqit511s/ZJ
         U7PJ9kTfVe4AMlfUmaXHDmSODhCDSeUK4aAqLnzcvI5J9r4+WvA97YbPndvv5YZCH04s
         37AsN852rw/bM+H6wAt0IDp42OLgeHma6fTnWMp2AMmyPRLNtKzyy6wZU2FwzjHRmJEt
         4rEugmeRhmJrZpLkbkhdXN+TfN8f6Uz8At1IQYG8LTDL/yVlofOHOKawU/Z1asng9Nrw
         GeHb9Cm1xdOI61pYrMWYuss8U/I2LWqZBuorLyH84tHCz+fn2TnvgbI9wuBUyr778k4a
         AQew==
In-Reply-To: <20170614230518.GA4518@birch.djwong.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Dave Kleikamp <shaggy@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Mark Fasheh <mfasheh@versity.com>, Joel Becker <jlbec@evilplan.org>, Jens Axboe <axboe@fb.com>, Deepa Dinamani <deepa.kernel@gmail.com>, Mike Christie <mchristi@redhat.com>, Fabian Frederick <fabf@skynet.be>, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, jfs-discussion@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org

On Wed, Jun 14, 2017 at 4:05 PM, Darrick J. Wong
<darrick.wong@oracle.com> wrote:
> Why not just spill the values into their own ea_inodes if we need the
> space?  I guess that has the disadvantage that now we need to reserve
> quite a few more journal credits ((1 inode block, 1 bbitmap block, 1
> ibitmap block, 1 data block) * nr_inline_values) just in case we end up
> spilling all the values.
>

In last week's ext4 conference call we have discussed this problem and
possible solutions. The major concern with spilling/evacuation
approach was the added complexity. We haven't discussed the impact on
journal credits, but that is a valid point too.
