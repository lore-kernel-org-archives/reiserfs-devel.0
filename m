From: Oleg Drokin <green@namesys.com>
Subject: Re: how screwed am I ? - lost 79160kB off of a May 2001 reiserfs partition to a swap :-(
Date: Mon, 18 Aug 2003 10:24:18 +0400
Message-ID: <20030818062418.GD16183@namesys.com>
References: <no.Yo.N.nN.0308171326020.2986-100000@business.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15356-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <no.Yo.N.nN.0308171326020.2986-100000@business.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs@ied.com
Cc: reiserfs-list@namesys.com

Hello!

On Sun, Aug 17, 2003 at 01:44:16PM -0400, reiserfs@ied.com wrote:

>    I screwed myself - I've overwritten the first 79160kB of 
> a 38GB partition (fdisk says 38796975 blocks) with swap :-(

So you overwrote 32M of journal and ~50M of metadata, some of the metadata should
still be there, though.
Since this is user error, we can only help you based on http://namesys.com/support.html terms.
Or you can find the solution yourself. (I think several similar cases were described in
this list some time ago).

Bye,
    Oleg
