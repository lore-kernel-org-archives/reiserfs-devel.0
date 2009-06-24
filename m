From: Volker Armin Hemmann <volkerarmin@googlemail.com>
Subject: Re: Long writebacks with Reiser4 causing system to be unresponisive.
Date: Wed, 24 Jun 2009 19:48:57 +0200
Message-ID: <200906241948.57912.volkerarmin@googlemail.com>
References: <loom.20090624T033330-133@post.gmane.org> <a08621850906240128t2b8caafbx3e6b97eef314da5d@mail.gmail.com> <loom.20090624T155545-956@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=t/phg9MYBxuyYW4C2rDTJ47XDlZ1OlagfKVDN1fQDa0=;
        b=q/0tFxPizvgrq8HfTmpL07GFqDNZm2vmFM+UMFkUmdYDEsu5NsYFxPvAPH5sZ+/Akb
         sfciGnwj1p4YVgFPQN3cpdnInTqzUPP1Lz3N09+E6WtC2hvqShUgjkSUUvV0b0MH2irj
         PbfVg0btkMrAhui52kD2PsGbcCOIERM/dE9Ws=
In-Reply-To: <loom.20090624T155545-956@post.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

On Mittwoch 24 Juni 2009, Eric wrote:
> Dushan Tcholich <dusanc <at> gmail.com> writes:
> > On Wed, Jun 24, 2009 at 5:53 AM, Eric<eric225125 <at> yahoo.com> wrote:
> > > I have been having problems for the past few months where when I'm
> > > doing moderately disk intensive activities (such as downloading a git
> > > tree, using a virtual machine), I will get 1-2min periods where
> > > basically nothing can access the disk.
> > >
> > > By watching /proc/meminfo, I can see my dirty memory gradually growing
> > > during these disk intensive activities until it gets very
> > > large (several 100MB), then my system will be unresponsive until it all
> > > goes through writeback.  This same behavior can be reproduced by
> > > manually running "sync" when the dirty memory is fairly large.
> > >
> > > Has anyone else experienced these problems? I noticed that some major
> > > changes were made to how Reiser4 uses dirty memory
> > > (http://lkml.org/lkml/2009/2/13/106).  I believe I started seeing
> > > this problem around that time. Could that have caused it?
> >
> > Similar simptoms were noticed a year or so ago, but when using atime.
> > Can you reproduce it if you mount your partition with noatime?
> > Can you make some way to reliably reproduce it?
> >
> > > (Sorry for my vague and probably inaccurate description of the problem;
> > > I know very little about virtual memory and file systems).
> >
> > Welcome to the club :)
> >
> > Thanks
> >
> > Dushan
> > --
> > To unsubscribe from this list: send the line "unsubscribe reiserfs-devel"
> > in the body of a message to majordomo <at> vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> My partition is already mounted with noatime.  I also forgot to mention
> that I have LZO compression enabled, could that be a problem?
>
> As far as reproducing this problem, I am currently opening a Windows guest
> in Virtualbox, loading Rosetta Stone software, and paging through about 5
> pages of a lesson.  The dirty memory would have now approached 50MB.  By
> running "sync" to force writeback, the system will become unresponsive
> for about 30-60 seconds.
>
> Is there a way to manually create dirty memory that needs to be written
> back? That would be a better way to reproduce.
>
> Eric
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

hm, I can't reproduce that. I was seeing similar stuff in former times - 
without voluntary preemption and high timer rates ... but today the worst 
thing that is happening is a short jerk in the mouse...
