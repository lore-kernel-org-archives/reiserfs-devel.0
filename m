From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [patch 0/7] reiserfs fixes patch set
Date: Wed, 17 Oct 2007 15:11:40 -0700
Message-ID: <20071017151140.c5b782ef.akpm@linux-foundation.org>
References: <20071016230210.779927000@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20071016230210.779927000@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: torvalds@linux-foundation.org, reiserfs-devel@vger.kernel.org

On Tue, 16 Oct 2007 19:02:10 -0400
Jeff Mahoney <jeffm@suse.com> wrote:

>  This is a series of "safe" patches that have been in the openSUSE kernel
>  for a while now.
> 

I'm not particularly happy seeing a large number of complex-looking patches
against a not-very-well-maintained important filesystem more than a week
into the merge window.  It would have been far better to get this stuff
sent a month ago.

Now we're left with a choice between holding it all back for 2.5 months or
just jamming it into mainline with basically no testing.  I sure hope it
got good testing in the suse kernel.


