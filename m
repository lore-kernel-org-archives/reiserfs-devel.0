From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 for Linux-4.12
Date: Mon, 14 Aug 2017 16:18:11 +0200
Message-ID: <da25f5c9-28bf-4c30-f119-b5e4f57dce08@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=Lm5YZUZCLu2zI3isz/kdy9PygD+gbb0rU02JLSV7InQ=;
        b=hmLAjq6QOk78VysT828rii9KfyUV++h2tsWIQG+4K4VeS7SlT3BFSMUSm+LGPno/7J
         QFtTirZp/fFnEmyzoKr+5pEh6n4AF+eHhhNlnHqm90OWn71vFec3FCBxcKaUtNITVeHq
         Bt+B8a56VSOT8te7Qaf+rOCDnLZAYh8ukXfWhUNiu21D0V2bm5uWCS7I0/gjJyHEr62K
         lQz8vSBcz3KK/K8jFKEWw5MqlfxGAmCmK/Gp1UHGWgbEvqDOsB9Vv0YGEiguhkCnxVJt
         esqCvlvk/hT/gUT2W86n7QXN58LMu4TXYbRryTKUHPJnmY949+H2fgzHHuGP+IAbRvRM
         kOVQ==
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

ChangeLogs:

"master" branch (stable stuff):
. Port for Linux-4.12.

"format41" branch (experimental stuff):
. Port for Linux-4.12;
. Logical Volumes support by the flush procedure;
. Logical Volumes support by flush queue (submitting RELOCATE set);
. Data striping support (see next mail for details).

Please, find here:
https://github.com/edward6/reiser4
https://sourceforge.net/projects/reiser4/files/reiser4-for-linux-4.x/

Thanks,
Edward.

