From: Tom Vier <tmv@comcast.net>
Subject: Re: development
Date: Tue, 6 Jan 2004 21:23:30 -0500
Message-ID: <20040107022330.GA2930@zero>
References: <3FFB16CD.8020805@mrs.umn.edu> <3FFB19AE.8080007@namesys.com>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16427-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3FFB19AE.8080007@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

i was just thinking about this the other day.

On Tue, Jan 06, 2004 at 11:25:18PM +0300, Hans Reiser wrote:
> We use UML for everything it can be used for.

what about putting the core code in a lib and using a file for storage? once
it stabilizes, remove the userland stuff and hook it up to the vfs.
actually, you could write it all for the vfs and the blk layer. just
emulated them in userspace. the app could load the lib and call the vfs
entry points. the core could use routines in a blkemu.c module that would
translate them to regular read/write calls.

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0xE6CB97DA
