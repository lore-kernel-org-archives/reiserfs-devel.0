From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfs and TUX2 - 2.4.18 or 2.4.19?
Date: Thu, 19 Dec 2002 18:58:05 +0300
Message-ID: <20021219185805.A6905@namesys.com>
References: <3DFDD5B5.7050000@dsvr.net> <001301c2a776$d2ac9360$0101a8c0@bummer>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12173-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <001301c2a776$d2ac9360$0101a8c0@bummer>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: darren <teodarren@myrealbox.com>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Dec 19, 2002 at 11:53:49PM +0800, darren wrote:

> I want to run TUX2 to serve files off my ReiserFS partition.
> But I cannot seem to get TUX2 on kernel 2.4.19, which I would like to
> run my reiserfs partition on.

We cannot tell you anything about Tux2 because we do not know anything
about it ;)

> Should I just stick to 2.4.18 and somehow patch the reiserfs there??

If you plan to run not current 2.4 kernels, you might want to
get patches from ftp://ftp.namesys.com/pub/reiserfs-for-2.4/<version>.pending

Where <version> next kernel version. (repeat that until you reach latest
kernel). 

But actually 2.4.18 is pretty stable and you may not want to patch it if you
want.

Bye,
    Oleg
