From: Oleg Drokin <green@namesys.com>
Subject: Re: Data corrupted after crash
Date: Fri, 26 Jul 2002 13:19:43 +0400
Message-ID: <20020726131943.A18706@namesys.com>
References: <m34renr8vj.fsf@toyland.sauerland.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11080-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <m34renr8vj.fsf@toyland.sauerland.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Kaps <seb-reiserfs.0462a0@toyland.sauerland.de>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Jul 25, 2002 at 07:54:24PM +0200, Sebastian Kaps wrote:

> I had gnus, opera and some other apps running before the crash and now
> my opera bookmarks file "~/.opera/opera6.adr" looks like a mixture of
> ~/.newsrc.eld (used by gnus), the original bookmarks file and some other
> stuff what seems to be Opera's history data.
> Isn't journalling supposed to prevent such things?

No. Reiserfs provides only metadata journaling. So the data itself still may
be damaged (data still may be damaged even in case of full data journaling
just because there is no API for applications to control transactions
currently)

Bye,
    Oleg
