From: Oleg Drokin <green@namesys.com>
Subject: Re: 2.4.19-pending is pending
Date: Tue, 6 Aug 2002 09:13:54 +0400
Message-ID: <20020806091354.B18078@namesys.com>
References: <3D4F0A0A.4050603@mb.tu-ilmenau.de> <1028592182.1759.300.camel@tiny> <3D4F16F4.9060802@mb.tu-ilmenau.de> <1028594433.2121.341.camel@tiny>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11131-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1028594433.2121.341.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>, reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Mon, Aug 05, 2002 at 08:40:33PM -0400, Chris Mason wrote:

> > Olegs messages made me think of hundreds kB of namesys patches to come 
> > additionally to yours and the old ones...
> Well, the namesys guys don't sit around playing cards all day ;-)  Most
> of their big patches are features (blocksize < 4k) or performance
> improvements.

Actually blocksizes != 4k, you know there are Alpha and ia64 guys out there,
and some of them are probably using reiserfs (at least they might ;) ).
Also with recent trend to increase PAGE_CACHE_SIZE, bigger blocksizes should
become available to x86 users too.

Bye,
    Oleg
