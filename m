From: Jan Kara <jack@suse.cz>
Subject: Re: [johan.ekenberg@gmail.com: Meddelande via din profil i Google:
 Reiserfs 3 + quota BUG - interested?]
Date: Thu, 25 Oct 2012 21:05:51 +0200
Message-ID: <20121025190551.GB3262@quack.suse.cz>
References: <20121024114402.GA11262@shiny>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121024114402.GA11262@shiny>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johan Ekenberg <johan.ekenberg@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

>    Hello Chris! You may not remember me, but back in 2003/2004 we worked
>    together solving some issues with diskquotas in Reiserfs 3. Or rather, I
>    reported the bugs and kept testing your patches until it was solved. Our
>    Swedish hosting company has kept on using Reiserfs 3 + usrquota. It's now
>    in use on around 200 large servers. As it is, we have discovered a bug
>    that prevents us from using any kernel >= 2.6.33.1. From 2.6.33.1 and up
>    to latest 3.x, our servers will eventually get filesystem lock-ups and
>    die. The problem is reproducable and has been narrowed down to Reiserfs 3
>    + usrquota + kernel 2.6.33.1 or higher. Are you interested in debugging
>    this, or do you know who might be? We currently have to choose between
>    getting someone interested enough to help us fix it or convert from
>    Reiserfs 3 to ext4 on ~200 very busy servers involving tens of thousands
>    of hosting customers... Take care, /Johan Ekenberg
  I can have a look at this. For debugging this, I'd need you to boot some
recent kernel (like 3.6), trigger the lockup on a partition different from
/ (so that the whole machine doesn't die) and then run:
  echo w >/proc/sysrq-trigger

Finally get output of dmesg (kernel message log) and send it to me. Thanks.

								Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
