From: Claudio Martins <ctpm@rnl.ist.utl.pt>
Subject: Re: [PATH] "metas" in reiserfs v4 snapsot 2004.03.26
Date: Mon, 29 Mar 2004 15:24:15 +0100
Message-ID: <200403291524.15123.ctpm@rnl.ist.utl.pt>
References: <20040329133649.GQ5229@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17563-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040329133649.GQ5229@nysv.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com


On Monday 29 March 2004 14:36, Markus T=F6rnqvist wrote:
>
> My personal take on this still is that ..metas/ makes more sense,
> like the extra dot signifying "I am really hidden" ;)


  I also suggest "..meta" as best choice. This way one can avoid the (remot=
e=20
but possible) case of having an application who wants to create a ".meta"=20
configuration file/directory in your $HOME.

Claudio

