From: =?UTF-8?B?4oCg?= <god12@niksula.hut.fi>
Subject: Re: Reiserfs 4
Date: Tue, 22 Jul 2014 15:54:16 +0200
Message-ID: <53CE6D08.3010700@niksula.hut.fi>
References: <CAMRsyOdq8mTCtxGH0h1m4pTOKZoGvk+N0aG4ADSFBx5qSHmUAw@mail.gmail.com>	<CAMRsyOd8j3oQ2OACOBnXBR4Zyt09AU48KNmPPkm2qj01BMA9Aw@mail.gmail.com> <20140720194256.551f51f9@Ulf.tvoe.tv> <53CCD8C8.4030900@niksula.hut.fi> <90CADE8A1B1C4C9FBBDEC0AB7376599D@DuSTmanPC> <53CE54ED.70001@ontolinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <53CE54ED.70001@ontolinux.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Linux Reiserfs Devel <reiserfs-devel@vger.kernel.org>

22.07.2014 14:11, Christian Stroetmann =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>
>
> 1. The general concept about a formally verified R4 was already made =
in the
> November 2006 with the start of OntoLinux [1] (see its characteristic=
s on the
> webpage Overview [2]). At that time, the OntoFS [3] was based on R4.

Could you provide links to actual verification or source code?
All I've managed to find there is some marketing junk from the company =
I've never
heard about before.

On a related note - I think formally verified R4 is great idea but you'=
ve got to be
aware that as long as it's running on top of unverified Linux kernel we=
 can only
assure that some properties hold under the assumption that kernel actua=
lly does the
right thing. Not sure how practically viable it is outside of general a=
cademic curiosity.

cheers,
Max.

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
