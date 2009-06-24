From: Dushan Tcholich <dusanc@gmail.com>
Subject: Re: Long writebacks with Reiser4 causing system to be unresponisive.
Date: Wed, 24 Jun 2009 10:28:48 +0200
Message-ID: <a08621850906240128t2b8caafbx3e6b97eef314da5d@mail.gmail.com>
References: <loom.20090624T033330-133@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=2EG0IDvUraNonMjrhiZ7JFBmHskfieLTRxeEWztZ4sI=;
        b=X+RDdT0rq4Hly6PCUOxYKhaLca37RvzGb7Mpi6wcOwtTldDMPO4arbS66Qb32uhdrN
         fnqAavfSIaoN/0HlCEzRxQDgtOkIoD2lm2Me8uGAaq+aVQRThRnrKIj6HhFzsmOIHSk2
         09Ytuf0pr23p/a316qNFdi7rOZRpFNH21ucxA=
In-Reply-To: <loom.20090624T033330-133@post.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Eric <eric225125@yahoo.com>
Cc: reiserfs-devel@vger.kernel.org

On Wed, Jun 24, 2009 at 5:53 AM, Eric<eric225125@yahoo.com> wrote:
> I have been having problems for the past few months where when I'm
> doing moderately disk intensive activities (such as downloading a git=
 tree,
> using a virtual machine), I will get 1-2min periods where basically n=
othing
> can access the disk.
>
> By watching /proc/meminfo, I can see my dirty memory gradually growin=
g
> during these disk intensive activities until it gets very
> large (several 100MB), then my system will be unresponsive until it a=
ll
> goes through writeback. =C2=A0This same behavior can be reproduced by=
 manually
> running "sync" when the dirty memory is fairly large.
>
> Has anyone else experienced these problems? I noticed that some major
> changes were made to how Reiser4 uses dirty memory
> (http://lkml.org/lkml/2009/2/13/106). =C2=A0I believe I started seein=
g
> this problem around that time. Could that have caused it?
>

Similar simptoms were noticed a year or so ago, but when using atime.
Can you reproduce it if you mount your partition with noatime?
Can you make some way to reliably reproduce it?

> (Sorry for my vague and probably inaccurate description of the proble=
m;
> I know very little about virtual memory and file systems).
>
Welcome to the club :)


Thanks

Dushan
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
