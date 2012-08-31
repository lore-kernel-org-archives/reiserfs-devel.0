From: <doiggl@velocitynet.com.au>
Subject: reiser4 patch and formatting partitions
Date: Fri, 31 Aug 2012 13:19:34 +1000
Message-ID: <ffc5fb825e3c08c0f37e9696d3025d65@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: reiserfs-devel@vger.kernel.org

Hello,
Is the reiser4 patch with the [kernel 3.1 stuff by Marcin Baczy=C5=84sk=
i]
available somewhere to try out.=20
- Can the patch be accessed from [1] when it is released.
- Should I use the format option -o "formatting=3Dextents" when creatin=
g a
partition e.g
mkfs.reiser4 -o create=3Dccreg40,formatting=3Dextents /dev/sdaX

Information from this thread [2]

Thanks
Glenn

[1] http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-2.6=
/
[2] http://www.spinics.net/lists/reiserfs-devel/msg03216.html

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
