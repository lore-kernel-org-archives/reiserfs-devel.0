From: Alexander Lyamin <flx@msu.ru>
Subject: Re:  Repeated mails
Date: Sun, 5 Oct 2003 23:58:18 +0400
Message-ID: <20031005235818.E8827@t-raenon.nmd.msu.ru>
References: <3F7EB431.4020408@gmx.net> <20031004230106.GA27026@neon> <3F7F546D.8080105@gmx.net>
Reply-To: flx@msu.ru
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15795-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F7F546D.8080105@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Cc: Axel Siebenwirth <axel@pearbough.net>, ReiserFS List <reiserfs-list@namesys.com>, Alexander Lyamin <flx@namesys.com>, postmaster@noos.fr

oh, here are  the headers, and yes, they look fishy.
its seems like noos.fr  does something really strange, and i should 
contact the postmaster


Sun, Oct 05, 2003 at 01:14:53AM +0200, Carl-Daniel Hailfinger wrote:
> Hello Axel,
> 
> Axel Siebenwirth wrote:
> > Hallo Carl-Daniel!
> > 
> > Carl-Daniel Hailfinger schrieb am Samstag, den 04. Oktober 2003:
> > 
> > 
> >>am I the only one receiving a few mails from Al Viro and Nikita Danilov to
> >>the list more than once? Looking more closely, they all seem to have a
> >>noos.fr address in the headers.
> > 
> > 
> > I see this too, but I know why, It's because some mails go to reiser list
> > and kernel mailing list. So I receive two mails because I am subscribed to
> > both lists and my procmail filters them both into my reiser mailbox.
> 
> Well, I'm only subscribed to reiserfs-list and the Received: headers
> clearly show that the mails I'm complainig about were sent as follows:
> orig_sender->vger.kernel.org->noos.fr->thebsh.namesys.com->reiserfs_subscribers

orig->vger->noos->reiserfs-list
    \->reiserfs-list

more of like this,
noos sends us a copy, for some-who-nows-which reason.

if i'll have no response for them, i'll shitlist them.

> 
> Proof: Here are the headers.
> 
> Delivered-To: GMX delivery to c-d.hailfinger.kernel.2003@gmx.net
> Received: (qmail 22970 invoked by uid 65534); 4 Oct 2003 22:55:38 -0000
> Received: from thebsh.namesys.com (HELO thebsh.namesys.com) (212.16.7.65)
>   by mx0.gmx.net (mx012) with SMTP; 05 Oct 2003 00:55:38 +0200
> Received: (qmail 2703 invoked by uid 501); 4 Oct 2003 22:55:29 -0000
> Mailing-List: contact reiserfs-list-help@namesys.com; run by ezmlm
> Precedence: bulk
> list-help: <mailto:reiserfs-list-help@namesys.com>
> list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
> list-post: <mailto:reiserfs-list@namesys.com>
> Errors-To: flx@namesys.com
> X-Mailing-List: reiserfs-list@namesys.com
> Delivered-To: mailing list reiserfs-list@namesys.com
> Received: (qmail 2674 invoked by uid 85); 4 Oct 2003 22:55:28 -0000
> Received: from root@noos.fr by thebsh.namesys.com by uid 82 with
> qmail-scanner-1.15
>  (spamassassin: 2.43-cvs.  Clear:SA:0(0.0/5.0 tests=none autolearn=no
> version=2.60):.
>  Processed in 0.462435 secs); 04 Oct 2003 22:55:28 -0000
> Received: from nan-smtp-10.noos.net (HELO smtp.noos.fr) (212.198.2.81)
>   by thebsh.namesys.com with SMTP; 4 Oct 2003 22:55:27 -0000
> Received: (qmail 152338731 invoked by uid 0); 4 Oct 2003 22:55:20 -0000
> Received: (qmail 151433953 invoked by uid 0); 2 Oct 2003 15:42:59 -0000
> Received: from unknown (HELO vger.kernel.org) ([67.72.78.212])
>           (envelope-sender
> <linux-kernel-owner+phix-list=40noos.fr@vger.kernel.org>)
>           by 212.198.2.81 (qmail-ldap-1.03) with SMTP
>           for <phix-list@noos.fr>; 2 Oct 2003 15:42:59 -0000
> Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
> 	id S263376AbTJBPkz (ORCPT <rfc822;phix-list@noos.fr>);
> 	Thu, 2 Oct 2003 11:40:55 -0400
> Received: (majordomo@vger.kernel.org) by vger.kernel.org id S263389AbTJBPkz
> 	(ORCPT <rfc822;linux-kernel-outgoing>);
> 	Thu, 2 Oct 2003 11:40:55 -0400
> Received: from thebsh.namesys.com ([212.16.7.65]:58284 "HELO
> 	thebsh.namesys.com") by vger.kernel.org with SMTP id S263376AbTJBPkx
> 	(ORCPT <rfc822;linux-kernel@vger.kernel.org>);
> 	Thu, 2 Oct 2003 11:40:53 -0400
> Received: (qmail 31526 invoked from network); 2 Oct 2003 15:40:52 -0000
> Received: from laputa.namesys.com (212.16.7.124)
>   by thebsh.namesys.com with SMTP; 2 Oct 2003 15:40:52 -0000
> Received: by laputa.namesys.com (Postfix on SuSE Linux 8.0 (i386), from
> userid 511)
> 	id 526AEB070; Thu,  2 Oct 2003 19:40:51 +0400 (MSD)
> From: Nikita Danilov <Nikita@Namesys.COM>
> MIME-Version: 1.0
> Content-Type: text/plain; charset=us-ascii
> Content-Transfer-Encoding: 7bit
> Message-ID: <16252.18179.242071.708771@laputa.namesys.com>
> Date: Thu, 2 Oct 2003 19:40:51 +0400
> To: viro@parcelfarce.linux.theplanet.co.uk
> Cc: Zan Lynx <zlynx@acm.org>, linux-kernel@vger.kernel.org,
>   reiserfs-list@namesys.com, Linus Torvalds <torvalds@osdl.org>
> Subject: Re: 2.6.0-test6 crash while reading files in /proc/fs/reiserfs/sda1
> 
> 
> Note the delay of two days? Something smells fishy here.
> 
> 
> Regards,
> Carl-Daniel

-- 
"the liberation loophole will make it clear.."
lex lyamin
