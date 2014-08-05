From: Jeff Chua <jeff.chua.linux@gmail.com>
Subject: Re: [PATCH] reiserfs: fix corruption introduced by balance_leaf refactor
Date: Tue, 5 Aug 2014 17:28:30 +0800
Message-ID: <CAAJw_Zuqs+3OFCaQC8AcPP1cVgMnhQgc6GxB+Uyrby80fe3rLQ@mail.gmail.com>
References: <53E01C93.4050801@suse.com>
	<20140805083902.GA19945@quack.suse.cz>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=RTKTztYUKKCDHFedXNyksJsIq2R/82BKtKdkarPDhwE=;
        b=z1IrZgLZ2tDIT9Kos7APzbiAjCJmgydjUn61zg3QBW8/lbmyWjz8GlWljNJ52m4fxk
         334FTAuroAKY/0AcKZC1eO9EI7rzBGT2epdWR3+OQIEh/9FnmDwsIN0ExpMbvSK+988k
         lbRwWhLOC9Hwkxy9zNbYu64mUVj6hIY+tuQ8QO/iowhvo8SPsjqiXEcygPdPu8yMXb0f
         JeoKoGKBQk+8+J3v1YO0N/AMxXdHQCVPxE9TDoOneRQbCNNYRZ9L3V5oTA7LnGFEJYDj
         2Dz7qPFOX5dRPYuNt9unWqy/gwCDtEHi6CYFXDj4fPjVnrAn/7PygVp4UB/F0/tNBpy/
         zE1A==
In-Reply-To: <20140805083902.GA19945@quack.suse.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Jeff Mahoney <jeffm@suse.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>, stable@vger.kernel.org

On Tue, Aug 5, 2014 at 4:39 PM, Jan Kara <jack@suse.cz> wrote:
> On Mon 04-08-14 19:51:47, Jeff Mahoney wrote:
>> Commits f1f007c308e (reiserfs: balance_leaf refactor, pull out
>   Thanks. I've added the patch to my tree and I'll push it to Linus in this
> merge window (after basic test runs finish).

It's holding so far. I'm compiling mozilla brower, xul-runner and gcc
now and all the compilings are still running in vmware ... not yet
finished though.

Then, I'll run more tests on my real h/w.

Jeff.
