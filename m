From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: How tell what version of reiserfs my filesystem is?
Date: Tue, 9 Apr 2002 16:02:09 +0200
Message-ID: <200204091402.g39E29M04860@fubini.pci.uni-heidelberg.de>
References: <3CAAD745.447646E4@vtc.edu.hk> <3CAB6EE8.E8B48CAB@vtc.edu.hk> <20020404091003.A5663@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020404091003.A5663@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS <reiserfs-list@namesys.com>

Hello Oleg,

the kernel-config-help for this suggests not to enable unless you want to do 
reiserfs-debugging. But based on the data you provided, it doesn't hurt much 
on modern pc's to enable it at all. So perhaps you should also provide these 
data for the help text.

Best regards, 

Bernd

> +8Kb of code (ie, common for no matter how much reiserfs fses you have)
> plus ~440 bytes for each filesystem mounted for counters.
>
> Of course there is little performance hit (cpu time eaten) to
> actually increment these counters.
>
> Bye,
>     Oleg

