From: michael chang <thenewme91@gmail.com>
Subject: Re: [PATCH] fix problems related to journaling in Reiserfs
Date: Wed, 31 Aug 2005 20:37:15 -0400
Message-ID: <b14e81f005083117377ee7556a@mail.gmail.com>
References: <6.0.0.20.2.20050831191551.03fdbac0@129.60.53.12>
	 <b14e81f005083106423c6adc4@mail.gmail.com>
	 <43164523.7030301@lab.ntt.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25768-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43164523.7030301@lab.ntt.co.jp>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hifumi Hisashi <hifumi.hisashi@lab.ntt.co.jp>
Cc: reiser@namesys.com, reiserfs-dev@namesys.com, reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org

On 8/31/05, Hifumi Hisashi <hifumi.hisashi@lab.ntt.co.jp> wrote:
> michael chang wrote:
>=20
> >Surely we don't want this.  Look at the papers on Namesys's websites,
> >about the atomicaty and the banking example.  But that's just my
> >personal opinion.  Besides, I believe it's more likely that usually
> >the power gets lost than the SCSI or IDE cable gets disconnected,
> >AFAIK...
> >
> >
>     A write()  syscall with the O_SYNC flag must ensure that not only
> file data block
> but also journal (meta-data update) are written to a disk when this
> syscall end.
>    But, current implementation of Reiserfs does not do that. If a system
> crashes,
> a filesystem recovers from the journal transaction log. But, Reiserfs
> may not
> recover in some cases.
>    I checked other filesystems like ext3, jfs, xfs. Those filesystem
> write transactions
> to a disk everytime  write()  with the O_SYNC is performed. In those
> filesystem,
> I have no trouble mentioned above.
>=20
>   I should say, the Reiserfs would be "un"reliable filesystem..........

That said, AFAIK, Reiser(fs) 3.6 patches are somewhat redundant
(although if they solve a "problem", sure, go ahead) since this
funcationality should be present in Reiser4 in one form or another --
I don't know if Reiser3.6 is still "supported" per se, anyways.  But
don't bash on me -- I'm not subscribed to the reiserfs-dev nor
linux-fsdevel lists, so don't bash me for saying something I shouldn't
say otherwise (I don't see how removing these lists from the replies
would help, but if that is requested, let me know).

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
