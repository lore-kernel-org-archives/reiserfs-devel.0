From: Rik van Riel <riel@redhat.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 14:17:04 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0408261416360.27909-100000@chimarrao.boston.redhat.com>
References: <20040826173227.GB1570@legion.cup.hp.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20749-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040826173227.GB1570@legion.cup.hp.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Allison <jra@samba.org>
Cc: Andrew Morton <akpm@osdl.org>, Spam <spam@tnonline.net>, wichert@wiggy.net, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Thu, 26 Aug 2004, Jeremy Allison wrote:

> Because without kernel support there is no way someone can
> publish a new metadata type and have it automatically supported
> by all application data files (ie. most apps ignore it, and only
> apps that are aware of it can see it).

So your backup software ignores it, and after a restore you've
lost your new metadata ?

-- 
"Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it." - Brian W. Kernighan

