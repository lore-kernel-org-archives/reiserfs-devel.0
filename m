From: Douglas McNaught <doug@mcnaught.org>
Subject: Re: reiser4 plugins
Date: Wed, 29 Jun 2005 09:50:27 -0400
Message-ID: <m2k6kd2rx8.fsf@Douglas-McNaughts-Powerbook.local>
References: <200506290509.j5T595I6010576@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24796-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506290509.j5T595I6010576@laptop11.inf.utfsm.cl> (Horst von Brand's message of "Wed, 29 Jun 2005 01:09:05 -0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Hubert Chan <hubert@uhoreg.ca>, Kyle Moffett <mrmacman_g4@mac.com>, David Masover <ninja@slaphack.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Hans Reiser <reiser@namesys.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

Horst von Brand <vonbrand@inf.utfsm.cl> writes:

> Hubert Chan <hubert@uhoreg.ca> wrote:
>
>>                                                        Of course, this
>> change does require file managers to understand default actions when
>> it's ambiguous what to do on a double-click -- but MacOS X has that too,
>> in the form of the "Open as Folder" option (or whatever it's called).
>
> Right. For the sake of a filesystem among many on a minority operating
> system /all/ GUI programs have to be rewritten. And all command-line
> stuff. Just because.

I'll just note that the "applications bundled as directories" stuff on
MacOS/NextStep is done completely in userspace--as far as the kernel
is concerned, "Mail.app" is a regular directory.  The file manager
handles recognition and invocation of application bundles (and there
is an 'open' shell command that does the same thing).

-Doug
