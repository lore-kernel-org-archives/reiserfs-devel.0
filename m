From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Kernel config option which causes reiser4 to be instable
Date: Tue, 11 Dec 2012 19:08:17 +0400
Message-ID: <2612159.zxK0OqJdpP@intelfx-laptop>
References: <CADW=+3n+rKECWNSmzcMeTQaPZrtA3Sr04=yO1cqsd0j09Y43Ww@mail.gmail.com> <CADW=+3m2s9Yyi7Da1nieTXjFx=KcfLch+mwoRTB50vGj+mZA=w@mail.gmail.com> <CADW=+3kz__Rd_29Sx8mdiA0b_S11pEsXLYG5AGzjAVBC4Hck8w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-transfer-encoding:content-type;
        bh=Lf+CRBRKA/xYfW/4X/h+/J70w/kxgFYO8z5fOViffIM=;
        b=xUMFPsyk3PluuR/EHgE+sZZngImIyOcK/J7ED0WdCjL9lUS+S0ORmnmnJQPKC2MEsh
         A6WA7BQxG2gH/yub8xKAKFd8gi21fm2LT3nt1xVtHfAPLmBufxAPVBxP4liKg6SPfOiC
         IdQkBzWr4WqqaXKjNpgsKE7l3cCmFoE8jfERqoG16nDJKHreCj1UdPPDJVNAJ9Q6Jrmw
         vYBh2JgrD2KkXTVh1idoQqUaLaAOZomdQCJE6mcJ/cBupRyKjMgvv6xFu8iiPpvZdGaC
         LDu7AbPwOFSiYye7pOTvW3uZz0zNC6pfq8URM2CBh1eZelwORlwoYyIBWWX4xDhAEEuc
         xcqA==
In-Reply-To: <CADW=+3kz__Rd_29Sx8mdiA0b_S11pEsXLYG5AGzjAVBC4Hck8w@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>
Cc: =?utf-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, edward.shishkin@gmail.com

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
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
