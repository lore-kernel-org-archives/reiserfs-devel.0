From: Jeremy Allison <jra@samba.org>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 25 Aug 2004 16:37:39 -0700
Message-ID: <20040825233739.GP10907@legion.cup.hp.com>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825152805.45a1ce64.akpm@osdl.org> <112698263.20040826005146@tnonline.net> <Pine.LNX.4.58.0408251555070.17766@ppc970.osdl.org> <1453698131.20040826011935@tnonline.net> <20040825163225.4441cfdd.akpm@osdl.org>
Reply-To: Jeremy Allison <jra@samba.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20541-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040825163225.4441cfdd.akpm@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>
Cc: Spam <spam@tnonline.net>, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Wed, Aug 25, 2004 at 04:32:25PM -0700, Andrew Morton wrote:
> 
> We can add these new features tomorrow, as reiser4-only features, with a
> plan in hand to generalise them later.
> 
> -->>__if__<<-- we think these are features which Linux should offer.

Multiple-data-stream files are something we should offer, definately (IMHO).
I don't care how we do it, but I know it's something we need as application
developers.

Jeremy.
