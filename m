From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for Linux-2.6.36
Date: Mon, 22 Nov 2010 04:54:15 +0100
Message-ID: <4CE9E967.4020605@gmail.com>
References: <4CE87674.4090909@gmail.com> <4CE93CEB.8050504@ya.ru> <4CE9603B.7050103@gmail.com> <000001cb89be$cebdfc20$6c39f460$@com> <4CE9D9D3.2010901@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060102010800010608050901"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type;
        bh=EYwD47x0GVRw1v2KQX0ciLqwyVKWFrBwT/TBy2dM8aA=;
        b=oRP3tgEn0ECMTt7bgYcQu1/DuqpiapzkouvIcs3gk29CUybE/bG8DoB0uvoYRauQyD
         fmh+1zdWSvxvtBDKxLIFfl4Uy5duwvql86XbkuahWCprbFZgxtROlabwovL0teHF/1O7
         vEGLniUm4m/wHmqO0puZRSNg5kBKhsBrncu4g=
In-Reply-To: <4CE9D9D3.2010901@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: =?UTF-8?B?0K7RgNC40Lkg0JfQsNC40LrQuNC9?= <yzaikin@gmail.com>
Cc: dimas000@ya.ru, 'Reiserfs mailing list' <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------060102010800010608050901
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Edward Shishkin wrote:
> Юрий Заикин wrote:
>   
>> The bug with building OpenOffice is still there though now it doesn't produce a kernel panic. The build script just randomly fails with IO exceptions.
>>     
>
> Is compression enabled (did you format
> the partition with "create=ccreg40" option)?
>
> Thanks for the report.

Ah, I see..
Could you please apply the attached patch?
Does it fix your problem?

Thanks,
Edward.



--------------060102010800010608050901
Content-Type: text/x-patch;
 name="reiser4-fix-write_begin.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-fix-write_begin.patch"

diff -urN linux-2.6.36.orig/fs/reiser4/plugin/file/cryptcompress.c linux-2.6.36/fs/reiser4/plugin/file/cryptcompress.c
--- linux-2.6.36.orig/fs/reiser4/plugin/file/cryptcompress.c	2010-11-22 04:34:19.000000000 +0100
+++ linux-2.6.36/fs/reiser4/plugin/file/cryptcompress.c	2010-11-22 04:39:34.000000000 +0100
@@ -3785,10 +3785,6 @@
 		ClearPageUptodate(page);
 		goto err0;
 	}
-	if (len != PAGE_CACHE_SIZE && !PageUptodate(page)) {
-		ret = RETERR(-EIO);
-		goto err0;
-	}
 	/* Success. All resources (including checkin_mutex)
 	   will be released in ->write_end() */
 	*fsdata = (void *)buf;

--------------060102010800010608050901--
