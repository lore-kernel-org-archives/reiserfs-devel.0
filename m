From: Oliver Neukum <oliver@neukum.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 2 Sep 2004 13:13:11 +0200
Message-ID: <200409021313.11063.oliver@neukum.org>
References: <Pine.LNX.4.44.0408261011410.27909-100000@chimarrao.boston.redhat.com> <20040901202641.GJ4455@legion.cup.hp.com> <1094118524.4842.27.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21273-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1094118524.4842.27.camel@localhost.localdomain>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Jeremy Allison <jra@samba.org>, Jamie Lokier <jamie@shareable.org>, Trond Myklebust <trond.myklebust@fys.uio.no>, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Rik van Riel <riel@redhat.com>, Christer Weinigel <christer@weinigel.se>, Spam <spam@tnonline.net>, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, Linus Torvalds <torvalds@osdl.org>, reiser@namesys.com, hch@lst.de, Linux Filesystem Development <linux-fsdevel@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com

Am Donnerstag, 2. September 2004 11:48 schrieb Alan Cox:
> What I don't understand is the tie between Linux having such streams and
> Windows doing it for Samba to work. Netatalk has always handle this for
> Macintosh and portably. Presumably any Samba support would need to
> handle OS's without wacky files for portability too ?

Can you do an atomic rename of all streams without kernel support?

	Regards
		Oliver
