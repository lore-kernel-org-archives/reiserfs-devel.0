From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: problem with GNOME 2.30
Date: Mon, 12 Apr 2010 02:07:51 +0200
Message-ID: <4BC26457.5020107@gmail.com>
References: <4BC15348.80205@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=mm6NxsitiIWD3JzdaIs+jWOl5syF1cWVCrQgtOnrJ94=;
        b=MWunDLhkRVwt3CVoDAE89XqSx5s4DiUsjxqsveIrOyzW1EeuIxTN5cnPTjKAB1LnDm
         K1749t0BPI3yFYdcRrxK8Nuomu4QjXKcF9wo2csZGfqrxO0rgudMCPSKrg1JxdMW2FfZ
         cDqXifzT+JsfP0i9tENWICz5Kez+8WpZ5MEdE=
In-Reply-To: <4BC15348.80205@gentoo.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Serkan Kaba <serkan@gentoo.org>
Cc: reiserfs-devel@vger.kernel.org

Serkan Kaba wrote:
> After an upgrade to GNOME 2.30 I cannot create new files with data
> (i.e save as) or cpoy/move files into reiser4 partition. The files are
> created with no content (i.e 0 bytes). Command line copy/move works as
> expected. And the issue happens with combination of GNOME 2.30 and
> reiser4 (other combinations do work) I also reported this to GNOME
> bugzilla (http://bugzilla.gnome.org/show_bug.cgi?id=615346) , but do
> you have any idea what may be causing it?

Sorry, no ideas.
Try to figure out why gnome ask VFS to create empty files.

Thsnks,
Edward
