From: Chris Friesen <cfriesen@nortelnetworks.com>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 25 Aug 2004 16:23:33 -0400
Message-ID: <412CF545.7070601@nortelnetworks.com>
References: <412CEE38.1080707@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20511-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412CEE38.1080707@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Christoph Hellwig <hch@lst.de>, akpm@osdl.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, Linus Torvalds <torvalds@osdl.org>, ReiserFS List <reiserfs-list@namesys.com>

Hans Reiser wrote:

> Making files into directories caused only two applications out of the
> entire OS to notice the change, and that was because of a bug in what
> error code we returned that we are going to fix.  You think that was a
> disaster; I think it was a triumph.

>  Since we have such a performance lead, Namesys is about to change its
> focus from the storage layer to semantics, look at
> www.namesys.com/whitepaper.html for details.  Semantic enhancements are
> the important stuff, and finally Namesys is where we have all the
> storage layer prerequisites done right, and the real work can begin. 

Just curious about your comments on Jamie Lokier's suggestions for enabling 
files-as-directories semantics without breaking existing apps.

Chris
