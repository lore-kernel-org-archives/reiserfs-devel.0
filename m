From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [patch 00/35] Jeff's ReiserFS Patch Queue
Date: Mon, 30 Mar 2009 12:38:13 -0700 (PDT)
Message-ID: <alpine.LFD.2.00.0903301236280.4093@localhost.localdomain>
References: <20090330180215.951354436@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090330180215.951354436@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>



On Mon, 30 Mar 2009, Jeff Mahoney wrote:
> 
> I'd like to submit my reiserfs patch queue for inclusion into 2.6.30.

Hmm. Looks fine, and I merged it. I had a number of mostly trivial 
conflicts (most due to the quota name cleanup to lower-case, with some 
header file export cleanup conflicts added in), but they looked fairly 
straightforward and I compile-tested the end result.

I don't have any reiserfs filesystems left, though, so you should really 
double-check the end result.

> Once this is applied, I expect reiserfs to be in deep maintenance-only 
> mode.

Heh, I hadn't expected even this.

		Linus
