From: carlos@fisica.ufpr.br (Carlos Carvalho)
Subject: Re: [PATCH] reiserfs: fix handling of device names with /'s in them
Date: Mon, 17 Jul 2006 12:39:37 -0300
Message-ID: <17595.44857.845209.442959@fisica.ufpr.br>
References: <6xQ4C-6NB-43@gated-at.bofh.it>
	<6xQea-6ZX-13@gated-at.bofh.it>
	<E1G1QFx-0001IO-K6@be1.lrz>
	<44B7D97B.20708@suse.com>
	<44B9E6D5.2040704@namesys.com>
	<44BA61A2.5090404@suse.com>
	<44BA8214.7040005@namesys.com>
	<44BABB14.6070906@suse.com>
	<44BAE619.9010307@namesys.com>
	<44BAECE2.8070301@suse.com>
	<44BAFDC3.7020301@namesys.com>
	<44BB0146.7080702@suse.com>
	<44BB3C42.1060309@namesys.com>
	<44BBA4CF.8020901@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29032-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44BBA4CF.8020901@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>, Andrew Morton <akpm@osdl.org>

Shouldn't the replacement of / by some other character be done for all
filesystems? If so shouldn't it be done in a single point for all of
them? Isn't this the purpose of VFS?
