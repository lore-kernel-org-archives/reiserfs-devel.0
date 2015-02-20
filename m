From: Vladimir Shebordaev <vladimir.shebordaev@gmail.com>
Subject: Re: help wanted add-node41.patch fails to apply to reiser4progs
 version 1.0.9
Date: Fri, 20 Feb 2015 06:31:16 +0300
Message-ID: <1424403076.4261.1.camel@home.ted.local>
References: <a6ad8c02cd6dcddc95b2d7e25d42f35c@mail.velocitynet.com.au>
	 <CAM12Q5R3HCPNjL+wnX6wqXfbCM9F1n_cLLD2rGQcGLgM8Soxew@mail.gmail.com>
	 <cb14e1389131b5cb6ed38b89ed0bf005@mail.velocitynet.com.au>
	 <c889d4bb783dfeb04663b277628e126f@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version:content-transfer-encoding;
        bh=2F3fYMEvaeGgYRmbTljQzf0RSBXRtkNfYMnyM5sbZyI=;
        b=Azi0yrvLZyNgTySind3Or4DMYW4f8sTrGRH0vOwstTGUBV9VJKgnQZMAdCZUz39Gu4
         WCDwzvLKTJQBddTYgrttDmqrwHTpeqUSlmd8O1dPz1DlM5TkNnMlL7PJssPC31wFjMKi
         pY0/vOrQOpo/V1HJjXZE+HCRpfvapiDs/Sjxnj1d/QIpMHBafIg3F1tnVe8OYSJBbaKQ
         plD2Iz+D4FuV1qJoxfmWYIxcDVxxA804yVLV8hc/CKXOPqAyDfUG5lXWEt+2VN+3fFJ4
         VPne+Cr5eGfo4S6p5I2X4+v7o3udgbiLoQgsrXp2ByOtkKdzxFIE8EcpQkhvCK72UdMp
         GsPw==
In-Reply-To: <c889d4bb783dfeb04663b277628e126f@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org


=E2=80=8BSo,=E2=80=8B what is your question? =E2=80=8BAs you have been =
told, you've got libtool
package missing.=E2=80=8B

=E2=80=8BI'd also say, when you get it installed, you'd better invoke a=
utoreconf
as

# autoreconf -if

Please also ignore numerous warnings about obsolete macro names, it has
nothing to do with the patch in issue.

--
Regards.
Vladimir

On Fri, 2015-02-20 at 12:02 +1100, doiggl@velocitynet.com.au wrote:
> Hello,
> Need to figure out the next bit in relation to autoreconf.
>=20
> shows in buildlog as:
> [   83s] + autoreconf
> [   85s] aclocal: warning: autoconf input should be named 'configure.=
ac',
> not 'configure.in'
> [   85s] configure.in:196: warning: macro 'AM_ENABLE_SHARED' not foun=
d in
> library
> [   85s] configure.in:313: warning: macro 'AM_PROG_LIBTOOL' not found=
 in
> library
>=20
> [1]
> asked here:
> http://lists.opensuse.org/opensuse-packaging/2015-02/msg00069.html
>=20
> reply here:
> http://lists.opensuse.org/opensuse-packaging/2015-02/msg00071.html
>=20
> --Glenn


--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
