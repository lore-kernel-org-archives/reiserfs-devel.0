From: Tom Vier <tmv@comcast.net>
Subject: Re: [PATCH] updated reiser4 - reduced cpu usage for writes by writing more than 4k at a time (has implications for generic write code and eventually for the IO layer)
Date: Wed, 24 May 2006 13:53:12 -0400
Message-ID: <20060524175312.GA3579@zero>
References: <44736D3E.8090808@namesys.com>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28674-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <44736D3E.8090808@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Linux-Kernel@Vger.Kernel.ORG, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

On Tue, May 23, 2006 at 01:14:54PM -0700, Hans Reiser wrote:
> underlying FS can be improved.  Performance results show that the new
> code consumes  40% less CPU when doing "dd bs=1MB ....." (your hardware,
> and whether the data is in cache, may vary this result).  Note that this
> has only a small effect on elapsed time for most hardware.

Write requests in linux are restricted to one page?

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
