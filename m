From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Re: Strange Syslog messages - this is NOT an isolated case!
Date: Mon, 30 Sep 2002 15:23:16 +0400
Message-ID: <200209301523.16500.vitaly@namesys.com>
References: <20020930125753.5d05d7ea.fionn@unix-ag.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11570-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020930125753.5d05d7ea.fionn@unix-ag.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fionn Behrens <fionn@unix-ag.org>, reiserfs-list@namesys.com

> Having gotten curious, I did a ls -lR on the drive and uncovered about a
> dozen similar problems outside /lost+found. I have not yet changed anything
> on the drive and hope you can give me some advice as I consider this a
> SERIOUS problem (wheter my data is in danger or not, problems should be
> found by an fsck). As a satiric sidenote, there are messages appearing in
> the syslog, suggesting an fsck. But fsck wont find a problem.
>
> So, bottom line:
> * The drive is pretty new. badblocks does NOT find anything. In fact it ran
>   flawlessly until I rebuilt the tree.
> * reiserfsck --fix-fixable claims there are NO errors.
> * I have 2.4.19, too
> * I am using reiserfsprogs 3.6.3 from the Debian
>   reiserfsprogs 3.6.3-1 package.

It looks like a known bug which was fixed in last pre releases. Would you try
reiserfsprogs-3.6.4-pre2 and tell us about the result?

-- 

Thanks,
Vitaly Fertman
