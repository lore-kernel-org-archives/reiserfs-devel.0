From: Magicloud Magiclouds <magicloud.magiclouds@gmail.com>
Subject: Little report on reiser4 with 2.6.35.7
Date: Fri, 12 Nov 2010 15:54:51 +0800
Message-ID: <AANLkTincE-JHOYPoZkrBrbqs7eo__s8Vjn3bbEKVzGEB@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=HnTKqNw0L5qhuPKclkOYWumEmTHWfTk+DwsnXw5srZ8=;
        b=I2OKfehxM0Ah9nEdLXpzaEtQKaQlcHU34vML0DiShUr4NbNG+JEwpArKZaOYCmqKCr
         ffib7zgCL2BIGYdDgiXNdynNm55SJimeAt1lBZP3dbaJ8uX/hrLnCCLq0Y25tbYikcpH
         e780wZYG4pCpDQ5j5Zif1ZmujCtbTHxLmkj/U=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Hi,
  I compiled 2.6.35.7 kernel with reiser4 patch on debian sid. And I
found a serious problem. When the reiser4 fs was full, it broke down,
which lead the module to "bus error". Then I fscked it, I had to "fix"
and "build file system". At last, I lost some files (not sure of the
contents of the left files), which are not created right before it
broke down.
