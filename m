From: Sam Vilain <sam@vilain.net>
Subject: Re: Data corrupted after crash
Date: Fri, 26 Jul 2002 14:44:05 +0100
Message-ID: <20020726134405.D4DB145B@hofmann>
References: <m34renr8vj.fsf@toyland.sauerland.de>
	<20020726131943.A18706@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11083-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020726131943.A18706@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

Oleg Drokin <green@namesys.com> wrote:

> No. Reiserfs provides only metadata journaling. So the data itself still
> may be damaged (data still may be damaged even in case of full data
> journaling just because there is no API for applications to control
> transactions currently)

Still, data journalling would be nice.  I must say that when reiserfs gets
the power taken out from under it, you don't half end up with your
recently worked on files containing pieces of each other.

With data journalling, this would not be a problem; although of course
files could end up in a half-updated state, which to a given application
may as well be corrupted.  It would be a bit slower, unless your journal is on a seperate device, but that can't be helped.
--
   Sam Vilain, sam@vilain.net     WWW:
http://sam.vilain.net/    7D74 2A09 B2D3 C30F F78E      GPG:
http://sam.vilain.net/sam.asc    278A A425 30A9 05B5 2F13

You've one mouth and two ears...use them in that proportion.
 - anon.
