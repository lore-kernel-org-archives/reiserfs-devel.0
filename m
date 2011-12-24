From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: RE: Reiserfs.c bug in 3.2-rc5
Date: Sat, 24 Dec 2011 11:55:43 -0000
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAKCACr8ZwetPrGXZsycJodKihAAAEAAAAGPJDX4w3wxIo8Onu2+q/xMBAAAAAA==@decimal.pt>
References: <43556.213.228.140.150.1323560920.squirrel@webmail.decimal.pt> <20111213180707.GI11747@quack.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111213180707.GI11747@quack.suse.cz>
Content-Language: pt
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Jan Kara' <jack@suse.cz>
Cc: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, haiyangz@microsoft.com, hjanssen@microsoft.com

Howdy,

> >
> > What can be done here?
>   The assertion failing is:
>         BUG_ON(nblocks > journal->j_trans_max);
> in do_journal_begin_r(). That means that reiserfs_create() tried to
> start a
> transaction with more credits than allowed by the journal.
> 
>   When did you started to see this problem? Also do you use SELinux (or
> generally security labels)?
> 

No SELinux, the only change is from 3.1.1 to 3.2-rc5.
Tried the new 3.2-rc7 and the problem persists.

Is there a way that the ReiserFS people can commit the fix?

Jorge,
