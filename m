From: "Mike Lothian" <mike@fireburn.co.uk>
Subject: Reiser4 and d_alloc_anon
Date: Sun, 26 Oct 2008 14:24:10 +0000
Message-ID: <f3f71ab90810260724i4db015d8r2eb562d9ef142fe1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: reiserfs-devel@vger.kernel.org

Hi

Reiser4 still uses d_alloc_anon and is't compiling on Linus's tree

I took a look at:

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=440037287c5ebb07033ab927ca16bb68c291d309

But it looks like it isn't a case of renaming to d_obtain_alias

Does any one have a patch for this?

Cheers

Mike
