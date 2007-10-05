From: lepton <ytht.net@gmail.com>
Subject: Re: Increasing REISERFS_LINK_MAX
Date: Fri, 5 Oct 2007 11:46:13 +0800
Message-ID: <20071005034613.GA4315@router.lepton.home>
References: <47058513.1070609@todmue.de>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:received:date:from:to:cc:subject:message-id:references:mime-version:content-type:content-disposition:in-reply-to:user-agent;
        bh=iLF/g7l+J2gRxRcWkI2TGXX39LG1KLzVEo0fa5k41Xg=;
        b=RmyUCSWFo6Io/kXme8BGSX1HjAqtuHxNRBCkjDM6+l5ZllbAotwZLJqHiPxJ52cSJsC5HIu8SAJErx1rKbpVrn16Avo9UL8iUUJPZrPQDfe9lKv0lLoitS3Jc6bIIAHMKoAmtaAxKJgRzsvjnSZQkvvJr5y7tNW4HWY5CHLFhMQ=
Content-Disposition: inline
In-Reply-To: <47058513.1070609@todmue.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Gruss <marco@todmue.de>
Cc: reiserfs-devel@vger.kernel.org

I think it should be safe to increase REISERFS_LINK_MAX to 
a number smaller than 2^32, since nlink is 32bits now.
I sugguest you can try it in user mode linux or something like
qemu or vmware first.

On Fri, Oct 05, 2007 at 02:28:03AM +0200, Marco Gruss wrote:
> Hey there,
> 
> I'm using reiserfs on a system that keeps backups. In order to
> save space, I make very heavy use of hardlinks (using cp -al
> for duplicating a tree and also using the excellent rdfind from
> http://hem.bredband.net/pauls/rdfind/rdfind.html). I have now
> run into the maximum link limit per file of 63535 (2^16-1001).
> 
> First thought: "Just increase it and go on". Then I thought
> that this limit probably isn't there for fun; so here's my
> question: Is it safe to increase REISERFS_LINK_MAX exceeding
> unsigned int, or will horrible breakage occur?
> 
> Thanks in advance for any input.
> 
>    Marco


