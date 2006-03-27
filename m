From: Tassilo Horn <heimdall@uni-koblenz.de>
Subject: Re: 2.6.16 patch
Date: Mon, 27 Mar 2006 22:41:49 +0200
Message-ID: <87y7yvpqlu.fsf@baldur.nicundtas.de>
References: <4417D43A.2070603@namesys.com>
	<3aa654a40603150459q25507248v54f4ffef5e41042d@mail.gmail.com>
	<44185E04.5030307@namesys.com> <44267AAE.60201@free.fr>
	<e09dad$f0p$1@sea.gmane.org> <871wwnr7tr.fsf@baldur.nicundtas.de>
	<e09i4s$1ng$1@sea.gmane.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28362-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Marcus Furlong <furlongm@hotmail.com> writes:

Hi Marcus,

> Sorry about that, must have put the wrong patch up. Change unlock to
> mutex_unlock and it should be fine.

Yes, thought that. And now it works.

Thanks,
Tassilo

