From: Shoshannah Forbes <xslf@xslf.com>
Subject: Re: rebuild-tree working for more then 3 days- what to do?
Date: Sat, 08 Jan 2005 06:46:44 +0200
Message-ID: <4BE282F3-6130-11D9-903C-003065C0167C@xslf.com>
References: <2AEAD962-6089-11D9-A3E5-003065C0167C@xslf.com>
 <1105093253.3616.34.camel@tribesman.namesys.com>
 <53BAB6CE-60A5-11D9-8B41-003065C0167C@xslf.com>
 <1105101220.4192.68.camel@tribesman.namesys.com>
 <1332240552.20050107134330@tnonline.net>
 <87390888-60AC-11D9-8B41-003065C0167C@xslf.com>
 <1105103606.3616.98.camel@tribesman.namesys.com>
 <20050108002947.0f149ce2.xslf@xslf.com> <41DF1CCD.8010900@airmail.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-23082-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <41DF1CCD.8010900@airmail.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Cox <ccox@airmail.net>
Cc: reiserfs-list@namesys.com


On 08/01/2005, at 01:35, Chris Cox wrote:
> Not sure about this.. but I have observed that some systems trash 
> resierfs3
> pretty badly, while others do not.  The problem seems a bit worse with 
> LVM.
> For example a Compaq n610c laptop will trash reiserfs3 on hard 
> shutdown or crash
> about 1 out of every 3 times (with entire directory trees going to 
> lost+found
> even though no writes involved the files there).  Likewise for my dual
> AMD using the Tyan S2468UGN mb.  But my laptop, Toshiba 3000-s504 is 
> fine.
> And my dual Opteron (Sun w2100z) is fine.  These can be crashed, 
> powered off
> without everything going into lost+found.  I suspect something is up.. 
> and
> it may be chipset related (??).

FWIW, my machine is a cheap AMD duron with a SiS 740 chipset.
---
Shoshannah Forbes
http://www.xslf.com

