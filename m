From: Oleg Drokin <green@namesys.com>
Subject: Re: Symbol collisions in patch?
Date: Wed, 3 Apr 2002 16:55:32 +0400
Message-ID: <20020403165532.A1126@namesys.com>
References: <NDBBJPAGKLCMDEIEKOPBMEPGGNAA.mailinglists@websitemanagers.com.au> <Pine.LNX.4.44.0204030639310.647-100000@conn6m.toms.net>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0204030639310.647-100000@conn6m.toms.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Oehser <tom@toms.net>
Cc: Adam Goryachev <mailinglists@websitemanagers.com.au>, reiserfs-list@namesys.com

Hello!

On Wed, Apr 03, 2002 at 06:51:23AM -0500, Tom Oehser wrote:

> > Why spend the next 6 months/12 months (I have no idea how long) developing
> > support for 2.0 and 2.2 kernels with reiserfs when by that stage, even the
> It wouldn't take that long to fix the symbol collisions and apply the
> known-missing patch.  It probably wouldn't take that long to backport the
> 3.6 stuff.

Symbol collisions are not going to be fixed at reiserfs side.
Symbol collisions were introduced by ext3 folks.

Bye,
    Oleg
