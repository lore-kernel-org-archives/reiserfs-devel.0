From: Oleg Drokin <green@namesys.com>
Subject: Re: rebuild fs
Date: Tue, 5 Aug 2003 17:35:09 +0400
Message-ID: <20030805133509.GI13689@namesys.com>
References: <E5A63F34D141D111A6F4080009D70ACA346D62@imkedv_pdc> <20030805104546.GA22557@namesys.com> <3F2FA2DF.3050505@namesys.com> <20030805125431.GE13689@namesys.com> <3F2FA997.20101@namesys.com> <20030805131723.GH13689@namesys.com> <3F2FB0F9.5020001@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15148-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F2FB0F9.5020001@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Thorsten Mauch <mauch@imkenberg.de>, "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

Hello!

On Tue, Aug 05, 2003 at 05:28:25PM +0400, Hans Reiser wrote:
> >>>>rephrase that as, use 3.6.11, if it still fails, tell us, the segfault 
> >>>>will at least be fixed regardless of whether fsck has enough data to do 
> >>>>its job.
> >>>But it was not failing on the IDE drive anyway.
> >>I don't understand the relevance of your statement to mine.
> >Since after transferring image to IDE made reiserfsck to not fail (and it 
> >failed on raid5 due to raid errors,
> >I think), your "if it still fails" statement was not adequate., 
> Even with a broken hard drive, there should be no userspace segfault.... 
> or am I wrong?

in this case (IO error) reiserfsck does abort() which ends up as signal number 5, and core is dumped if this is allowed.
Looks pretty much like segfault too.
Though a message is printed prior to this that we cannot read some block.

Bye,
    Oleg
