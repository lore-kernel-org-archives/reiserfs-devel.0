From: dimas <dimas000@ya.ru>
Subject: [Fwd: Re: where is now reiserfs in Debian-testing netinstall?]
Date: Thu, 25 Mar 2010 16:37:48 +0300
Message-ID: <4BAB672C.3040405@ya.ru>
Reply-To: dimas000@ya.ru
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: reiserfs-devel@vger.kernel.org

hi Edward and others! i have some news about reiserfs: it's now removed=
=20
from Debian installation images due to "loss of active maintainence".
look at the message below - this is the reply i got in debian-cd mailin=
g=20
list. can you say reiser3 is really well-supported now or it's "sad but=
=20
true"?

-------- =D0=98=D1=81=D1=85=D0=BE=D0=B4=D0=BD=D0=BE=D0=B5 =D1=81=D0=BE=D0=
=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B5 --------
On Tuesday 23 March 2010, dimas wrote:
> earlier i've installed Debian testing several times from "bussinessca=
rd"
> images (28M) and all was fine. but now i was really surprised when i
> tried to do this and haven't found Reiserfs in installer's partitioni=
ng
> menu.

Because reiserfs is no longer actively maintained upstream and because
there are now good alternatives, we have made support for reiserfs
optional instead of standard.

To use reiserfs with daily images you need [blah-blah-blah]
I will send a general announcement of this change soon.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
