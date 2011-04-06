From: Giuseppe Argentieri <joe.silver@gmail.com>
Subject: Re: File copy problems kde 4.5 to 4.6.1 with reiser4 2.6.38
Date: Wed, 06 Apr 2011 23:22:38 +0200
Message-ID: <1302124958.3469.3.camel@freedom2>
References: <201103090918.47762.berny@dwami.com>
	 <4D7774D7.3030908@dwami.com> <4D7FA356.1000309@gmail.com>
	 <201104041142.42496.berny@dwami.com>
	 <BANLkTimmZ4GDX2-K=TaNLOMUg8+C6uyWHQ@mail.gmail.com>
	 <4D9B9875.60400@gmail.com> <4D9BEDAA.6020400@gentoo.org>
	 <BANLkTimNoqZwW=N=5jcMm_C8cTw9ity55g@mail.gmail.com>
	 <4D9CC7F0.5080903@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:subject:from:to:cc:in-reply-to:references
         :content-type:date:message-id:mime-version:x-mailer
         :content-transfer-encoding;
        bh=oyUtmGnYlU7PuNgd1/+oGL0BDAEI/2UxAFtOKQcO8yU=;
        b=fqLuNTOuULQYpCTOBEjoIVIqoXl11d8GnMWgSSYEevHBA2hHmx1/47nfdzK2DKzxCK
         XvlUNUzC4c4ckMIqMS46a6w3ml9Yk3sZdzlK3g8NTzQgM+wMVYqliHVrKrTPX2TctLZT
         Ai1jyJSuhmqqcRQ8ybrgmFBHB1fKBsQKdjzFk=
In-Reply-To: <4D9CC7F0.5080903@gentoo.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Serkan Kaba <serkan@gentoo.org>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Il giorno mer, 06/04/2011 alle 23.07 +0300, Serkan Kaba ha scritto:

> This one has a slight issue please use
> http://bugzilla-attachments.gnome.org/attachment.cgi?id=185354
> 
> which is actually checking destination not the source.
> - -- 
> Sincerely,
> Serkan KABA
> Gentoo Developer

Thank you very much! It seems that this workaround is working!

I will reinstall the original glib as soon as the issue is solved in
reiser4.


Best regards

-- 
Giuseppe Argentieri <joe.silver@gmail.com>

