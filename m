From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 02:03:36 +0400
Message-ID: <16686.24120.761440.969273@thebsh.namesys.com>
References: <20040824202521.GA26705@lst.de>
	<412CEE38.1080707@namesys.com>
	<20040825152805.45a1ce64.akpm@osdl.org>
	<412D9FE6.9050307@namesys.com>
	<20040826014542.4bfe7cc3.akpm@osdl.org>
	<412DAC59.4010508@namesys.com>
	<1093548414.5678.74.camel@krustophenia.net>
	<20040826203017.GA14361@school.ioffe.ru>
	<1093552692.13881.43.camel@leto.cs.pocnet.net>
	<16686.22336.829096.678178@thebsh.namesys.com>
	<1093556818.13881.75.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20821-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093556818.13881.75.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christophe Saout <christophe@saout.de>
Cc: Dmitry Baryshkov <mitya@school.ioffe.ru>, Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@osdl.org>, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

Christophe Saout writes:
 > Am Freitag, den 27.08.2004, 01:33 +0400 schrieb Nikita Danilov:
 > 
 > > Wrong, plugin is called just below entry point from the VFS to the
 > > file-system back-end. It can use reiser4 tree, or any storage layer it
 > > wants. Or none at all: think about pseudo-files like
 > > foo/metas/uid---they are also implemnted by plugins.
 > 
 > Yes. But which plugins are we talking about?
 > 
 > What about fs/reiser4/plugin/node/ and fs/reiser4/plugin/disk_format/?
 > 
 > Of course you can implement another filesystem inside the plugins but
 > they wouldn't use fs/reiser4/*.c, so this would be rather stupid. Right?
 > 

That was the message of my message.

Nikita.
