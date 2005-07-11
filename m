From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 plugins
Date: Mon, 11 Jul 2005 15:58:11 -0700
Message-ID: <42D2F983.1060105@namesys.com>
References: <hubert@uhoreg.ca>	<200506290509.j5T595I6010576@laptop11.inf.utfsm.cl>	<87hdfgvqvl.fsf@evinrude.uhoreg.ca>	<8783be6605062914341bcff7cb@mail.gmail.com>	<878y0svj1h.fsf@evinrude.uhoreg.ca> <42C4F97B.1080803@slaphack.com> <87ll4lynky.fsf@evinrude.uhoreg.ca> <42CB0328.3070706@namesys.com> <42CB07EB.4000605@slaphack.com> <42CB0ED7.8070501@namesys.com> <42CB1128.6000000@slaphack.com> <42CB1C20.3030204@namesys.com> <42CB22A6.40306@namesys.com> <42CBE426.9080106@slaphack.com> <42D1F06C.9010905@stesmi.com> <42D2DB99.9050307@slaphack.com> <42D2DCA0.1040106@stesmi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25093-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42D2DCA0.1040106@stesmi.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stefan Smietanowski <stesmi@stesmi.com>
Cc: David Masover <ninja@slaphack.com>, Hubert Chan <hubert@uhoreg.ca>, Ross Biro <ross.biro@gmail.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Kyle Moffett <mrmacman_g4@mac.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>, Nate Diller <ndiller@namesys.com>

Stefan Smietanowski wrote:

>
> I think "..." and ".meta" both serve as a logical delimiter. However
> some programs implement their own "..." which would make it clash with
> them. Naturally if some program created a directory called .meta we're
> equally screwed.

I chose '....' (four dots) because it clashes with less, not three dots.
