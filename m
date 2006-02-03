From: Jake Maciejewski <maciejej@msoe.edu>
Subject: Re: Reiser4 on powerpc; unresolved symbol, panic
Date: Fri, 03 Feb 2006 13:35:03 -0600
Message-ID: <1138995304.24587.64.camel@gentoo>
References: <1713.66.131.16.74.1138976256.squirrel@x2a.org>
	 <43E3A976.6090404@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28005-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43E3A976.6090404@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Jonathan Bastien-Filiatrault <joe@x2a.org>, Reiserfs mail-list <Reiserfs-List@namesys.com>

As I believe I've recommended before, PearPC on a high-end i386 machine
(I don't think JIT support is available for amd64) should be an adequate
PowerPC test platform.

On Fri, 2006-02-03 at 11:05 -0800, Hans Reiser wrote:
> Next week vs will look at changing new_page for page.  Thanks for
> finding a bug.  We don't have an iBook, so we can't really do more than
> fix the bugs you identify for us.
> 
> Hans
-- 
Jake Maciejewski <maciejej@msoe.edu>

