From: "Sarath Menon" <sarathmenon@gmail.com>
Subject: Re: Ebuild/rpm/deb repo's (was Re: reiser4 can now bear with filled fs, looks stable to me...)
Date: Tue, 8 Aug 2006 15:56:04 +0530
Message-ID: <932539950608080326w6ff472ebkc32437e4da455f68@mail.gmail.com>
References: <20060730223755.GA14386@hermes.uziel.local>
	 <11910177823.20060731232849@wp.pl> <44CE7A3A.2010503@slaphack.com>
	 <1256888283.20060801132818@wp.pl>
	 <1154455834.10745.21.camel@localhost>
	 <1692247736.20060801231255@wp.pl> <916440956.20060806162316@wp.pl>
	 <20060807092435.GA11596@zeus.uziel.local>
	 <44D773D6.4020504@slaphack.com>
	 <20060808095658.GA6834@hermes.uziel.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29542-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060808095658.GA6834@hermes.uziel.local>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christian Trefzer <ctrefzer@gmx.de>
Cc: David Masover <ninja@slaphack.com>, =?ISO-8859-2?Q?Maciej_So=B3tysiak?= <pysiak.satriani@wp.pl>, reiserfs-list@namesys.com

On 8/8/06, Christian Trefzer <ctrefzer@gmx.de> wrote:
> Grub is a bootloader and as such should (as an optimum) be able to grab
> kernels off of any fs. I guess patches are accepted by upstream
> developers?

Grub v1 (The one we all know) is alpha status according to their devs.
Its no longer under active development - in favour of v2. AFAIK, they
have stopped accepting patches for it, and they have no plans to
release v2 in the near future. and I don't think it is even compilable
That doesn't stop mainline distros to accept namesys' patch anyway.

Sarath
