From: Sebastian Kaps <seb-reiserfs.0462a0@toyland.sauerland.de>
Subject: Re: Data corrupted after crash
Date: Fri, 26 Jul 2002 11:34:13 +0200
Message-ID: <m37kji4yui.fsf@toyland.sauerland.de>
References: <m34renr8vj.fsf@toyland.sauerland.de>
	<20020726131943.A18706@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11082-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020726131943.A18706@namesys.com> (Oleg Drokin's message of
 "Fri, 26 Jul 2002 13:19:43 +0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi Oleg!

Am Fri, 26 Jul 2002 13:19:43 +0400 schriebst Du:

> No. Reiserfs provides only metadata journaling. So the data itself still may
> be damaged (data still may be damaged even in case of full data journaling
> just because there is no API for applications to control transactions
> currently)

Okay, thanks to you and Kuba for pointing this out.

-- 
Ciao, Sebastian

* HP:    http://www.sauerland.de/~toyland/          PGP-Key available
