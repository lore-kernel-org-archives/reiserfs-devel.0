From: Chris Mason <mason@suse.com>
Subject: Re: Corruption: --fix-fixable results in all nlink
	values = 0
Date: 22 Aug 2002 08:55:38 -0400
Message-ID: <1030020938.7820.4.camel@tiny>
References: <m3k7mpreij.fsf@merlin.emma.line.org> <3D63BD2D.1070602@web.de>
	<3D63CA89.3050002@namesys.com>  <200208221500.24544.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11291-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200208221500.24544.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Hans Reiser <reiser@namesys.com>, degerrit@web.de, reiserfs-list@namesys.com

On Thu, 2002-08-22 at 07:00, Vitaly Fertman wrote:

> bad blocks are kept in the object [-1 -1] as unformatted pointers of 
> indirect items. 

And this does not intefere with the savelink code on older kernels?

-chris


