From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: silent semantic changes with reiser4
Date: Sun, 29 Aug 2004 15:30:03 +0100
Message-ID: <1093789802.27932.41.camel@localhost.localdomain>
References: <Pine.LNX.4.44.0408261011410.27909-100000@chimarrao.boston.redhat.com>
	 <200408261819.59328.vda@port.imtp.ilyichevsk.odessa.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21064-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408261819.59328.vda@port.imtp.ilyichevsk.odessa.ua>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>
Cc: Rik van Riel <riel@redhat.com>, Christer Weinigel <christer@weinigel.se>, Spam <spam@tnonline.net>, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com

On Iau, 2004-08-26 at 16:19, Denis Vlasenko wrote:
> > Office suites can store a document with embedded images
> > and spread sheets "easily" by putting the text, the
> > images and spread sheets all in different file streams.
> 
> Kinda far reaching. It's hard to assess whether that is good or bad idea.
> Can we start small, like putting metadata (e.g. ACLs) into these streams?

Openoffice does this in user space and the user space vfs code desktops
use can handle zips so this "just works" already including over NFS,
unlike a kernel proposed method.

