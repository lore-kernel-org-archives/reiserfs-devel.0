From: Sebastian Kaps <seb-keyword-reiserfs.0462a0@toyland.sauerland.de>
Subject: Re: Linux 2.4 -> 2.6 migration
Date: Sat, 08 Nov 2003 13:32:03 +0100
Message-ID: <m3znf7avng.fsf@toyland.sauerland.de>
References: <m3ptg42t8l.fsf@toyland.sauerland.de> <200311072107.50957.>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16019-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200311072107.50957.> (Quinn Harris's message of "Fri, 7 Nov
	2003 21:08:48 -0700")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi Quinn!

> Did you enable IDE TCQ in your 2.6 kernel?  To quote http://www.namesys.com/
> download.html

I guess I did enable TCQ.

> "Don't enable TCQ (Tagged Command Queuing) in 2.5 (and modified 2.4) kernels. 
> TCQ is known broken currently and it will corrupt your filesystems for sure."

Okay, that would explain it...

-- 
Ciao, Sebastian
