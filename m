From: "Bostjan Skufca @ domenca.com" <bostjan.skufca@domenca.com>
Subject: Re: ReiserFS 2.4 patches need few fixes
Date: Mon, 24 Jan 2005 14:49:29 +0100
Message-ID: <200501241449.29354.bostjan.skufca@domenca.com>
References: <200501241246.36757.bostjan.skufca@domenca.com> <20050124132028.6CCF13F01F@philou.gramoulle.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-23203-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050124132028.6CCF13F01F@philou.gramoulle.local>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hm, these seem to work but they still have EXPORT_SYMTAB issue when buildin=
g=20
kernel without module support enabled.=20

I used patches you mentioned before - but switched over as patches on Names=
ys'=20
=46TP are recommended by their FAQ on website and are somewhat "younger" th=
an=20
those on Suse's FTP server.


Regards,
Bostjan




On Monday 24 January 2005 14:20, Philippe Gramoull=E9 wrote:
> Hello,
>
> Could you try these patches instead ( don't know if 2.4.25 data-logging
> patches apply cleanly to 2.4.29 though) ?
>
> ftp://ftp.suse.com:/pub/people/mason/patches/data-logging/2.4.25
>
> Thanks,
>
> Philippe
>
> On Mon, 24 Jan 2005 12:46:36 +0100
>
> "Bostjan Skufca @ domenca.com" <bostjan.skufca@domenca.com> wrote:
>   | there are 3 fuzz warnings and one reject when applying patches from
>   | ftp://ftp.namesys.com/pub/reiserfs-for-2.4/data-logging-2.4.24
>   | to vanilla 2.4.29 kernel.
>   |
>   |
>   | Here is the patch output (irelevant output is omitted):
>   | ...

