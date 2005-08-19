From: David Masover <ninja@slaphack.com>
Subject: Re: 15M files
Date: Fri, 19 Aug 2005 17:45:48 -0500
Message-ID: <4306611C.6070407@slaphack.com>
References: <5a59ce53050819144970d07ab0@mail.gmail.com>	 <43065D7D.2000802@namesys.com> <5a59ce53050819153961a71cde@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25583-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5a59ce53050819153961a71cde@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: studdugie <studdugie@gmail.com>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-mailing-list <reiserfs-list@namesys.com>



studdugie wrote:
> I can't use V4 because I can't introduce an unstable kernel on the box
> where the app is running.

Search the archives.  I wrote a sort of mini-howto on how to set up the
MM-kernel version of Reiser4 on a stable 2.6 kernel.  You don't even
need my patch if you do 2.6.13-rc6 with the latest MM patch (that you're
grabbing reiser4-specific stuff from)

That's if you trust Namesys that it's stable.  It's reasonably stable,
but maybe not mission-critical-stable yet, in that it hasn't been
hammered by millions of users yet.  But, it works for me.

