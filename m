From: PFC <lists@boutiquenumerique.com>
Subject: Re: Will I need to re-format my partition for using the compression plugin?
Date: Thu, 22 Sep 2005 23:33:20 +0200
Message-ID: <op.sxiwtukxth1vuj@localhost>
References: <194f625505092006316ad200b5@mail.gmail.com> <2f4958ff05092208244a0496fc@mail.gmail.com> <4332DE9F.8010808@namesys.com> <200509221951.38302.namesys.Sch@ttgen.net> <43330E14.9050209@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-26247-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43330E14.9050209@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: reiserfs-list@namesys.com


> Why do you need separate ones? Having only a cryptcompress file plugin  
> you will be able
> to create files which are either only encrypted or only compressed, just  
> set the transform
> plugins properly.

	It also make sense to have compression and crypto "close" to each other,  
which lets the data stay in the processor cache between the two...
