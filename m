From: Oleg Drokin <green@namesys.com>
Subject: Re: Corruption: --fix-fixable results in all nlink values = 0
Date: Thu, 22 Aug 2002 17:00:58 +0400
Message-ID: <20020822170058.A6550@namesys.com>
References: <m3k7mpreij.fsf@merlin.emma.line.org> <3D63BD2D.1070602@web.de> <3D63CA89.3050002@namesys.com> <200208221500.24544.vitaly@namesys.com> <1030020938.7820.4.camel@tiny>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11292-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1030020938.7820.4.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: Vitaly Fertman <vitaly@namesys.com>, Hans Reiser <reiser@namesys.com>, degerrit@web.de, reiserfs-list@namesys.com

Hello!

On Thu, Aug 22, 2002 at 08:55:38AM -0400, Chris Mason wrote:
> > bad blocks are kept in the object [-1 -1] as unformatted pointers of 
> > indirect items. 
> And this does not intefere with the savelink code on older kernels?

It does, as I explained, this is disabled because it clases with savelinks.

Bye,
    Oleg
