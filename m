From: Christian Kujau <evil@g-house.de>
Subject: Re: vpf-10680 corruptions
Date: Sat, 21 Jun 2003 12:37:49 +0200
Message-ID: <3EF4357D.9060601@g-house.de>
References: <3EF07AFB.8060303@g-house.de> <20030618152626.GA17240@namesys.com> <3EF0A8E8.2000209@g-house.de> <20030619054535.GA23852@namesys.com> <3EF20728.2080905@g-house.de> <3EF2F315.2080306@g-house.de> <20030620122946.GA24875@namesys.com> <3EF316C7.7010209@g-house.de> <3EF38E0C.3020705@g-house.de>
Reply-To: evil@g-house.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14647-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EF38E0C.3020705@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

Christian Kujau schrieb:
> i'll restest with the "newest reiserfsprogs" from namesys, since i have 
> 3.6.6. here (from debian testing)
> 

no change with reiserfsprogs-3.6.8.

but: on ia32 the problem does not occur. i have an AMD 900 here, 2.5.72, 
reiserfsprogs 3.6.6 (also debian/testing) and there are no corruptions 
at all with reiserfs. i guess i'll resend this to lk-ml or so.

sorry for wasting time after it turned out to be probably an arch 
problem....

Thanks,
Christian.


