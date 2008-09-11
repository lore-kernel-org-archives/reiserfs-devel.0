From: Anders Aagaard <aagaande@gmail.com>
Subject: Re: Correct fsck behavior on boot
Date: Thu, 11 Sep 2008 14:53:26 +0200
Message-ID: <48C914C6.2030600@gmail.com>
References: <48C9004A.5080504@gmail.com>	 <80294dc60809110450i20d43214o144b754b33713f48@mail.gmail.com>	 <48C90D37.1060201@gmail.com> <80294dc60809110523t3009e87bx9f2c2cb5f88aaebc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=sNNxi+aPDBq9KOJQM47xVWeZKYACSWADItKALfsQjJ0=;
        b=A9fhvCzSIMFX0/RdU/Vc8d1dFQoRi9bkbO46PrNCYDSKRMD8zL3TVASdZfS2d682QN
         adG62oI335rO9kKFkacF23+A2yGLq/JmTRkTJhnZo2XObLMUdI7Loj4UdOQFVhcYsjvs
         GGxjWEuaxWoLhOrcbe872BQ9vWgKtZHCiFz1M=
In-Reply-To: <80294dc60809110523t3009e87bx9f2c2cb5f88aaebc@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alexander Lyamin <flx@Msu.ru>
Cc: reiserfs-devel@vger.kernel.org

Alexander Lyamin wrote:
> I dont really like both: idea and flag name.
> Can you elaborate a bit on your reasoning behind the patch ?
> 

http://bugs.gentoo.org/195988

Currently closed as RESOLVED_FIXED with preen aliased to --check --fix 
more or less.  It's not something I expect will be included upstream 
anytime soon, but if the gentoo developers refuse to support reiser4 in 
init scripts it has to be supported elsewhere.  And they default to -p 
on linux systems.

> 
> On Thu, Sep 11, 2008 at 4:21 PM, Anders Aagaard <aagaande@gmail.com 
> <mailto:aagaande@gmail.com>> wrote:
> 
>     Alexander Lyamin wrote:
> 
>         Why one have to worry about cleanness   of a  _journaled_ fs ?
>         Its seems like immediate return on -a is intended behavior.
> 
> 
>     I suspect it is, I'm just making sure I have something to fire back
>     with when a gentoo developer complains about my patch here:
> 
>     http://bugs.gentoo.org/show_bug.cgi?id=237393
> 
> 
> 
>         On Thu, Sep 11, 2008 at 3:26 PM, Anders Aagaard
>         <aagaande@gmail.com <mailto:aagaande@gmail.com>
>         <mailto:aagaande@gmail.com <mailto:aagaande@gmail.com>>> wrote:
> 
>            Hi
> 
>            What's the correct options to pass to reiser4.fsck on boot to
>         get it
>            to check the filesystem when it's not marked as clean?
> 
>            reiser4 fsck does implement -a, but it seems to return right
>         away,
>            including when the filesystem wasn't unmounted cleanly.  Is the
>            filesystem integrity still secured by hash'es, so skipping
>         fsck is
>            intentional?
>            --check --fix seems a tad bit excessive on every boot.
> 
>            Anders Aagaard
> 
> 
> 
>         -- 
>         connecting the dots
> 
> 
> 
> 
> 
> -- 
> connecting the dots

