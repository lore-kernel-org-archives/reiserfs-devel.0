From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: reiser4 for 2.6.33?
Date: Wed, 18 Nov 2009 11:12:12 -0800 (PST)
Message-ID: <alpine.DEB.2.01.0911181054250.27639@bogon.housecafe.de>
References: <alpine.DEB.2.01.0911171420480.27639@bogon.housecafe.de> <4B03FB99.6070705@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4B03FB99.6070705@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm@linux-foundation.org

On Wed, 18 Nov 2009 at 14:50, Edward Shishkin wrote:
> (a) plugin design document;
> (b) full description of what is going on in respond to memory
>    pressure notifications;
> 
> The (a) is not yet ready and I don't have a time to explain
> personally to everyone why the plugin stuff is not crappy.

Is this still a must-have? I.e. are there still strong objections against 
the plugin design? And even if so, most of this happens in fs/reiser4 
anyway I suppose, so the "evil" plugins are well contained :)

As for (b), can't this be documented at a later point as well? 

What about the technical issues, mentioned in the latest TODO list[0] 
earlier this year? Are there any real show-stoppers left?
Andrew (Cc'ed) had this in -mm for a longer time now, maybe he can
comment (once again) what's left to do from his POV?

Thanks,
Christian.

[0] http://marc.info/?l=reiserfs-devel&m=124069989217533&w=2
-- 
BOFH excuse #323:

Your processor has processed too many instructions.  Turn it off immediately, do not type any commands!!
