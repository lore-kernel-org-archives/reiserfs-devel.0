From: Chris Cox <ccox@airmail.net>
Subject: Re: rebuild-tree working for more then 3 days- what to do?
Date: Fri, 07 Jan 2005 17:35:41 -0600
Message-ID: <41DF1CCD.8010900@airmail.net>
References: <2AEAD962-6089-11D9-A3E5-003065C0167C@xslf.com> <1105093253.3616.34.camel@tribesman.namesys.com> <53BAB6CE-60A5-11D9-8B41-003065C0167C@xslf.com> <1105101220.4192.68.camel@tribesman.namesys.com> <1332240552.20050107134330@tnonline.net> <87390888-60AC-11D9-8B41-003065C0167C@xslf.com> <1105103606.3616.98.camel@tribesman.namesys.com> <20050108002947.0f149ce2.xslf@xslf.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23079-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050108002947.0f149ce2.xslf@xslf.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Shoshannah Forbes wrote:
> On Fri, 07 Jan 2005 16:13:27 +0300
> "Vladimir Saveliev" <vs@namesys.com> wrote:
> 
> 
>>reiserfsck --rebuild-tree 's speed depends of file set substantially.
>>The worst case - a lots (millons) of small files.
>>But even in that case on average today hardware it should not take more
>>than 4-5 hours for 60gb filesystem.
>>Please inform us how does it progress. Pass 0 is the longest usually.
> 
> 
> It ran, fixed some errors, and now I have my system back (plus a bunch of portage files in lost+found). Yippy!
> Now I should go a buy that DVD-R I was thinking of getting, and make sure I have proper backups :-)
> 

Not sure about this.. but I have observed that some systems trash resierfs3
pretty badly, while others do not.  The problem seems a bit worse with LVM.
For example a Compaq n610c laptop will trash reiserfs3 on hard shutdown or crash
about 1 out of every 3 times (with entire directory trees going to lost+found
even though no writes involved the files there).  Likewise for my dual
AMD using the Tyan S2468UGN mb.  But my laptop, Toshiba 3000-s504 is fine.
And my dual Opteron (Sun w2100z) is fine.  These can be crashed, powered off
without everything going into lost+found.  I suspect something is up.. and
it may be chipset related (??).

Can't explain it.... just what I've observed.


