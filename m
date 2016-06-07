From: Felix Zielcke <fzielcke@z-51.de>
Subject: Re: reiserfsprogs v3.6.25
Date: Tue, 07 Jun 2016 16:09:25 +0200
Message-ID: <1465308565.1718.5.camel@z-51.de>
References: <42434805-7b9f-bde1-e882-998f9f62676e@suse.com>
	 <1465308038.1718.2.camel@z-51.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=z-51.de; s=exim;
	h=Content-Transfer-Encoding:Mime-Version:Date:Content-Type:References:In-Reply-To:To:From:Subject:Message-ID; bh=p+jWOgBe1C2dJgOeR1lDtdcX/RSA6llEEyiwdYuMQaA=;
	b=uLB7TB6KI8o9MvdOodqI2D9FtA8a0J8HeNPGNaUTGi+WNWb8JoUyV8N9NSM04Up4/Ivq9lJxukg9fzUOKApWOq8Zmvhti1TPMh5LTYsp64f7tL0G2vBUOabQtsbYoSBtLUIRyDnkJIbDPdyNU3CYRMkg9xzJd7fEUopLL095AjA=;
In-Reply-To: <1465308038.1718.2.camel@z-51.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jeff Mahoney <jeffm@suse.com>, reiserfs-devel@vger.kernel.org

Am Dienstag, den 07.06.2016, 16:00 +0200 schrieb Felix Zielcke:
> Am Montag, den 06.06.2016, 14:23 -0400 schrieb Jeff Mahoney:
> > Hello all -
> >=20
> > I've just released reiserfsprogs v3.6.25, which contains a rollup
> > of
> > the commits that have accumulated since the last release.=C2=A0=C2=A0=
The
> > biggest
> > change is that libreiserfscore can now be used as a shared library
> > for
> > use with other projects (e.g. btrfs-convert).
> >=20
> > It is available now at:
> > https://www.kernel.org/pub/linux/kernel/people/jeffm/reiserfsprogs/
> > v3
> > .6.25/
>=20
> Hi Jeff,
>=20
> I get a compile error. com_err.h is missing:
>=20
>=C2=A0
Ok my bad. Installed comerr-dev and it compiles now fine.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
