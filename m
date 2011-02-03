From: Gleb Baryshev <gleb.baryshev@gmail.com>
Subject: Re: fsck.reiser4 (libaal-1.0.5) segfault
Date: Fri, 04 Feb 2011 00:05:11 +0300
Message-ID: <4D4B1887.3020306@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :subject:content-type:content-transfer-encoding;
        bh=0UdrH+dIt6ByfR/pT2+cWYLJW7MWNbUjPIYHLB6ibr0=;
        b=yAIlWClojwt3iadUpe87T+O8x380qxRC8m+AYiGWAKkzUdk1hZoaqjiuFYtNpK3qSc
         Zl0G7rVq1iLMEiA08EIN5as61xSjKEZNnwLHKnwi3Ig8QuhU/o2pztdxpC9Vp2mGQ6n4
         M10aNvlpiznELSzibkvbLoCFXRTYNddeesvcg=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

03.02.2011 22:09, Edward Shishkin writes:
> Sorry, but this file looks corrupted.
> Could you please try again?
>
> Also make sure that packed meta-data are
> extracted correctly by the following way:
>
> #touch meta_tmp
> #bzcat meta.bz2 | debugfs.reiser4 -U meta_tmp

For some reason, debugfs was adding junk every time - 8 bytes (1B 5B 3F
31 30 33 34 68) before 'VRSN'; in other respects the metadata file is
all right. Finally I ran debugfs from LiveCD and got correct dump:
http://tootiny.net/813h25

BTW, fsck from LiveCD segfaulted, too.

Gleb
