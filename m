From: Ralph Ulrich <eulenreich@gmx.de>
Subject: Re: The reiser4 programming style is recursive?
Date: Thu, 11 Dec 2008 01:09:05 +0100
Message-ID: <49405A21.8030308@gmx.de>
References: <494035ED.4000706@gmx.de>	 <b245135e0812101341k4aa15372ja2f72d0f53a7df77@mail.gmail.com>	 <49403DBE.2070200@gmx.de> <3de056a30812101421p1c86ae57s454ce480a89f055c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <3de056a30812101421p1c86ae57s454ce480a89f055c@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: reiserfs-devel@vger.kernel.org

David Backeberg schrieb:
>> >> Is it true that the programming style of reiser4 is recursive
style and
> >
> > I wouldn't call
> > recursion a "style" so much as an approach to solving a particular
> > problem. I think of "style" being things like whether your curly
> > braces go on the same line or on the next line, how much whitespace
> > you allow between code elements, etc. Perhaps you're just saying that
> > because English isn't your primary language?
Yes , i am german...
But curly braces i would subsumize under "coding style".
In german language the wording "programming" (programmieren)
means looking for the ways of logic, managing the ways
the streams of data go ... etc.

I watched some video of a linux convention. And there a guru
(do not know the name anymore, some weeks ago) mentioned that
programming recursive in the kernel is a absolute no go, every
recursion can also be programmed without. And that is often even
faster. Something like that he said. And for my understandings this
was said against reiser4 even if it was not mentioned.

Ralph
Post Scriptum: As I know recursiveness has more beauty for
programmers like Hans Reiser


