From: Joe Feise <jfeise@feise.com>
Subject: Re: reiser4 can now bear with filled fs, looks stable to me...
Date: Sun, 30 Jul 2006 18:33:48 -0700
Message-ID: <44CD5DFC.9080606@feise.com>
References: <20060730223755.GA14386@hermes.uziel.local>
Reply-To: jfeise@feise.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29286-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060730223755.GA14386@hermes.uziel.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Christian Trefzer wrote on 07/30/06 15:38:

> Hi,
> 
> I booted 2.6.18-rc2-mm1 today and later filled up my /opt partition by
> accident, and guess what, reiser4 did not screw up : D


Lucky you. I tried -rc2-mm1 today, and out of habit, the first thing I do is an
fsck on my reiser4 partitions. And that resulted in a crash :-(
I am now back to -rc1-mm1, which was the last one that's stable for me.

-Joe

