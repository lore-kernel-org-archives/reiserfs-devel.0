From: Edward Shushkin <edward@namesys.com>
Subject: Re: Performance figures with and without relocated journal
Date: Wed, 21 May 2003 12:59:37 +0400
Sender: edward
Message-ID: <3ECB3FF9.FB91B6E4@namesys.com>
References: <20030520213130.40f9f249.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14186-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Philippe =?iso-8859-1?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: reiserfs <reiserfs-list@namesys.com>

Philippe Gramoull=E9 wrote:
> =

>  Hi,
> =

>  I would like to know if there are some figures available for filesyste=
m benchmarks
> some done without a relocated journal and some done with a relocated on=
e
> ( even better if tests with NFS are available )
> =

>  What order of performance improvement can i hope to get with a relocat=
ed journal ?

We still don't have comprehensive results in this area,
but I should note there is some improvement for data logging journal mode=
:
http://namesys.com/benchmarks/journal_relocation_to_NVRAM.html

Edward.


> =

>  Thanks,
> =

> Philippe
