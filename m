From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 01:33:52 +0400
Message-ID: <16686.22336.829096.678178@thebsh.namesys.com>
References: <20040824202521.GA26705@lst.de>
	<412CEE38.1080707@namesys.com>
	<20040825152805.45a1ce64.akpm@osdl.org>
	<412D9FE6.9050307@namesys.com>
	<20040826014542.4bfe7cc3.akpm@osdl.org>
	<412DAC59.4010508@namesys.com>
	<1093548414.5678.74.camel@krustophenia.net>
	<20040826203017.GA14361@school.ioffe.ru>
	<1093552692.13881.43.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20815-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093552692.13881.43.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christophe Saout <christophe@saout.de>
Cc: Dmitry Baryshkov <mitya@school.ioffe.ru>, Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@osdl.org>, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

Christophe Saout writes:
 > Am Freitag, den 27.08.2004, 00:30 +0400 schrieb Dmitry Baryshkov:
 > 
 > > Another example: Can ext2/etx3/reiserfsv3/xfs be implemented as reiser4
 > > plugins? From Hans' words it seems so. If this is correct, then maybe
 > > reiser4 core should be updated to completely replace current VFS layer?
 > > Then it's a good point to create a branch (in old development model it
 > > would be 2.7, dunno for new :), replace VFS layer with reiser4 core, and
 > > rewrite all (or at least most used) FS as reiser4 plugins. Then
 > > everybody will be happy.
 > > 
 > > But this looks too good to be true. Perhaps I misunderstood Hans' words
 > > aboud 'new disk format', did I?
 > 
 > No. You can change the format the reiser4 storage tree is stored in. As
 > long as other filesystems don't use the same underlying storage tree
 > this is not possible.

Wrong, plugin is called just below entry point from the VFS to the
file-system back-end. It can use reiser4 tree, or any storage layer it
wants. Or none at all: think about pseudo-files like
foo/metas/uid---they are also implemnted by plugins.

Programmer dedicated enough can (besides programming Fortran in any
language), write reiser4 plugin for any file-system. I will leave
description of this activity to people with better command over English
language.

Nikita.

 > 
