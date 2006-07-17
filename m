From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] reiserfs: fix handling of device names with /'s in them
Date: Mon, 17 Jul 2006 11:21:25 -0700
Message-ID: <44BBD525.5010907@namesys.com>
References: <6xQ4C-6NB-43@gated-at.bofh.it>	<6xQea-6ZX-13@gated-at.bofh.it>	<E1G1QFx-0001IO-K6@be1.lrz>	<44B7D97B.20708@suse.com>	<44B9E6D5.2040704@namesys.com>	<44BA61A2.5090404@suse.com>	<44BA8214.7040005@namesys.com>	<44BABB14.6070906@suse.com>	<44BAE619.9010307@namesys.com>	<44BAECE2.8070301@suse.com>	<44BAFDC3.7020301@namesys.com>	<44BB0146.7080702@suse.com>	<44BB3C42.1060309@namesys.com>	<44BBA4CF.8020901@suse.com> <17595.44857.845209.442959@fisica.ufpr.br> <44BBB54D.1000509@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29041-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44BBB54D.1000509@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Carlos Carvalho <carlos@fisica.ufpr.br>, ReiserFS List <reiserfs-list@namesys.com>, Andrew Morton <akpm@osdl.org>

Jeff Mahoney wrote:

>
>
> As stated before numerous times by both Andrew and myself, the correct
> solution is to eliminate / from block device names.

Why?  It is elegant to have those /'s....   Just create the directory,
how is that hard?

> This patch was a
> band-aid until that's done.
>
> -Jeff
>
> --
> Jeff Mahoney
> SUSE Labs

