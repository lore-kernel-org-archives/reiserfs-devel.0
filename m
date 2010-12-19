From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for Linux-2.6.36
Date: Sun, 19 Dec 2010 17:05:53 +0100
Message-ID: <4D0E2D61.8030808@gmail.com>
References: <4CE87674.4090909@gmail.com> <4D0DD3BA.9030909@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=pFKdl+17ZMub/Ixo7AabiySjH2t4G3zYgJmx6V41Y9I=;
        b=F/1zE+Eh4sI6tZewCS0FCo4Zbo7RGPvgqk2egr6GtDmi/z6eEdonA/b320Fhef+lyZ
         KwmsDgp0K4kEZMmshXa4cLzDygpA/5DM9HuTRzPdZC4mdmEz2XpLP4g/91tsOOvDDFgN
         YBBSracMW7jwb6SC/F+wtSpKdFDZcEpf4eftY=
In-Reply-To: <4D0DD3BA.9030909@gentoo.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Serkan Kaba <serkan@gentoo.org>
Cc: reiserfs-devel@vger.kernel.org

Serkan Kaba wrote:
> On 21-11-2010 03:31, Edward Shishkin wrote:
> > Changes since 2.6.35:
>
> > . Fixed ->write_end() method: the old one didn't update i_size, and this
> >  resulted in empty files and "orphan" items. The problem took place only
> >  for splice users (loop devices, pipe2, etc).
> I retried testing glib-2.24. The file size attribute is copied
> correctly. But the file contents are still not copied. Thus resulting in
> an empty file with non-empty filesize.

Are there any kernel complaints?
Did you enable compression?

Thanks,
Edward.
