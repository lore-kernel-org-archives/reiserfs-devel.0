From: David Masover <ninja@slaphack.com>
Subject: Re: [PATCH] reiserfs: eliminate minimum window size for bitmap searching
Date: Tue, 22 Aug 2006 10:33:45 -0500
Message-ID: <44EB23D9.9000508@slaphack.com>
References: <44EB1484.2040502@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932143AbWHVPdq@vger.kernel.org>
In-Reply-To: <44EB1484.2040502@suse.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, Mike Benoit <ipso@snappymail.ca>

Jeff Mahoney wrote:
>  When a file system becomes fragmented (using MythTV, for example), the
>  bigalloc window searching ends up causing huge performance problems. In
>  a file system presented by a user experiencing this bug, the file system
>  was 90% free, but no 32-block free windows existed on the entire file system.
>  This causes the allocator to scan the entire file system for each 128k write
>  before backing down to searching for individual blocks.

Question:  Would it be better to take that performance hit once, then 
cache the result for awhile?  If we can't find enough consecutive space, 
such space isn't likely to appear until a lot of space is freed or a 
repacker is run.

>  In the end, finding a contiguous window for all the blocks in a write is
>  an advantageous special case, but one that can be found naturally when
>  such a window exists anyway.

Hmm.  Ok, I don't understand how this works, so I'll shut up.
