From: "Sean" <seanlkml@sympatico.ca>
Subject: Re: reiser4 plugins
Date: Tue, 28 Jun 2005 14:52:12 -0400 (EDT)
Message-ID: <4783.10.10.10.24.1119984732.squirrel@linux1>
References: Message from Alexander Zarochentsev <zam@namesys.com>    of "Mon,
    27 Jun 2005 13:30:06 +0400." <200506271330.07451.zam@namesys.com>
    <200506281401.j5SE1ORW003589@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-24768-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506281401.j5SE1ORW003589@laptop11.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Alexander Zarochentsev <zam@namesys.com>, Christoph Hellwig <hch@infradead.org>, David Masover <ninja@slaphack.com>, Jeff Garzik <jgarzik@pobox.com>, Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

On Tue, June 28, 2005 10:01 am, Horst von Brand said:
>> I don't belive that you want to see all reiser4-specific things as item
>> plugins, disk format plugins in the VFS.
>
> Only what makes sense. Plus many of those will probably have to go. Decide
> on /one/ way of doing things, even if not perfect for all uses. Everything
> else is useless bloat.

It doesn't seem to be a problem as long as loadable plugins are GPL.  How
is it useless bloat?  It doesn't seem much different from having loadable
modules in the security system.  Just don't enable Reiser4 in your kernel
if you don't want to use it.

Sean


