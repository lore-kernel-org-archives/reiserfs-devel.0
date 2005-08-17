From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Re: KDE integration with ReiserFS 4
Date: Tue, 16 Aug 2005 20:03:19 -0400
Message-ID: <e692861c05081617037a65b01@mail.gmail.com>
References: <20050815174616.57110.qmail@web54401.mail.yahoo.com>
	 <1j6pufsznvl41$.dlg@jwmittag.my-fqdn.de>
	 <200508170051.16167.chrivers@iversen-net.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25532-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200508170051.16167.chrivers@iversen-net.dk>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Iversen <chrivers@iversen-net.dk>
Cc: reiserfs-list@namesys.com

On 8/16/05, Christian Iversen <chrivers@iversen-net.dk> wrote:
> Are there independent implementations of QT?

Well... Google "harmony project" "qt".=20

:)

I think in reality it would be reasonable to handle this like the
Beagle search engine handles it's metadata.. Either you enable
extended attrs in your file system, or it uses a sqllite database.=20
The performance with the sqllite database stinks, but it's there for
those that can't turn on extended attrs on their filesystem.
