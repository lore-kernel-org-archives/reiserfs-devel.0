From: Keven Murphy <murphyk@gdls.com>
Subject: Re: How to user reiser4 and crypt plugin ??
Date: Tue, 28 Jun 2005 11:38:30 -0400 (EDT)
Message-ID: <Pine.GSO.4.58.0506281133260.2602@sysss01h>
References: <Pine.GSO.4.58.0506281054200.2602@sysss01h> <42C16B43.7060706@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24762-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42C16B43.7060706@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward@namesys.com>
Cc: reiserfs-list@namesys.com

Thank you for the reply.

Do you see any issues with using reiser3 or reiser4 file system on a
loop-back encrypted device?

Some of the docs I have found say to stick with ext2 for the filesystem. I
was thinking reiser still would be a better choice.

Thank you for your help,

Keven Murphy
murphyk@gdls.com

Murphy's Law
((U+C+I)x(10-S))/20xAx1/(1-sin(F/10))
U = Urgency    C = Complexity
I = Importance S = Skill
F = Frequency  A = Aggravation

On Tue, 28 Jun 2005, Edward Shishkin wrote:

> Keven Murphy wrote:
>
> >Hello,
> >
> >I have read so much about reiser4 and the crypto plugin. What I have not
> >found is any docs on how to set up a partition using the plugin.
> >
> >
>
> Hello. Crypto transform is unsupported for a while, only compression
> (still not
> for product using). The docs are under  construction.
>
> Thanks,
> Edward.
>
>
> >I have the modules installed and I have created a reiser4 filesystem. I am
> >not sure what I need to do next.
> >
> >Thanks from a reiser newbie,
> >
> >Keven Murphy
> >murphyk@gdls.com
> >
> >Murphy's Law
> >((U+C+I)x(10-S))/20xAx1/(1-sin(F/10))
> >U = Urgency    C = Complexity
> >I = Importance S = Skill
> >F = Frequency  A = Aggravation
> >
> >
> >This is an e-mail from General Dynamics Land Systems. It is for the intended recipient only and may contain confidential and privileged information.  No one else may read, print, store, copy, forward or act in reliance on it or its attachments.  If you are not the intended recipient, please return this message to the sender and delete the message and any attachments from your computer. Your cooperation is appreciated.
> >
> >
> >
> >
>
>


This is an e-mail from General Dynamics Land Systems. It is for the intended recipient only and may contain confidential and privileged information.  No one else may read, print, store, copy, forward or act in reliance on it or its attachments.  If you are not the intended recipient, please return this message to the sender and delete the message and any attachments from your computer. Your cooperation is appreciated.
