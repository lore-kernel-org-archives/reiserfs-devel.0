From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: Fw: reiser4 git repo
Date: Fri, 27 Nov 2009 04:00:51 +0100
Message-ID: <20091127030050.GC5406@nowhere>
References: <20091127155148.dcc5cdee.buchner.johannes@gmx.at>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=Neq0QZpqdsXoMakQheHWVZo0nXtCKo9wmmM4LVNdPXA=;
        b=OGeuzFp9hkSLUk7mmb1R6USvJxkNWqdMjUmr8AubJUdulI3IG8Xc3weY8X7+FprVxt
         U8krEpo/uYYeivVTE00ghd4Soh5vlpgnT1UyiC+QAj8L5ehYsyd+JRPLDWxVaDwJPt02
         IvEjD+mfC7wPX2DSLWOwOEMyzINvP/AQr5DPw=
Content-Disposition: inline
In-Reply-To: <20091127155148.dcc5cdee.buchner.johannes@gmx.at>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Buchner <buchner.johannes@gmx.at>
Cc: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Fri, Nov 27, 2009 at 03:51:48PM +1300, Johannes Buchner wrote:
> [ I sent this 2 days ago to linux-fsdevel@vger.kernel.org, maybe I'll
> get more responses in here. ]
> 
> Hi!
> 
> I would like to keep a git repo up to date with current kernel
> development, with reiser4 patched in. I am having trouble finding a
> repo that provides reiser4. Is there one?
> 
> Some people may have noticed the last patch doesn't apply cleanly
> anymore. I made a few lines of modifications in my local repo. Maybe
> that repo would be interesting for others too*.
> 
> I plan to catch up with changes from kernel development on a
> daily/weekly basis; my /home partition is reiser4, so I am fairly
> serious about it.
> 
> At the moment, I fetch from torvalds/linux-2.6.git and 
> stable/linux-2.6.31.y.git. Am I missing any other repositories that I
> should try to keep up with? (A fs subsystem maintainer repo?)
> next/linux-next.git is probably moving too fast for me.


You can try the -mm tree, the reiser 4 patches can be found inside:

http://userweb.kernel.org/~akpm/mmotm/

