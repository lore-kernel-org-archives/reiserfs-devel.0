From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCHv4 01/17] VFS: introduce helpers for the s_dirty flag
Date: Sat, 29 May 2010 10:59:28 +0300
Message-ID: <1275119968.2668.7.camel@localhost.localdomain>
References: <1274795352-3551-1-git-send-email-dedekind1@gmail.com>
	 <1274795352-3551-2-git-send-email-dedekind1@gmail.com>
	 <20100528132318.0783675a.akpm@linux-foundation.org>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-ext4-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:reply-to:to:cc
         :in-reply-to:references:content-type:date:message-id:mime-version
         :x-mailer:content-transfer-encoding;
        bh=BtMXlzJouMj/zQtSecleNmDSTORsRfNpf8EME3cP7gU=;
        b=Gn058YLkP+uCYtJ3+xN0c2JAKh2/kXWoWzV3jJkKOhChLkXhrHnWJlSkOyGRLdhzcH
         hLVkqJt8TYFh6AlrY9aAbZmxcyHsUxo+eJrnQt8K1e2yzCX0EFwKFjECDvOl5yxgwAXa
         uUlYQxUUny0EkPFIssvfELDMbqub1NKHkmf28=
In-Reply-To: <20100528132318.0783675a.akpm@linux-foundation.org>
Sender: linux-ext4-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, LKML <linux-kernel@vger.kernel.org>, Jens Axboe <jens.axboe@oracle.com>, linux-fsdevel@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>, "Tigran A. Aivazian" <tigran@aivazian.fsnet.co.uk>, Chris Mason <chris.mason@oracle.com>, Boaz Harrosh <bharrosh@panasas.com>, linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, David Woodhouse <dwmw2@infradead.org>, reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.cz>, Evgeniy Dushistov <dushistov@mail.ru>

On Fri, 2010-05-28 at 13:23 -0700, Andrew Morton wrote:
> > +static inline void mark_sb_dirty(struct super_block *sb)
> > +{
> > +	sb->s_dirt =3D 1;
> > +}
> > +static inline void mark_sb_clean(struct super_block *sb)
> > +{
> > +	sb->s_dirt =3D 0;
> > +}
> > +static inline int is_sb_dirty(struct super_block *sb)
> > +{
> > +	return sb->s_dirt;
> > +}
>=20
> A more conventional and superior naming scheme is
> subsystemid_specific_function_identifier().  eg, bio_add_page() inste=
ad
> of add_page_to_bio().
>=20
> So these want to be sb_mark_dirty(), etc.
>=20
> Being very old code written by very yound people, the VFS kinda ignor=
es
> that convention, but it doesn't hurt to use it for new code.
>=20
> Feel free to ignore me if that's too much of a PITA ;)

Sure I'll re-name them, thanks!

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)

--
To unsubscribe from this list: send the line "unsubscribe linux-ext4" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
