From: Jamie Lokier <jamie@shareable.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 18:08:22 +0100
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <20040826170822.GO5733@mail.shareable.org>
References: <412D9FE6.9050307@namesys.com> <20040826014542.4bfe7cc3.akpm@osdl.org> <1093522729.9004.40.camel@leto.cs.pocnet.net> <20040826124929.GA542@lst.de> <1093525234.9004.55.camel@leto.cs.pocnet.net> <20040826130718.GB820@lst.de> <20040826144422.GD5733@mail.shareable.org> <20040826160306.GA4326@lst.de> <20040826161911.GK5733@mail.shareable.org> <20040826162354.GA4891@lst.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel=40m.gmane.org-S269254AbUHZRUR@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040826162354.GA4891@lst.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>, Christophe Saout <christophe@saout.de>, Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

Christoph Hellwig wrote:
> If the smaller objects interact with normal files (link/rename,
> contained in normal directories), they will have to obey the same
> locking protocols.  If not a filesystem could experiment with it of
> course.

I think the smaller objects will consist of special files, which are
magic attributes like the ones you currently see in reiser4, and
ordinary files (which might themselves be containers).

Link/rename/locking etc. should work as usual on the ordinary smaller
files, but probably aren't allowed at all on the special attribute
files, except where there's an appropriate meaning.  (For example
locking certain attributes might have an appropriate meaning).

It would make sense for the special attributes file to not identify as
"regular files" (S_IFREG), but there aren't many mode bits to play
with.  They should also be harder to find than ordinary smaller files.

-- Jamie
