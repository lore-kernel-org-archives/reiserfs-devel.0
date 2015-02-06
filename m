From: Felipe Monteiro de Carvalho <felipemonteiro.carvalho@gmail.com>
Subject: Reiser 3.5 partition name
Date: Fri, 6 Feb 2015 11:46:22 +0100
Message-ID: <CACyNnZNx_krfBLBCGEyDC1zVkc4mYvEubuPoFQ4rCpAYzcBPCQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=OJGPJS7Hi/tYlbxKA3lUpZRGA7r+wbms2ViwjrPhhmc=;
        b=rHtGfLsC44r6oc/XUgnzTb+NTXIXrsEgTNTjZeimOR2TSb8Urn/Myiu/igZfLM0Lso
         Wlz7fv3XyCBDCARuBZxD+s/OJWWNh/MZMSm9fLN76NhvNjbtrmXGuauRxGLS42O7Kawv
         uvcEarZfgFamhnfUyLSWUoLAn3nAq8trxfvxGruG3/ClJuhsZRWUdvfpa7/qZouPF1PI
         +8I7LpF7a1E1n23ez0wHvFGj5AA7wcWy2oZ78LCmQALq/OKRNuub73Pq/j+8RKlVFnLc
         ollzRbrDdZpKS7pZ34a+i7Hcbqyu9cZO9JHP6MqwwBwRttz+76XSYyWNZOC4gACfcjNj
         T2vg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Hello,

I am writting a software that can mount Reiser partitions. For reiser
3.6 all works great, it reads all files, dirs and the file system
label.

In reiser 3.5 (created a partition in Linux), the usual superblocks
(located at 0x10000 and similar positions) with s_magic=ReIsErFs
contain trash where the disk label should be =( both s_uuid and
s_label contain trash.

The label can be found at the superblock at 0x981C000 with s_magic=ReIsEr2Fs

My question is: Is there any other way to find this superblock which
contains the valid label except for scanning the entire partition in
search of a superblock with s_magic=ReIsEr2Fs ?

I guess such a brute force approach will work, but if there is a
documented way to get the position directly it would be preferrable to
do things right instead of a very slow brute force....

thanks,
-- 
Felipe Monteiro de Carvalho
