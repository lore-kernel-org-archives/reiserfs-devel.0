From: berthiaume_wayne@emc.com
Subject: RE: A couple of questions
Date: Fri, 17 May 2002 09:11:57 -0400
Message-ID: <93F527C91A6ED411AFE10050040665D0049BFA37@corpusmx1.us.dg.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10360-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kuba@mareimbrium.org
Cc: reiserfs-list@namesys.com

	Kuba, I guess the question that should be posed this way: What is
the downside of not asking the user and just fixing what can be fixed? Is
there a potential for unrepairable damage if you were to fix blindly without
"user" intervention?

-----Original Message-----
From: Kuba Ober [mailto:kuba@mareimbrium.org]
Sent: Thursday, May 16, 2002 5:24 PM
To: reiserfs-list@namesys.com
Subject: Re: [reiserfs-list] A couple of questions


> >One extra question on this.  I assume that if in Fix mode and errors are
> >encountered that fsck.resiserfs will prompt to fix each error and that
> >there is no way to have it answer 'Yes' automatically like the ext2 -y
> >option.
> >
> >If not then I will probably have to take Jonathan Briggs suggestion of a
> >third process to answer 'Yes' repeatedly.
> >
> >Steve
>
> Why in the world do you want to run fsck without running it manually,
> and passing all information to the user?

What I'm thinking of is this:
1. If a filesystem is really too borked for fsck to recover useful stuff, it

should be left alone. Either fsck is able to help or not. No need to ask 
user, fsck has more data to determine whether the fs makes a scant of sense,

or if it has been messed up too much.
2. If we run fsck, we want to recover as much data as possible. That's what 
lost+found directory is for -- stuff that is not exactly clean for use, but 
may nevertheless be useful, gets hooked there.

Why on earth does a filesystem check & recovery program need to ask
questions 
to the user, which most users w/o intimate filesystem knowledge won't be
able 
to answer at all? Looking at this list, what people want is to get their
data 
back, as much as possible. They never want to get less than that. Why bother

asking?

That's one thing. Another thing is making fsck work on broken media, since 
that is what many unsuspecting users actually do. It should simply disregard

read errors and try using whatever data there is in ok-read blocks.

I don't think that asking too many questions is worth it. He who runs fsck
in 
"fix" mode wants his data back (whatever is left of it). Certain things,
like 
recovering the deleted files, may be worth specifying as options, but
typical 
recovery stuff should be w/o questions in my opinion. At least that's what 
I'd expect all fsck's to do.

Cheers, Kuba
