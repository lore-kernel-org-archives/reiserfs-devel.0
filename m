From: Tom Vier <tmv@comcast.net>
Subject: Re: Data Shredding on a Journal Filesystem
Date: Thu, 26 Sep 2002 02:13:32 -0400
Message-ID: <20020926061332.GA3588@yzero>
References: <93F527C91A6ED411AFE10050040665D0049C0072@corpusmx1.us.dg.com>
 <20020925113001.A23339@namesys.com>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-11543-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <20020925113001.A23339@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wed, Sep 25, 2002 at 11:30:01AM +0400, Oleg Drokin wrote:
> shred should work just fine with reiserfs in case you did not
> enable data journaling mode and you have tails disabled.
> The only thing that may be left on disk is filename and 
> blocks in which file itself was stored.

(shameless plug):
http://wipe.sf.net/

wipe also won't wipe the journal or wipe all traces of the filename, since
it works from userland, same as shred. if you really want to clean it (as
much as is possible - nothing can really 100% erase it), wipe the whole
block dev.

of course, putting sensitive files on a loopback encrypted fs is better.
then you don't have to worry about plaintext laying around, and you don't
need shred or wipe.

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0xE6CB97DA
