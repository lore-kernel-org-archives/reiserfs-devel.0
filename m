From: Grant Miner <mine0057@mrs.umn.edu>
Subject: Re: software packaging and ReiserFS v4
Date: Wed, 03 Sep 2003 18:11:36 -0500
Message-ID: <3F567528.7030102@mrs.umn.edu>
References: <20030903165409.GD4714@rahul.net> <3F565A8F.4010209@botz.org> <20030903213742.GA13146@rahul.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15539-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030903213742.GA13146@rahul.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bennett Todd <bet@rahul.net>, reiserfs-list@namesys.com


>>Nor is there a $HOME.  Depending on your point of view (more
>>about that below) there is only /, /bin, [...] The key to this
>>are what we might call "perspectives".  Every user has their own
>>perspective, or maybe more than one that they can chose between.
>>[...]
> 
> 
> I _think_ this was big in Plan 9, if I'm not mistaken.

Yes, this is what Plan 9 does.  Actually, Linux now has support for 
per-process namespaces (perspectives) too (it was added by Al Viro in 
2.5.2).  He also might may write code to do unions.

