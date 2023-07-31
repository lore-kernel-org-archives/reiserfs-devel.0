From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] MAINTAINERS: change reiserfs status to obsolete
Date: Mon, 31 Jul 2023 19:11:31 +0200
Message-ID: <20230731171131.qpaoz7i3cto5wxyv@quack3>
References: <20230720115445.15583-1-piotr.siminski@globallogic.com>
 <CAKXUXMzL4i0jT0xPFsV4ZG6L82yDCYLtKoUL7t=21ZDZ4OMY7w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1690823492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kp+ckBJwyAyY4Fsa3aNTz7y5pST0vHXGNpS2gQCzvK0=;
        b=TBH8FHQ9+cQhCaTybTDlxJ0wL8GYcJD4e1npIBuajVrwoDgmcMrdNfTc7solttzgrt+Q44
        VEYeJnqZkQg2n8iul6L9e0Q5fJnhd7szaASqWhkqNQYEBaKt+qIR5cL3wAa5RzjChfXCW8
        FlyudrvM+7RUZa6WTY996MavRdYlDBg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1690823492;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kp+ckBJwyAyY4Fsa3aNTz7y5pST0vHXGNpS2gQCzvK0=;
        b=5wTDfvHo3p1nob4EnKoRn4bnZwvAKMwR7OqRDGtsgc5k2XFTD2CxgUFClRiAfVfoNXlrON
        wNlYUWhB78D50ICw==
Content-Disposition: inline
In-Reply-To: <CAKXUXMzL4i0jT0xPFsV4ZG6L82yDCYLtKoUL7t=21ZDZ4OMY7w@mail.gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Piotr Siminski <piotr.siminski@globallogic.com>, Jan Kara <jack@suse.cz>, reiserfs-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu 20-07-23 13:57:18, Lukas Bulwahn wrote:
> Piotr, thanks for the clean up in the MAINTAINERS file.
>=20
> Reviewed-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>=20
> Jan, could you pick this patch?

Yes, picked up now. Thanks!

								Honza

>=20
> Lukas
>=20
>=20
> On Thu, Jul 20, 2023 at 1:54=E2=80=AFPM Piotr Siminski
> <piotr.siminski@globallogic.com> wrote:
> >
> > Reiserfs file system is no longer supported and is going to be removed
> > in 2025 as stated in commit eb103a51640e ("reiserfs: Deprecate reiserfs=
").
> >
> > Signed-off-by: Piotr Siminski <piotr.siminski@globallogic.com>
> > ---
> >  MAINTAINERS | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index a5c16bb92fe2..c340c6fc7923 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -18064,7 +18064,7 @@ F:      include/linux/regmap.h
> >
> >  REISERFS FILE SYSTEM
> >  L:     reiserfs-devel@vger.kernel.org
> > -S:     Supported
> > +S:     Obsolete
> >  F:     fs/reiserfs/
> >
> >  REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM
> > --
> > 2.34.1
> >
--=20
Jan Kara <jack@suse.com>
SUSE Labs, CR
