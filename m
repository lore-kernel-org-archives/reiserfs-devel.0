From: butt3rflyh4ck <butterflyhuangxx@gmail.com>
Subject: Re: A null-ptr-deref bug in reiserfs_breada in fs/reiserfs/journal.c
Date: Sun, 4 Jun 2023 19:52:50 +0800
Message-ID: <CAFcO6XOLYskwg4GtH1X94rTjbGRvNy5jgau28UfYG3T6azkVLQ@mail.gmail.com>
References: <CAFcO6XOacq3hscbXevPQP7sXRoYFz34ZdKPYjmd6k5sZuhGFDw@mail.gmail.com>
 <ZHxydoL06XHR1bOx@casper.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685879581; x=1688471581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAxQCeI6h0I53x47uaZFC8WhX7hLCllFyhAD+lcGDv4=;
        b=rySf5fpaWLJzjT0P1c/kJgwKFwZ9Tt8wrU7hLpeUR6dwkKo8g9Nj7ERLiz3bU7hFZu
         411tykjibLrgcINJRpJcEILqV/iQT6Od2/lC8MknMBlRV1M03AREELTeBUkCu2KRrEv7
         gxKMGLpLHpGue0hlZ3ri/5C1ZYOU1kfakjwKzo+tMQNBpsXITJ5Xh6CYZL4Qmhr6OvKb
         9zd3BQMPmbiVk3zZXOjcW5F+O4tGMu5K/TL3C3fn7BDXrg7qYaSW5ebdDkuvy/LmbvOa
         vtteyVhO3Y4nxD8HmJ0M3GzlwMqqjtIBUnXrjDvIZz89p58ILfhC2YDqys0m1xMLxEEQ
         kxLg==
In-Reply-To: <ZHxydoL06XHR1bOx@casper.infradead.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Matthew Wilcox <willy@infradead.org>
Cc: Jan Kara <jack@suse.cz>, akpm@linux-foundation.org, yi.zhang@huawei.com, trix@redhat.com, song@kernel.org, bvanassche@acm.org, reiserfs-devel@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Yes, it works! I have tested the patch.

Regards,
 butt3rflyh4ck.


On Sun, Jun 4, 2023 at 7:16=E2=80=AFPM Matthew Wilcox <willy@infradead.org>=
 wrote:
>
> On Sun, Jun 04, 2023 at 04:12:56PM +0800, butt3rflyh4ck wrote:
> > Hi, there is a null-ptr-deref  bug in reiserfs_breada in
> > fs/reiserfs/journal.c, I reproduce it in the latest kernel too.
>
> does this fix the problem?
>
> diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
> index 4d11d60f493c..dd58e0dca5e5 100644
> --- a/fs/reiserfs/journal.c
> +++ b/fs/reiserfs/journal.c
> @@ -2326,7 +2326,7 @@ static struct buffer_head *reiserfs_breada(struct b=
lock_device *dev,
>         int i, j;
>
>         bh =3D __getblk(dev, block, bufsize);
> -       if (buffer_uptodate(bh))
> +       if (!bh || buffer_uptodate(bh))
>                 return (bh);
>
>         if (block + BUFNR > max_block) {
> @@ -2336,6 +2336,8 @@ static struct buffer_head *reiserfs_breada(struct b=
lock_device *dev,
>         j =3D 1;
>         for (i =3D 1; i < blocks; i++) {
>                 bh =3D __getblk(dev, block + i, bufsize);
> +               if (!bh)
> +                       break;
>                 if (buffer_uptodate(bh)) {
>                         brelse(bh);
>                         break;



--=20
Active Defense Lab of Venustech
