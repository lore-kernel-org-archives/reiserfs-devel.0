From: Hans Reiser <reiser@namesys.com>
Subject: Re: any way to disable fsync?
Date: Tue, 11 Jul 2006 17:04:56 -0700
Message-ID: <44B43CA8.7010505@namesys.com>
References: <op.tcjl3meld4os1z@localhost> <200607112157.k6BLvUqk028924@turing-police.cc.vt.edu> <BAYC1-PASMTP0152E46B1E5184F223039DBF680@CEZ.ICE>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28960-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <BAYC1-PASMTP0152E46B1E5184F223039DBF680@CEZ.ICE>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Toby Thain <toby@smartgames.ca>
Cc: Valdis.Kletnieks@vt.edu, =?UTF-8?B?xYF1a2FzeiBNaWVyendh?= <prymitive@pcserwis.net>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

There are legitimate applications where the value of data is low enough
and the load is high enough, that losing the database upon crash is ok.

I have mixed feelings about making it a mount option for reiser4 because
many users will not know what they do.  In the end though, I should just
sell the rope and advise but not control what people do with it.   If
someone writes it I will take a mount option patch to disable fsync iff
it comes with documentation that has a lot of warnings.
