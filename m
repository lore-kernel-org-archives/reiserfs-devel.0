From: Oleg Drokin <green@namesys.com>
Subject: Re: Data corrupted after crash
Date: Fri, 26 Jul 2002 17:53:28 +0400
Message-ID: <20020726175328.A3718@namesys.com>
References: <m34renr8vj.fsf@toyland.sauerland.de> <20020726131943.A18706@namesys.com> <20020726134405.D4DB145B@hofmann>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11084-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020726134405.D4DB145B@hofmann>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sam Vilain <sam@vilain.net>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, Jul 26, 2002 at 02:44:05PM +0100, Sam Vilain wrote:

> > No. Reiserfs provides only metadata journaling. So the data itself still
> > may be damaged (data still may be damaged even in case of full data
> > journaling just because there is no API for applications to control
> > transactions currently)
> Still, data journalling would be nice.  I must say that when reiserfs gets

We hope to get it in 2.4.20, thanks to great work by Chris.

Bye,
    Oleg
