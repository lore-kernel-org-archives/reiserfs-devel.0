From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: [PATCH/SCRIPT] reiserfs: run scripts/Lindent on reiserfs code
Date: Tue, 12 Jul 2005 20:26:57 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0507122022530.17536@g5.osdl.org>
References: <20050712232412.GA9669@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25119-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050712232412.GA9669@locomotive.unixthugs.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>



On Tue, 12 Jul 2005, Jeff Mahoney wrote:
> 
> scripts/Lindent fs/reiserfs/*.c include/linux/reiserfs_*.h

Ok, applied. You should check that you got the same results I did, and 
feel free to send further cleanup patches. Sometimes "indent" does some 
silly things.

		Linus
