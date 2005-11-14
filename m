From: Tom Vier <tmv@comcast.net>
Subject: Re: need opinions from sysadmins on where reiser4progs should install
Date: Mon, 14 Nov 2005 15:50:31 -0500
Message-ID: <20051114205031.GA5917@zero>
References: <4376E891.6070506@namesys.com>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26936-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4376E891.6070506@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

On Sat, Nov 12, 2005 at 11:17:37PM -0800, Hans Reiser wrote:
> What do the sysadmins on the list think?

Doesn't matter to me, fwiw. If i were to build it manually, i'd run
./configure --prefix=/usr/local. A distribution would use --prefix=/ in its
build scripts. /usr/local might be a safer default, so that if someone's
installing it from source it would clobber their distro's version by
default.

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
