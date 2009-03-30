From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [patch 09/35 error-handling] reiserfs: add locking around error buffer
Date: Mon, 30 Mar 2009 20:48:42 +0200
Message-ID: <87y6umlud1.fsf@basil.nowhere.org>
References: <20090330180215.951354436@suse.com>
	<20090330181010.432220021@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090330181010.432220021@suse.com> (Jeff Mahoney's message of "Mon, 30 Mar 2009 14:02:24 -0400")
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Jeff Mahoney <jeffm@suse.com> writes:

>  The formatting of the error buffer is race prone. It uses static buffers
>  for both formatting and output. While overwriting the error buffer
>  can product garbled output, overwriting the format buffer with incompatible
>  % directives can cause crashes.

Really? Just curious but could you describe the steps how a garbled printk can
leads to a crash?

Thanks,

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.
