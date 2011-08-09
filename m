From: Carsten Ralle <cr@i4yoo.de>
Subject: Re: rebuild-tree fails on large volume
Date: Tue, 09 Aug 2011 19:01:06 +0200
Message-ID: <4E4167D2.2020206@i4yoo.de>
References: <4E3A7945.9090404@i4yoo.de> <alpine.DEB.2.01.1108052344150.9183@trent.utfs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.01.1108052344150.9183@trent.utfs.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-devel@vger.kernel.org

>> http://www.spinics.net/lists/reiserfs-devel/msg02679.html
>> I looked all over the place but couldn't find any infos about the
>> version to patch.
> The patch applies cleanly to reiserfsprogs-3.6.21[0].
> [0] https://www.kernel.org/pub/linux/utils/fs/reiserfs/
many thanks to all of you: the rebuild-tree (3.6.21-0 + your patch)
finished this morning and everything looks OK so far, but it'll take a
while to check all of the data.

Imho the patch should be included as soon as possible to the official
OpenSuSE reiserfsprogs tree as there still are a lot of people running
large volumes on ReiserFS v3.6.

Thanks again,

Carsten

--=20
--------------------------------------------------
Yoo GmbH                       Tel.: 037328 809 40
Zellwaldring 51                Fax : 037328 809 96
D-09603 Grossvoigtsberg
Germany                             www.yoogmbh.de
Registereintrag: Amtsgericht Chemnitz, HRB 181 852
Gesch=E4ftsf=FChrung: Carsten Ralle
--------------------------------------------------
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
