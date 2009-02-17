From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [patch 2/4] vfs: add set_page_dirty_notag
Date: Tue, 17 Feb 2009 11:05:16 +0100
Message-ID: <1234865116.4744.46.camel@laptop>
References: <18837.24581.181196.569183@edward.zelnet.ru>
	 <1234530519.6519.46.camel@twins> <49957C43.7050701@gmail.com>
	 <1234534150.6519.101.camel@twins>
	 <18838.49922.215481.399653@edward.zelnet.ru>
	 <1234645893.4695.8.camel@laptop>
	 <18841.60432.329341.514726@edward.zelnet.ru>
	 <1234861781.4744.21.camel@laptop>  <20090217093805.GB31323@wotan.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090217093805.GB31323@wotan.suse.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nick Piggin <npiggin@suse.de>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Ryan Hope <rmh3093@gmail.com>, Randy Dunlap <randy.dunlap@oracle.com>, linux-kernel@vger.kernel.org, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

On Tue, 2009-02-17 at 10:38 +0100, Nick Piggin wrote:

> It is a great shame that filesystems are not properly notified
> that a page may become dirty before the actual set_page_dirty
> event (which is not allowed to fail and is called after the
> page is already dirty).

Not quite true, for example the set_page_dirty() done by the write fault
code is done _before_ the page becomes dirty.

This before/after thing was the reason for that horrid file corruption
bug that dragged on for a few weeks back in .19 (IIRC).

> This is a big problem I have with fsblock simply in trying to
> make the memory allocation robust. page_mkwrite unfortunately
> is racy and I've fixed problems there... the big problem though
> is get_user_pages. Fixing that properly seems to require fixing
> callers so it is not really realistic in the short term.

Right, I'm just not sure what we can do, even with a
prepage_page_dirty() function, what are you going to do, fail the fault?

