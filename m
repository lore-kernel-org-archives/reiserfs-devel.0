From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 02 Sep 2004 12:01:54 +0100
Message-ID: <1094122912.4970.7.camel@localhost.localdomain>
References: <Pine.LNX.4.44.0408261011410.27909-100000@chimarrao.boston.redhat.com>
	 <20040901202641.GJ4455@legion.cup.hp.com>
	 <1094118524.4842.27.camel@localhost.localdomain>
	 <200409021313.11063.oliver@neukum.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21276-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200409021313.11063.oliver@neukum.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oliver Neukum <oliver@neukum.org>
Cc: Jeremy Allison <jra@samba.org>, Jamie Lokier <jamie@shareable.org>, Trond Myklebust <trond.myklebust@fys.uio.no>, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Rik van Riel <riel@redhat.com>, Christer Weinigel <christer@weinigel.se>, Spam <spam@tnonline.net>, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, Linus Torvalds <torvalds@osdl.org>, reiser@namesys.com, hch@lst.de, Linux Filesystem Development <linux-fsdevel@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com

On Iau, 2004-09-02 at 12:13, Oliver Neukum wrote:
> Am Donnerstag, 2. September 2004 11:48 schrieb Alan Cox:
> > What I don't understand is the tie between Linux having such streams and
> > Windows doing it for Samba to work. Netatalk has always handle this for
> > Macintosh and portably. Presumably any Samba support would need to
> > handle OS's without wacky files for portability too ?
> 
> Can you do an atomic rename of all streams without kernel support?

That depends how SAMBA chooses to handle the problem internally and how
it chooses to store the data. The netatalk people have atomicity from
the view of clients but not from the unix fs internal view.

Alan

