From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Fwd: Kernel config option which causes reiser4 to be instable
Date: Tue, 11 Dec 2012 19:15:41 +0400
Message-ID: <2081336.xV2AR3Rhy2@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:subject:date:message-id:user-agent:mime-version
         :content-transfer-encoding:content-type;
        bh=SRgXNUbIpK7tj2sFTFhSpoXifKdCzQoMSJSOMOdRRqg=;
        b=gQRmJrKqdkFvdKtYdoVYrDc6eNmMJcMJQpCNHZ99QFazkOjH6Gzf2DONFH6qZB6hhT
         oy0JxEDjKsjkzb91SYPK1aOIuoQBwpFyxpEULji/weC6en/MrN3OW8oKtiBywA8LSAgj
         eSzlymd0i/eLBYeEwJ9cRkduwABedm3WeObK4tGNP8F5IYkHjorzXc27CyIJzsl247yz
         6nJ2e8RbsPk2Pgu4pVkymS9/W9mNYlCsdnKUYB1r04qht75HBCTyW7x51XS9HO7vgPIN
         PvGIZIwf/P0fBVnX9U6Kat0eYjs2QLI3ZfZghw9HjVigmsJ2Dt7tDv5aQh75uoJEpMHr
         kT/A==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, =?utf-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, edward.shishkin@gmail.com

Sorry, I've made the original message a reply (though it shall be in a =
new=20
thread).

Here it is (resent):

----------  Original message  ----------

Subject: Kernel config option which causes reiser4 to be instable
Date: 11 Dec 2012, 19:08:17
=46rom: Ivan Shapovalov <intelfx100@gmail.com>
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>
Cc: Du=C5=A1an =C4=8Coli=C4=87 <dusanc@gmail.com>, edward.shishkin@gmai=
l.com

Hello!

With help of Du=C5=A1an =C4=8Coli=C4=87 <dusanc@gmail.com> who provided=
 his kernel config=20
diff I've found a kernel option which, when disabled, greatly reduces=20
(hopefully to zero, but need time to verify it) corruption rate in reis=
er4.

It's CONFIG_TRANSPARENT_HUGEPAGE (or something which is used by it like=
=20
CONFIG_COMPACTION or CONFIG_MIGRATION).
=46or now I'm testing it with CONFIG_TRANSPARENT_HUGEPAGE disabled on k=
ernel=20
3.6.10, and everything seems to be OK so far (so the workaround is vers=
ion-
agnostic).

Edward, are there any guesses on what can make reiser4 choke on=20
hugepages/compaction/migration? I'm not even barely familiar with the k=
ernel=20
internals.

Thanks,
Ivan.
-----------------------------------------
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
