From: Oleg Drokin <green@namesys.com>
Subject: Re: A couple of questions
Date: Thu, 16 May 2002 22:55:30 +0400
Message-ID: <20020516225530.A4142@namesys.com>
References: <OF4AF5C20B.BE2F7D18-ON85256BBB.006643F3@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10345-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <OF4AF5C20B.BE2F7D18-ON85256BBB.006643F3@pok.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Pratt <slpratt@us.ibm.com>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, May 16, 2002 at 01:44:16PM -0500, Steve Pratt wrote:

> One extra question on this.  I assume that if in Fix mode and errors are
> encountered that fsck.resiserfs will prompt to fix each error and that
> there is no way to have it answer 'Yes' automatically like the ext2 -y
> option.

I am unaware of a situation where reiserfsck asks any question in the middle of
repairing.
It may ask for more than one confirmation in the beginning (one of the cases
being when it thinks it may replay a journal, but it is not sure).
But these cases are really the cases where you want to pass the question
to user and get his opinition to pass it to fsck.
I think they all are looks very similar, so you can find them quickly in output
stream (something like some text and then "(y/n):" sequence of characters).

When fs bugs are fixed, this is done without any questions asked,
and though this is somewhat questionable approach, this is how it done at
present.

> If not then I will probably have to take Jonathan Briggs suggestion of a
> third process to answer 'Yes' repeatedly.

This is very dangerous approach. There is exactly one "extra" confirmation,
the one at the beginning, where reiserfsck asks if you really want to run it.
All of the others are really important. (well, may be not all, but most of them
for sure)

Bye,
    Oleg
