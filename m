From: Oleg Drokin <green@namesys.com>
Subject: Re: vpf-10680 patch not in 2.5.74?
Date: Fri, 4 Jul 2003 09:27:02 +0400
Message-ID: <20030704052702.GA6309@namesys.com>
References: <3F0457B2.7010500@g-house.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14825-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F0457B2.7010500@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Kujau <evil@g-house.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Thu, Jul 03, 2003 at 06:20:02PM +0200, Christian Kujau wrote:

> the patch from Oleg that fixes this odd vpf-10680 issue on 64bit archs 
> is not in 2.5.74 it seems, at least there is no entry in the Changelog.
> will it get in in 2.5.75 probably?

Yes, we have not finished internal full testing yet (the one
that ensures that while 64 bit arches are fixed, 32bit arches are still fine).

Bye,
    Oleg 
