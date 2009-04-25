From: Volker Armin Hemmann <volkerarmin@googlemail.com>
Subject: Re: reiser4 inclusion?
Date: Sat, 25 Apr 2009 02:25:26 +0200
Message-ID: <200904250225.26206.volkerarmin@googlemail.com>
References: <alpine.DEB.2.01.0904181302440.6162@bogon.housecafe.de> <542E227E-E31D-496C-93FB-19393133297F@MailNewsRSS.com> <49F2523A.70604@ontolab.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=/nt5D7TcOans1Sa3YhBhIxTKayqSKvV8vgIU+TalYwE=;
        b=kxLmTPjqiP15LLLE6x1WDGE/kb9BHw5ZpmIkJYA8McWhrJAhphKyCA8jgRhoP8tlWj
         rVl5nu4gh1+r9gmaqwWGATkfEmYdgMy1IHd1TB/7NClbej+za+vtYKvqqUu+sQhf6/7I
         SBkMxKmpeQ9cT6s5SQdtoJpZ8Xmnm8vs9wdAI=
In-Reply-To: <49F2523A.70604@ontolab.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

On Samstag 25 April 2009, Christian Stroetmann OntoLab wrote:
> Hello Jason,
>
> > Edward,
> >
> >> Please,
> >> don't flood in this mailing list.
> >> Go away!
> >
> > You are totally out of line here.
> >
> > First, please following mailing list etiquette and don't top post
> >
> > Second, Christian, like all others, have a right to post here. You may
> > not agree with his posts (or what he is doing with OntoFS), but that
> > does not give you the right to tell him to go away.
> >
> > Third, if the community only relied on you to progress reiserfs, it
> > has been years at this point and nothing significant. it is basically
> > somewhat dead.
> >
> > If there was more co-operation and less fighting, perhaps forking
> > would not need to be an issue, but with your head up your ass no
> > progress gets made, no leaps forward, nada, zip, zilch.
> >
> > -Jason
> >
> >> Christian Stroetmann OntoLab wrote:
> >>> Dear Christian;
> >>>
> >>> You wrote:
> >>>> With still no project page in sight,
> >>>
> >>> Under the label of my company and taking the full risk of losing
> >>> reputation, in contrast to other well known Linux distributions and
> >>> former supporters of R....4 fs which (partly) jumped off the train, I
> >>> made the following offers in the past:
> >>> 1. Support the R4 fs under the name R4.
> >>> 2. Set up a project page or, on the wish of the developement
> >>> community, a wiki.
> >>> 3. Under an other name, which I've choosen and I'm not allowed to name
> >>> in this mailinglist, I've have even developed another kind of file
> >>> system.
> >>>
> >>> The results were:
> >>> To 1.: No echo.
> >>> To 2.: No replay.
> >>> To 3.: I got a kindly "Go away" advice.
> >>> And to give it the rest: I do have alternatives and if some persons
> >>> think, that they can gain something by their destructive attitude,
> >>> than I have to say: Okay, have a nice day.
> >>>
> >>> Being constructive, I think we need a new projcet management, maybe a
> >>> new maintainer, or some bytes for archiving the digital waste.
> >>>
> >>>> I find it hard to track[0] the progress of the work being towards an
> >>>> inclusion of reiser4 into mainline. Unable to help out with real
> >>>> code, I look at the reiser4-for-2.6.29 diffstat (sans the fs/reiser4
> >>>> parts!) and see:
> >>>>
> >>>> Documentation/Changes                         |   12
> >>>> Documentation/filesystems/reiser4.txt         |   75
> >>>> fs/Kconfig                                    |    1
> >>>> fs/Makefile                                   |    1
> >>>> fs/buffer.c                                   |    9
> >>>> fs/fs-writeback.c                             |    5
> >>>> include/linux/fs.h                            |    3
> >>>> include/linux/mm.h                            |    2
> >>>> mm/filemap.c                                  |    4
> >>>> mm/page-writeback.c                           |   48
> >>>> So, with 4 of them being "just" documentation and build magic, I take
> >>>> it that we're 6 files and less than 100 lines of code away from at
> >>>> least putting this file system into the new staging/ tree perhaps?
> >>>>
> >>>> Thoughts?
> >>>
> >>> I found it more and more jokeless, what is going on around this fs.
> >>> Btw.: I can't and I won't follow the claims and resitances made by Al
> >>> Viro and other hard core coders against R4 and HFS+, especially the
> >>> arguments in the hardlink subject.
> >>>
> >>>> Thanks,
> >>>> Christian.
> >>>>
> >>>> [0] http://tinyurl.com/dexfq9
> >>>
> >>> Sincerely
> >>> Christian *<:o)
>
> I would really like to know, what was and is going on behind the scenes.
> If Mr. Shishkin wants some kind of monetary support for his work, then I
> have to say: "Sorry, but not this way" and "The time is over since two
> years". That  means no money! You got me? Good.
>

no, you want to make money without paying him, right?

