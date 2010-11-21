From: =?UTF-8?B?0K7RgNC40Lkg0JfQsNC40LrQuNC9?= <yzaikin@gmail.com>
Subject: RE: Reiser4 for Linux-2.6.36
Date: Sun, 21 Nov 2010 22:58:09 +0200
Message-ID: <000001cb89be$cebdfc20$6c39f460$@com>
References: <4CE87674.4090909@gmail.com> <4CE93CEB.8050504@ya.ru> <4CE9603B.7050103@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:references
         :in-reply-to:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding:x-mailer:thread-index:content-language;
        bh=Z2qk4JqDUcHbWDntAPhYDxUp8KvLgvGfMIYSlbFnWU0=;
        b=oBbE4/MAtlNOM/TijvJ5vWSuE8wDkzIhM44pMEWbcPw2iPKNUuKYwVorYBp2QqSXCb
         HJwPkzXpHKY0JSds3OnEorvs2oTuWPsjTCGZF4ClF/gYAIBUR/qO0lTxrGr1cxSd7RQx
         QCj8qfvUIsa6WHJK7r66AEo3r2kgRdGq0tcMI=
In-Reply-To: <4CE9603B.7050103@gmail.com>
Content-Language: ru
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Edward Shishkin' <edward.shishkin@gmail.com>, dimas000@ya.ru
Cc: 'Reiserfs mailing list' <reiserfs-devel@vger.kernel.org>

The bug with building OpenOffice is still there though now it doesn't produce a kernel panic. The build script just randomly fails with IO exceptions. Builds OK on tmpfs so reiser4 is definitely to the culprit.

