From: Rik van Riel <riel@redhat.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 13:59:29 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0408261358370.27909-100000@chimarrao.boston.redhat.com>
References: <20040826194010.548e4a4c.diegocg@teleline.es>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20744-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040826194010.548e4a4c.diegocg@teleline.es>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Diego Calleja <diegocg@teleline.es>
Cc: jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Thu, 26 Aug 2004, Diego Calleja wrote:
> El Thu, 26 Aug 2004 13:16:22 -0400 (EDT) Rik van Riel <riel@redhat.com> e=
scribi=F3:
>=20
> > So all I need to do is "cat /bin | gzip -9 > /path/to/backup.tar.gz" ?
>=20
> /bin could be separated (like linus said) but cat /bin/.compound could
> do it. This is the /etc/passwd Hans' example, I think:

Arghhhh.  I wrote it down to ridicule the idea and now people
are taking it seriously ;(

It should be obvious enough that anything depending on the
kernel parsing file contents will lead to problems.

--=20
"Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it." - Brian W. Kernighan

