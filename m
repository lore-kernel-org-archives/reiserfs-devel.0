From: Wichert Akkerman <wichert@wiggy.net>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 14:25:49 +0200
Sender: Wichert Akkerman <wichert@levante.wiggy.net>
Message-ID: <20040826122549.GM2612@wiggy.net>
References: <200408261034.38509.vda@port.imtp.ilyichevsk.odessa.ua> <Pine.LNX.4.44.0408260736080.23532-100000@chimarrao.boston.redhat.com> <20040826121223.GG30449@mail.shareable.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20651-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040826121223.GG30449@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: Rik van Riel <riel@redhat.com>, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Matt Mackall <mpm@selenic.com>, Nicholas Miell <nmiell@gmail.com>, Jeremy Allison <jra@samba.org>, Andrew Morton <akpm@osdl.org>, Spam <spam@tnonline.net>, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Previously Jamie Lokier wrote:
> I find losing mtime annoying.  That's why I don't use Mozilla's
> download manager (and Navigator's before it) because they presumed
> that mtime isn't worth copying.

It's free software, you could fix that :)

> Is it a problem to decree that "file data MUST NOT be stored in a
> metadata directory; only non-essential metadata and data computed from
> the file data may be stored"?

That would put us right back at the samba-and-other-apps-want-streams
point in the discussion, but it certainly would not be a bad starting
point. From there we could always add streams later on if the API is
right.

Wichert.

-- 
Wichert Akkerman <wichert@wiggy.net>    It is simple to make things.
http://www.wiggy.net/                   It is hard to make things simple.
