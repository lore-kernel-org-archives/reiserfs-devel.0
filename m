From: Volker Armin Hemmann <volkerarmin@googlemail.com>
Subject: Re: [PATCH] reiserfs: kill-the-BKL
Date: Thu, 9 Apr 2009 23:23:36 +0200
Message-ID: <200904092323.36589.volkerarmin@googlemail.com>
References: <1239070789-13354-1-git-send-email-fweisbec@gmail.com> <20090409193635.GO14687@one.firstfloor.org> <20090409211733.GA23233@elte.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=iqv2z/VmN9XB/gHOgMTPs43xdmQWgtnm6dC8vimdJ/Y=;
        b=tAZsh5U//8m7H31yopPS8sSj7KmGq2lFdXxuNoj/wHM+ZehvcjsIokU8Uz6+hSKLrb
         nJeYnCpvlTsZs6NTBoogBVvio0qQ09Uoabm1A/3PJ3pTb2POoUuSlumpXeVd0Zkr0ala
         zoTVrC4Cs9qXe/9SlgzJD/wiMwa/Bdm9qAjxs=
In-Reply-To: <20090409211733.GA23233@elte.hu>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

On Donnerstag 09 April 2009, Ingo Molnar wrote:
> * Andi Kleen <andi@firstfloor.org> wrote:
> > > Using a mutex seems like the sane choice here. I'd advocate spinlocks
> > > for a new filesystem any day (but even there it's a fine choice to have
> > > a mutex, if top of the line scalability is not an issue).
> > >
> > > But for a legacy filesystem like reiser3, which depended on the BKL
> >
> > reiser3 is much more widely used in the user base than a lot of
> > "non legacy" file systems. It's very likely it has significantly
> > more users than ext4 for example. Remember that it was the default
> > file system for a major distribution until very recently. [...]
>
> ( Drop the condescending tone please - i very much know that SuSE
>   installed reiser3 by default for years. It is still a legacy
>   filesystem and no new development has gone into it for years. )

and that is bad? Isn't that more a sign of a certain 'stableness' - which is 
seriously lacking from more 'popular' filesystems like ext3? btw, does ext3 
finally turn barriers on per default or does it still prefer letting data rot 
in drive caches because of 'performance'?

how many users would ext4 have if fedora&ubuntu would not force it onto the 
unwashed masses? And is that really a good idea after the amusing episode of 
the last month? 

btw, what are ext3&4 doing when the underlying device does not support 
barriers (like software raid)?
