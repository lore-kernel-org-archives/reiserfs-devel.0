From: Ookhoi <ookhoi@humilis.net>
Subject: Re: Error message - vs-13070
Date: Fri, 14 Feb 2003 18:40:46 +0100
Message-ID: <20030214184046.E26095@humilis>
References: <5.2.0.9.0.20030215000534.018ed008@mail.bogus.home>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12768-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <5.2.0.9.0.20030215000534.018ed008@mail.bogus.home>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Heberle <heberle@westnet.com.au>
Cc: reiserfs-list@namesys.com

Andrew Heberle wrote (ao):
> Twice in the last four days I have found the following message in one
> of my systems logs:
> 
> vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find
> stat data of [1718696 1718710 0x0 SD]

[cut]

> I suppose I am just wanting confirmation that based on the error
> message this is likely to be a hardware issure rather than being
> caused by an as-yet unknown corruption bug in reiserfs (I find this
> very unlikely based on my past, very stable history with reiserfs).

Do a dd if=/dev/<rootpartition> of=/dev/null

That either gives you an error (hardware issue) or not. 

Also look at dmesg before and after the dd, and look for new messages.
