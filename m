From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 for Linux-3.10
Date: Tue, 16 Jul 2013 19:50:39 +0200
Message-ID: <51E587EF.4050504@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=2tAa5KF+BuUtTWTZ9X0kBZ4OWovsVcMqdkENbppSKQY=;
        b=f17RtwZCrn56LECi86HbZPblVOighcSutERObJiorh65aPyEhqoXgxHUt4RwI8Ctkz
         IyuiCLS0Owe6AF5wkBWoJkzlMN6CUBUf05lffp2BrTNTFJ0QZZQjRw0Z0RZA8YkDqkYr
         Cm023biUzLVAErvc5GgckxQXRG2yaPNlHpNZa5YjFl+JGqk6FVQrFdi5KPaYDBBEFuVN
         ark6E5VL3HQvJ5QSHu0prdPh4vN3gvQBpZZs2CUwWvFkJiqZ7mwNJbkCIcOKCxv5Pzxz
         H33lnB8TTmUrEbcIbR+xm8Pez67qymigdbE0gHoHCXccxUQzVabDK2aznbCEkL8obyQM
         4SWQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>

Changes since reiser4-for-3.9.2:

. Port for linux-3.10
. Fix up incorrect cluster nodes accounting resulted in rare-occurred oops
   kernel BUG at fs/reiser4/block_alloc.c:151

Please, find at
http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-3.x/

Thanks,
Edward.
