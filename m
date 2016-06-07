From: Felix Zielcke <fzielcke@z-51.de>
Subject: Re: reiserfsprogs v3.6.25
Date: Tue, 07 Jun 2016 16:00:38 +0200
Message-ID: <1465308038.1718.2.camel@z-51.de>
References: <42434805-7b9f-bde1-e882-998f9f62676e@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=z-51.de; s=exim;
	h=Content-Transfer-Encoding:Mime-Version:Date:Content-Type:References:In-Reply-To:To:From:Subject:Message-ID; bh=IwOdwqqWwxrcC2m3WvyHNlu6zGCN2RcAiIAPcbG0VTc=;
	b=Kk0+N+u/AHvGRw8/55y2aoYV6HYhX4eXYTTVL25Jzf2ASZarYdvQ6gXykgEO22SAPFxGwtZJLQ8iKnVFHcknVlQh2iTjs1h6COCnbRpaOnrqhckLQWZaIXd8KoMYFUqoUcK+uw2EtTm1VgoUswqxCDM56NY0HYNZVQx2BKVOppo=;
In-Reply-To: <42434805-7b9f-bde1-e882-998f9f62676e@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jeff Mahoney <jeffm@suse.com>, reiserfs-devel@vger.kernel.org

Am Montag, den 06.06.2016, 14:23 -0400 schrieb Jeff Mahoney:
> Hello all -
>=20
> I've just released reiserfsprogs v3.6.25, which contains a rollup of
> the commits that have accumulated since the last release.=C2=A0=C2=A0=
The
> biggest
> change is that libreiserfscore can now be used as a shared library
> for
> use with other projects (e.g. btrfs-convert).
>=20
> It is available now at:
> https://www.kernel.org/pub/linux/kernel/people/jeffm/reiserfsprogs/v3
> .6.25/

Hi Jeff,

I get a compile error. com_err.h is missing:

In file included from parse_time.c:8:0:
=2E./include/reiserfs_lib.h:14:21: fatal error: com_err.h: Datei oder V=
erzeichnis nicht gefunden
compilation terminated.

Regards
=46elix Zielcke
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
