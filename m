From: Kuba Ober <kuba@mareimbrium.org>
Subject: Re: A couple of questions
Date: Thu, 16 May 2002 17:23:42 -0400
Message-ID: <200205161723.42672.kuba@mareimbrium.org>
References: <OF4AF5C20B.BE2F7D18-ON85256BBB.006643F3@pok.ibm.com> <3CE41796.4030404@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-10347-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CE41796.4030404@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

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

Why on earth does a filesystem check & recovery program need to ask questions 
to the user, which most users w/o intimate filesystem knowledge won't be able 
to answer at all? Looking at this list, what people want is to get their data 
back, as much as possible. They never want to get less than that. Why bother 
asking?

That's one thing. Another thing is making fsck work on broken media, since 
that is what many unsuspecting users actually do. It should simply disregard 
read errors and try using whatever data there is in ok-read blocks.

I don't think that asking too many questions is worth it. He who runs fsck in 
"fix" mode wants his data back (whatever is left of it). Certain things, like 
recovering the deleted files, may be worth specifying as options, but typical 
recovery stuff should be w/o questions in my opinion. At least that's what 
I'd expect all fsck's to do.

Cheers, Kuba
