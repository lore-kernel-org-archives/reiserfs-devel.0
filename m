From: Marcus Becker <Becker_Marcus1@web.de>
Subject: problem with corrupted filesystem
Date: Tue, 30 Mar 2010 10:59:55 +0200 (CEST)
Message-ID: <10637573.555449.1269939595054.JavaMail.fmail@mwmweb063>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel@vger.kernel.org

the problem is actual reproduceable. I emerged gcc again and the excact=
 same happened:

disi-laptop portage # rm -r *
rm: cannot remove `sys-devel/gcc-4.4.3/work/gcc-4.4.3/libjava/classpath=
/resource/gnu/java/locale': Directory not empty

=C2=A0

I am not sure, why it doesn't like that particular folder..
___________________________________________________________
GRATIS f=C3=BCr alle WEB.DE-Nutzer: Die maxdome Movie-FLAT!
Jetzt freischalten unter http://movieflat.web.de
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
