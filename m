From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: reiserfs and TUX2 - 2.4.18 or 2.4.19?
Date: Fri, 20 Dec 2002 07:25:14 +0100
Message-ID: <200212200725.14668.Dieter.Nuetzel@hamburg.de>
References: <3DFDD5B5.7050000@dsvr.net> <001301c2a776$d2ac9360$0101a8c0@bummer> <20021219185805.A6905@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12184-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021219185805.A6905@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>, darren <teodarren@myrealbox.com>
Cc: reiserfs-list@namesys.com

Am Donnerstag, 19. Dezember 2002 16:58 schrieb Oleg Drokin:
> Hello!
>
> On Thu, Dec 19, 2002 at 11:53:49PM +0800, darren wrote:
> > I want to run TUX2 to serve files off my ReiserFS partition.
> > But I cannot seem to get TUX2 on kernel 2.4.19, which I would like to
> > run my reiserfs partition on.
>
> We cannot tell you anything about Tux2 because we do not know anything
> about it ;)

I think Darren should try 2.4.20aa1, Andrea Arcangeli's (SuSE) -AA VM kernel.
It has TUX (the web server; TUX2 is a new file system with phase tree under 
construction) on board.

cat /usr/src/linux/net/tux/Config.in
tristate '  Threaded linUX application protocol accelerator layer (TUX)' 
CONFIG_TUX
if [ "$CONFIG_TUX" = "y" -o "$CONFIG_TUX" = "m" ]; then
  bool     '    External CGI module' CONFIG_TUX_EXTCGI
  bool     '    extended TUX logging format' CONFIG_TUX_EXTENDED_LOG
  bool     '    debug TUX' CONFIG_TUX_DEBUG
fi

Regards,
	Dieter
