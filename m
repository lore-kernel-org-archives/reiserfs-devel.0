From: "Alexey Polyakov" <alexey.polyakov@gmail.com>
Subject: Re: reiser4 resize
Date: Wed, 20 Sep 2006 11:39:08 +0400
Message-ID: <b5d90b2a0609200039g70c40f5bvb374b5f15b42988d@mail.gmail.com>
References: <eeng4b$i68$1@sea.gmane.org> <200609191723.01936.vs@namesys.com>
	 <45102ED6.6080209@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29946-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <45102ED6.6080209@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

On 9/19/06, David Masover <ninja@slaphack.com> wrote:

> When I have over a
> gig of RAM free (not even buffer/cache, but _free_), and am trying to
> download anything over BitTorrent, even if it's less than 200 megs, the
> disk thrashes so badly that the system is really only usable for web and
> email.  Even movies will occasionally stall when this is happening, and
> by "occasionally", I mean every minute or so.

Do you have this problem on plain vanilla + reiser4? I think some
out-of-tree patches (like adaptive readahead?) may result in such
behaviour, independent of file system.
With a free gig of RAM reiser4 shouldn't access disk a lot, only during flushes.

-- 
Alexey Polyakov
