From: Andrew Morton <akpm@osdl.org>
Subject: Re: [PATCH] reiserfs: eliminate minimum window size for bitmap
 searching
Date: Tue, 22 Aug 2006 19:49:46 -0700
Message-ID: <20060822194946.7411112f.akpm@osdl.org>
References: <44EB1484.2040502@suse.com>
	<44EB23D9.9000508@slaphack.com>
	<44EB28EC.50802@suse.com>
	<44EB684C.2090206@slaphack.com>
	<44EB7518.5010204@suse.com>
	<20060822171133.72692542.akpm@osdl.org>
	<20060823024634.GK9112@HAL_5000D.tc.ph.cox.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29670-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060823024634.GK9112@HAL_5000D.tc.ph.cox.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Clay Barnes <clay.barnes@gmail.com>
Cc: Jeff Mahoney <jeffm@suse.com>, David Masover <ninja@slaphack.com>, Linus Torvalds <torvalds@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, Mike Benoit <ipso@snappymail.ca>

On Tue, 22 Aug 2006 19:46:34 -0700
Clay Barnes <clay.barnes@gmail.com> wrote:

> Perhaps I mis-recall, but shouldn't delayed writes (or something along 
> those lines) cause a case where two files are being incrementally
> written rare?

If we did delayed allocation, yes.  But we generally don't.  (Exceptions:
XFS, reiser4, ext4, ext2 prototype circa 2001).
