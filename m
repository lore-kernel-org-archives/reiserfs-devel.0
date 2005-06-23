From: Pekka Enberg <penberg@gmail.com>
Subject: Re: reiser4 plugins
Date: Thu, 23 Jun 2005 09:26:37 +0300
Message-ID: <84144f0205062223266ab40243@mail.gmail.com>
References: <20050620235458.5b437274.akpm@osdl.org>
	 <42B831B4.9020603@pobox.com> <42B87318.80607@namesys.com>
	 <20050621202448.GB30182@infradead.org> <42B8B9EE.7020002@namesys.com>
	 <42B8BB5E.8090008@pobox.com> <42B8E834.5030809@slaphack.com>
	 <42B8F4BC.5060100@pobox.com> <42BA4F7E.6000402@namesys.com>
Reply-To: Pekka Enberg <penberg@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24485-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42BA4F7E.6000402@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Jeff Garzik <jgarzik@pobox.com>, David Masover <ninja@slaphack.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>, Pekka Enberg <penberg@cs.helsinki.fi>

Hi Hans,

Jeff Garzik wrote:
> > We have to maintain said ugly code for decades.

On 6/23/05, Hans Reiser <reiser@namesys.com> wrote:
> No you don't, I do.

Lots of people work on the kernel. If you wish to keep reiser4
maintenance to yourself, you probably need to keep it as a separate
patch. Please consider submitting the non-controversial bits for
merging first and then continue with the rest. It does not make a lot
of sense reviewing the current patchkit as many parts of it won't be
merged as is (e.g. the plugin stuff).

                          Pekka
