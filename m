From: Glenn Maynard <g_deb@zewt.org>
Subject: Re: plagiarism of reiserfs by Debian
Date: Sat, 19 Apr 2003 23:41:50 -0400
Message-ID: <20030420034150.GP32700@zewt.org>
References: <20030419230654.GF26352@cheney.cx> <F592E162-72C9-11D7-ADF3-00050285B655@ncpro.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13734-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <F592E162-72C9-11D7-ADF3-00050285B655@ncpro.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: debian-devel@lists.debian.org, reiserfs-list@namesys.com
Cc: Hans Reiser <reiser@namesys.com>, Vitaly Fertman <vitaly@namesys.com>

Trimmed CC: little; I can't imagine why this should go to -testing ...

On Sun, Apr 20, 2003 at 02:49:36AM +0200, Marcel Weber wrote:
> All I can say to this is: use what you like, resp. if you don't like 
> bloated software or spamware do not use it. My point is, that it should 
> be a right of the original authors of the software to include credits. 
> If someone else does a complete rewrite of the software, okay than we 
> can discuss it, but if the rewrite means only the removal of the 
> credits it is questionable.

This is irrelevant.  We're not questioning whether Hans Reiser has the
right to license his own software to prohibit the removal of large
messages.  The questions being asked are:

1. Is software licensed in the manner Hans intends DFSG-free?  That is,
is it DFSG-free to require that interactive programs output a full
page of sponsorship information?  (That's a question for debian-legal.)
If not, it can not be distributed in Debian and will be relegated to
non-free.

2. Is the software licensed consistently?  If not, it's probably not
legally safe to distribute at all, and will be removed entirely unless
Hans clarifies the licensing.

Another question that comes to mind: has ReiserFS used code from projects
licensed under the GPL?  If so, he can not, in fact, place this extra
restriction, as it would be in violation of GPL clause 6.  This isn't a
special issue for programs under completely different licenses; they know
they're not GPL-compatible and don't use GPL code.  However, when people
use "modified" GPL licenses, they often don't realise that they can no
longer use code from other GPL projects.

> But first of all, before we continue this discussion: What exactly has 
> been removed? A readme file, the outputs during boot time, the outputs 
> of mkfs.reiserfs? Has this output any impact on the usability of the 
> software, so that there were good reasons the remove it? Has the 
> license been violated by removing the credits?

It's been suggested that the removed message is the one referenced in
this bug report:

  http://bugs.debian.org/cgi-bin/bugreport.cgi?archive=no&bug=152547

Impact and "good reasons" don't matter.  Debian requires that users be
granted the right to do certain things regardless of whether they have
"good reasons".  If Hans doesn't want to grant those rights to users,
that's may be his choice, but Debian won't distribute his software.

-- 
Glenn Maynard
