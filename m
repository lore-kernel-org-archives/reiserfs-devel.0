From: Tom Vier <tmv@comcast.net>
Subject: Re: Need Warm Fuzzies, ReiserFS (3)
Date: Mon, 20 Dec 2004 10:38:40 -0500
Message-ID: <20041220153840.GA11409@zero>
References: <41C66615.5010206@simutronics.com> <200412201331.25180.christian.mayrhuber@gmx.net>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22850-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200412201331.25180.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list@namesys.com

On Mon, Dec 20, 2004 at 01:31:25PM +0100, Christian Mayrhuber wrote:
> The barrier mount option should provide protection against a corrupted
> journal during power failure for drives with write caching enabled.
> (Mostly IDE)

There's a mount option for write barriers? It should be enabled by default.
Otherwise, that's asking for tons of users with corruption. 

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
