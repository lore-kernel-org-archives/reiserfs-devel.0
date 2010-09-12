From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: problem with GNOME 2.30
Date: Sun, 12 Sep 2010 19:53:58 +0200
Message-ID: <4C8D13B6.10807@gmail.com>
References: <4BC15348.80205@gentoo.org> <alpine.DEB.2.01.1004121819080.29272@bogon.housecafe.de> <4C8D0E22.1010300@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=cJfhZcNIemYbBPGsXNk+oz1rrl2iJFJOgPM9NfCNS0o=;
        b=WVNlHHSb3fpZ3cM32dU/8g0WId3mxd4yc94vU8rvMkHeagABx26ZQ+ZFx9rjqVO7ce
         Idno22bWjER8Jyg3+6SWCol3bpcpDtOTvkP/tu5eTfGuYjf81/pXQQYoYOgIux0KEayB
         z23z/GfY6RdSvX3ZMZNddUDyCWWr/ydQCJk8Y=
In-Reply-To: <4C8D0E22.1010300@gentoo.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Serkan Kaba <serkan@gentoo.org>
Cc: reiserfs-devel@vger.kernel.org, Christian Kujau <lists@nerdbynature.de>, tbzatek@redhat.com

You are deadly right.

splice, pipe2, loop devices, etc users of write_begin(),
->write_end() doesn't work properly since these new
aops was introduced.

Edward.

P.S. If someone can not wait, then feel free to fix those
aops, I'll try to help..


Serkan Kaba wrote:
> On 13-04-2010 04:23, Christian Kujau wrote:
> > So, I assume that other programs (Firefox? Openoffice? vi?) can still
> > create files on this reiser4 partition. It'd be interesting how
> Gnome is
> > trying to create files. strace(1) comes to mind, I know it will be
> messy
> > to catch all the Gnome processes, but mabe you're lucky...
> With the help of upstream, my little example program and and strace I
> got some ideas on what might be the issue.
>
> Glib started to use *splice* for copying files (changelog and upstream
> says, strace output proves)
>
> I'm attaching the example program and strace outputs with glib 2.22
> and 2.24
>

