From: Javier Marcet <jmarcet@pobox.com>
Subject: Re: Corruptions on every filesystem with 02-reiserfs_file_write.diff.gz
Date: Wed, 21 Aug 2002 18:31:22 +0200
Message-ID: <20020821163122.GA6628@jerry.boludo.cjb.net>
References: <20020820151701.GA15499@jerry.boludo.cjb.net> <20020821101343.B10765@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11271-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020821101343.B10765@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Hi Oleg,
on Wed, 21 Aug 2002 10:13:43 +0000, you wrote:

> > When applying the second of the patches available under
> > reiserfs-for-2.4/2.4.19.pending/testing I get corruptions on any write
> > comitted to ANY filesystem, including ram.
> 
> This is very strange, I cannot reproduce anything even remotely similar to this.
> The only difference I see now is that I compile with gcc 2.95.3
> 
> > I cannot give more specifics than adding that patch, doing a simple test
> > like creating a tar.bz2 out of a folder on my HD (be it SCSI or IDE),
> > produces a corrupt archive; i.e. testing it with 'bzip2 -t' gives a CRC
> > error on the archive.
> 
> Just tried copying several kernel trees, archiving kernel trees and stuff
> and have not seen any corruption.

It is quite odd, indeed.

> > This behaviour was the same with either 2.4.19-pre5-aa1 (aka 2.4.19-aa),
> > 2.4.19 barebone, 2.4.20-pre2, 2.4.20-pre-ac2 ac3 and ac4.
> > In each of them I had applied the corresponding patches of the main
> > 2.4.19.pending dir which had not been previously merged on the kernel.
> 
> You said XFS, does that mean you had XFS patched in too in all cases?

No, that was the first patch I removed - or didn't add, since I began
from scratch again -, since I only wanted to test it and being such a
big piece of code which modified so many things, there were good chances
for it to be the culprit.

> > Let me reinforce the fact that without that I have no problems at all,
> > and reiserfs is working better than ever :)
> 
> We do not create patches to corrupt user's data, we try to enhance what we have
> now, instead.

Of course you do. I do not doubt that.
I like reiserfs, and in spite of a few problems I've had (not directly
related to reiser itself, let's be clear), I use it on all my
partitions, from home where I keep a huge amount of messages in Maildir
format to my video partitions, where I grab my Digital Sat videos with
VDR and convert from MPEG2 to other formats.

> BTW, have anyone else tried these (or other slightly different patches I
> uploaded yesterday) patches and observed any data corruptions?
> 
> Thank you for feedback.

Not at all. It's possible that this patch in question merely crosses a
line in trying to achieve better performance that my system couldn't
manage. A few weeks ago my old processor died, and since then, only now
I begin to have an stable system - with a new processor, that is -.

Anyhow, the corruptions I'm talking about did happen. I was very
skeptical of finding a software solution and began to think I would need
to replace my mobo also. Yet I saw that with my emergency booting CD -
Gentoo's installation cd -, I had no problems of that kind. Hence, I
started going backwards until I found that by not merging the testing
2.4.19 patches, the system worked like a charm. I could create CRC error-free
tar.bz2 archives et all.
I couldn't believe one of those two little patches was causing the
corruptions, but then I merged the testing code again and corruptions
came back.

If you tell me any way to further investigate this situation and find a
possible solution, I'll be glad to. My only fear is running a kernel
with the patch applied for too long. After all I value my date and do
want to keep it safe, not only access to it fast.
