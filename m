From: Wichert Akkerman <wichert@wiggy.net>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 13:29:38 +0200
Sender: Wichert Akkerman <wichert@levante.wiggy.net>
Message-ID: <20040826112938.GK2612@wiggy.net>
References: <20040825233739.GP10907@legion.cup.hp.com> <20040825234629.GF2612@wiggy.net> <1939276887.20040826114028@tnonline.net> <20040826024956.08b66b46.akpm@osdl.org> <839984491.20040826122025@tnonline.net> <20040826032457.21377e94.akpm@osdl.org> <742303812.20040826125114@tnonline.net> <20040826035500.00b5df56.akpm@osdl.org> <1453776111.20040826131547@tnonline.net> <20040826042043.15978b0a.akpm@osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20638-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040826042043.15978b0a.akpm@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>
Cc: Spam <spam@tnonline.net>, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Previously Andrew Morton wrote:
> But I'll grant that one cannot go adding new metadata to, say, C files this
> way.  I don't know how useful such a thing is though.

That is actually one of the few places where a bit of metadata would be
very useful. Right now there is no way to indicate in what encoding a
source is written: ascii, utf-8, ucs16, etc. are all possible. But a
compiler or interpreter has no good way to figure that out.

Wichert.

-- 
Wichert Akkerman <wichert@wiggy.net>    It is simple to make things.
http://www.wiggy.net/                   It is hard to make things simple.
