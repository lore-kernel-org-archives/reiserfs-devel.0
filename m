From: Chris Mason <mason@suse.com>
Subject: Re: Problems with journal size option on mkfs
Date: 16 May 2002 07:52:59 -0400
Message-ID: <1021549979.14986.759.camel@tiny>
References: <OFE8E86981.F03B17DE-ON85256BBA.006A1833@pok.ibm.com>
	<20020516091611.A6880@namesys.com>  <3CE38E43.1000408@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10329-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CE38E43.1000408@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, Steve Pratt <slpratt@us.ibm.com>, reiserfs-list@namesys.com

On Thu, 2002-05-16 at 06:47, Hans Reiser wrote:

> journal resizing and relocating will go into the next pre1.
> 

That makes for a huge set of changes we have planned for pre1.  We need
to limit ourselves to one significant change per prerelease, otherwise
debugging is very difficult.

The journal relocation stuff needs to be tossed onto an FTP site and
widely tested before we submit for a stable kernel series.  It clearly
has not been widely tested 2.5.x ;-)

-chris


