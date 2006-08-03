From: "Gregory Maxwell" <gmaxwell@gmail.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion
Date: Thu, 3 Aug 2006 14:48:35 -0400
Message-ID: <e692861c0608031148j5d4a5d87vec005cb6b58055cc@mail.gmail.com>
References: <200607312314.37863.bernd-schubert@gmx.de>
	 <200608011428.k71ESIuv007094@laptop13.inf.utfsm.cl>
	 <20060801165234.9448cb6f.reiser4@blinkenlights.ch>
	 <1154446189.15540.43.camel@localhost.localdomain>
	 <44CF84F0.8080303@slaphack.com>
	 <1154452770.15540.65.camel@localhost.localdomain>
	 <44CF9217.6040609@slaphack.com>
	 <20060803135811.GA7431@merlin.emma.line.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29464-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060803135811.GA7431@merlin.emma.line.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Adrian Ulrich <reiser4@blinkenlights.ch>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, bernd-schubert@gmx.de, reiserfs-list@namesys.com, jbglaw@lug-owl.de, clay.barnes@gmail.com, rudy@edsons.demon.nl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu

On 8/3/06, Matthias Andree <matthias.andree@gmx.de> wrote:
> Berkeley DB can, since version 4.1 (IIRC), write checksums (newer
> versions document this as SHA1) on its database pages, to detect
> corruptions and writes that were supposed to be atomic but failed
> (because you cannot write 4K or 16K atomically on a disk drive).

The drive doesn't provide atomic writes for > 1sector (and I'd hardly
call trashing a sector during a failed write atomic for even one)...
but a FS can provide such semantics.
