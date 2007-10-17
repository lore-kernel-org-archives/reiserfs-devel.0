From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [patch 0/7] reiserfs fixes patch set
Date: Wed, 17 Oct 2007 15:19:47 -0700 (PDT)
Message-ID: <alpine.LFD.0.999.0710171518480.26902@woody.linux-foundation.org>
References: <20071016230210.779927000@suse.com>
 <20071017151140.c5b782ef.akpm@linux-foundation.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20071017151140.c5b782ef.akpm@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jeff Mahoney <jeffm@suse.com>, reiserfs-devel@vger.kernel.org



On Wed, 17 Oct 2007, Andrew Morton wrote:
> 
> Now we're left with a choice between holding it all back for 2.5 months or
> just jamming it into mainline with basically no testing.  I sure hope it
> got good testing in the suse kernel.

Well, considering that probably 95% of reiserfs users are SuSE people, it 
probably did get a fairly good testing base.

That said, I agree - it would have been better to have this lined up 
before the merge window even started, in -mm or somewhere.

		Linus
